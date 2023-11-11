from recicle_apis_consume.recicle_atlas.libs.recicle_atlas_class import RecicleAtlas
from country_apis_consume.libs.states_information_class import StateInformation
from recicle_apis_consume.libs.litorallimpo_class import LitoralLimpoAPI
from django.shortcuts import render, redirect, HttpResponseRedirect
from django.views.decorators.csrf import ensure_csrf_cookie
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from django.contrib.auth.models import auth
from rest_framework.views import APIView
from django.http import JsonResponse
from core.forms import UserForm
import plotly.express as px
from .models import User
import pandas as pd
import requests
from django.contrib.auth.decorators import login_required
from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated



class RecicleMaterialsStatisticsView(APIView):
    """
        View used to extract information about 
        statistics on recicled material from 
        all the states from brasil
    """
    # authentication_classes = [SessionAuthentication, TokenAuthentication]
    # permission_classes = [IsAuthenticated]

    def get(self, request):
        object_ = RecicleAtlas()
        state_information = StateInformation()
        state_information.extract_states()
        object_.extract_information_about_recicles()
        object_.treat_data_state()
        temp_list = list()
        for state in object_.by_state.keys():
            possible_state = object_.by_state[state]
            possible_state['state'] = state
            temp_list.append(possible_state)
        object_.all_materials = temp_list
        for state in object_.all_materials:
            state_occurrence = state_information.by_state[state['state']]
            state.update(state_occurrence)
        return Response(object_.all_materials)

class RecicleMaterialsStatisticsViewByState(APIView):
    """
        View used to extract information about 
        statistics on recicled material from 
        all the states from brasil
    """
    def get(self, request, state: str or None):
        recicle_atlas = RecicleAtlas()
        recicle_atlas.extract_information_about_recicles()
        recicle_atlas.treat_data_state()
        occurrence_by_state = dict()
        for city in recicle_atlas.by_city.keys():
            recicle_atlas.by_city[city]['city'] = city
            try:
                occurrence_by_state[recicle_atlas.by_city[city].get('state', str())].append(recicle_atlas.by_city[city])
            except KeyError:
                occurrence_by_state[recicle_atlas.by_city[city].get('state', str())] = [recicle_atlas.by_city[city]]
        return Response(occurrence_by_state[state])

# class RecicleMaterialsSByState(APIView):
#     """
#         View used to extract information about 
#         statistics on recicled material from 
#         all the states from brasil
#     """
#     def get(self, request):
#         object_ = RecicleAtlas()
#         state_information = StateInformation()
#         state_information.extract_states()
#         object_.extract_information_about_recicles()
#         object_.treat_data_state()
#         temp_list = list()
#         for state in object_.by_state.keys():
#             possible_state = object_.by_state[state]
#             possible_state['state'] = state
#             temp_list.append(possible_state)
#         object_.all_materials = temp_list
#         for state in object_.all_materials:
#             state_occurrence = state[state_occurrence['state']]
#             state.update(state_occurrence)
#         return Response(object_.all_materials)

class RecicleMaterialsView(APIView):
    """
        View used to extract information about 
        mesure unit and prices from recile materials
    """
    def get(self, request):
        object_ = LitoralLimpoAPI()
        object_.extract_materials()
        return Response(object_.all_materials)
    
class RecicleMaterialsGraphView(APIView):
    '''
        View used to generate graphs with the Pltoly library
    '''

    def get(self, request):

        api_url = 'http://localhost:8000/materials/getstatistics/'

        response = requests.get(api_url)

        if response.status_code == 200:
            data = response.json()

        df = pd.DataFrame(data)

        for state in df['state']:
            if state == 'RJ':
                state_data = df[df['state'] == state]
                graph = px.histogram(state_data, y='state', x=['paper', 'plastic', 'glass', 'steel', 'cooperatives'],
                            title=f'Gráfico de Materiais em {state}')

                graph = graph.to_json()

                return JsonResponse(graph)


class RegisterUser(APIView):
    """
        Class used to register users and
        performe login. 
    """

    def get(self, request, format=None):
        """
        Return a list of all users.
        """
        usernames = [user.username for user in User.objects.all()]
        return Response(usernames)

    def post(self, request, format=None):
        post_data = request.POST.copy()
        user_form = UserForm(post_data)
        if user_form.is_valid():
            context = {'user_form': user_form}
            if user_form.clean_password() == user_form.clean_confirm_password():
                if User.objects.filter(email=user_form.clean_email()).exists():
                    return Response({'errors': 'Email não disponível'})
                else:
                    user_form.cleaned_data.pop('confirm_password')
                    user_registration = User.objects.create_user(**user_form.cleaned_data)
                    user_registration.save()
                    return Response([{'errors': 'None'}])
            else:
                return Response([{'errors': 'Senhas não coincidem'}])
        else:
            return Response([{'errors': user_form.errors}])

class AuthLoginView(APIView):
    """
    Class used to perform user login and obtain authentication token.
    """

    def get(self, request, format=None):
        """
        Return a list of all users.
        """
        usernames = [user.username for user in User.objects.all()]
        return Response([usernames])

    def post(self, request, format=None):
        email = request.data.get('email')
        password = request.data.get('password')
        user = auth.authenticate(request, email=email, password=password)

        if user is not None:
            auth.login(request, user)
            token, created = Token.objects.get_or_create(user=user)
            return Response({'isLogged': True, 'token': token.key})
        else:
            return Response({'errors': 'Senha ou usuários inválido'}, status=status.HTTP_401_UNAUTHORIZED)

    def put(self, request, format=None):
        auth.logout(request)
        return Response({'isLogged': False})
