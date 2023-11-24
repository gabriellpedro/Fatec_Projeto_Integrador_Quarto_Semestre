from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from recicle_apis_consume.recicle_atlas.libs.recicle_atlas_class import RecicleAtlas
from country_apis_consume.libs.states_information_class import StateInformation
from recicle_apis_consume.libs.litorallimpo_class import LitoralLimpoAPI
from django.shortcuts import render, redirect, HttpResponseRedirect
from django.views.decorators.csrf import ensure_csrf_cookie
from core.storage.recycle_balance_class import RecycleBalanceStorage
from rest_framework.permissions import IsAuthenticated
from core.storage.materials_class import Materials
from rest_framework.authtoken.models import Token
from core.storage.user_class import UserStorage
from rest_framework.response import Response
from django.contrib.auth.models import auth
from rest_framework.views import APIView
from django.http import JsonResponse
from rest_framework import status
from .models import RecycleBalance
from .models import RecycleBalanceOccurrence
from .models import OperationsBalance
from core.forms import UserForm
import plotly.express as px
from .models import User
import pandas as pd
import requests
from django.contrib.auth.decorators import login_required


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

class RecicleMaterialsView(APIView):
    """
        View used to extract information about 
        mesure unit and prices from recile materials
    """
    def get(self, request):
        object_ = Materials()
        possible_materials = request.GET.get('material_search')
        if possible_materials:
            possible_result = object_.get_by_name(possible_materials)
            if not possible_result or len(possible_result) == 0:
                return Response([{'errors': 'Material não encontrado'}])
            return Response(possible_result)
        else:
            return Response(object_.run())
    
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
        user_form = UserForm(request.data)
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
                return Response([{'errors': 'Senhas não coincidem'}], status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response([{'errors': user_form.errors}], status=status.HTTP_400_BAD_REQUEST)

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
        print(email, password)
        user = auth.authenticate(request, email=email, password=password)

        if user is not None:
            auth.login(request, user)
            token, created = Token.objects.get_or_create(user=user)
            return Response({'isLogged': True, 
                            'token': token.key,
                            'user_id': user.id, 
                            'email': user.email,
                            'username': user.name,})
        else:
            return Response({'errors': 'Senha ou usuários inválido'}, status=status.HTTP_401_UNAUTHORIZED)

class AuthLogoutView(APIView):
    """
    Class used to perform user logout.
    """

    def post(self, request, format=None):
        auth.logout(request)
        return Response({'isLogged': False})


class UserSearch(APIView):
    """
        Class used to search by
        User using the storage
    """
    def get(self, request):
        email = request.GET.get('email')
        print(f'Yes, this is the email: {email}')
        if email:
            object_ = UserStorage(email)
            possible_user = object_.get_by_email(email)
            if possible_user:
                return Response([possible_user])
            else:
                return Response([{'errors': 'Usuário não encontrado'}])
        else:
            return Response([{'errors': 'Necessário enviar um email válido'}])


class RecycleBalanceView(APIView):
    """
        Class used to receive a recyclebalance
        operation, linking a user to a sell occurrence
    """
    def post(self, request):
        user_id = request.POST.get('user_id_occurrence')
        material_id = request.POST.get('material_id')
        mesure = request.POST.get('mesure')
        errors = {'errors': list()}
        if not user_id:
            errors['errors'].append('Necessário enviar um Usuário Válido')
        if not material_id:
            errors['errors'].append('Necessário enviar um Material Válido')
        if not mesure:
            errors['errors'].append('Necessário enviar uma Medida Válido')
        object_ = UserStorage()
        object_material = Materials()
        possible_user = object_.get_by_id(user_id)
        possible_material = object_material.get_by_id(material_id)
        if not possible_user:
            errors['errors'].append('Usuário não encontrado')
        if not possible_material:
            errors['errors'].append('Material não encontrado')
        if mesure:
            try:
                mesure = float(mesure.replace(',', '.'))
                if not mesure > 0:
                    errors['errors'].append('Medida precisa ser maior que zero')
            except (TypeError, ValueError):
                errors['errors'].append('Medida precisa ser do tipo Flutuante')
        if len(errors['errors']) > 0:
           return Response([errors])
        recicle_balance_occurrence = RecycleBalance(
            user_id_occurrence=user_id,
            material_id=material_id,
            mesure=mesure).save()
        return Response([errors], status=status.HTTP_201_CREATED)

    def get(self, request):
        user_id = request.GET.get('user_id_occurrence')
        print(user_id)
        if not user_id:
            return Response([{'errors': 'Necessário enviar um usuário válido'}])
        object_ = RecycleBalanceStorage()
        return Response([object_.get_activate_by_user_id(user_id)])

    def put(self, request):
        alterable_keys = [mesure, is_active]
        id_ = request.POST.get('recycle_balance_id')
        mesure = request.POST.get('mesure')
        is_active = request.POST.get('is_active')
        if mesure:
            try:
                mesure = float(mesure.replace(',', '.'))
                if not mesure > 0:
                    errors['errors'].append('Medida precisa ser maior que zero')
            except (TypeError, ValueError):
                errors['errors'].append('Medida precisa ser do tipo Flutuante')
        if not id_:
            errors['errors'].append('Necessário adicionar o id da ocorrência da balança')
            return Response([errors])
        object_ = RecycleBalanceStorage()
        recicle_balance_occurrence = object_.get_by_id(id_, True)
        if not recicle_balance_occurrence:
            return Response([{'errors': 'Não foi possível encontrar a ocorrência da balança'}])
        if len(errors['errors']) > 0:
           return Response([errors])
        has_changes = bool()
        if mesure and not mesure != recicle_balance_occurrence.mesure:
            errors['errors'].append('Medida igual a anterior')
        elif mesure:
            recicle_balance_occurrence.mesure = mesure
            has_changes = True
        if is_active and not is_active != recicle_balance_occurrence.is_active:
            errors['errors'].append('Medida igual a anterior')
        elif is_active:
            recicle_balance_occurrence.is_active = is_active
            has_changes = True
        if len(errors['errors']) > 0:
           return Response([errors])
        elif has_changes:
            recicle_balance_occurrence.save()
            return Response([errors], status=status.HTTP_204_NO_CONTENT)

class OperationsBalanceView(APIView):
    """
        Class responsible to get all active
        RecycleBalance occurrences and build one
        client operation, and inactivate the recycle
        balance occurrences
    """
    def post(self, request):
        user_id = request.POST.get('user_id_occurrence')
        errors = {'errors': list()}
        if not user_id:
            errors['errors'].append('Necessário enviar um Usuário Válido')
        object_ = RecycleBalanceStorage()
        user_open_list = object_.get_activate_by_user_id(user_id)
        object_user = UserStorage()
        if not len(user_open_list.keys()) > 0:
            return Response([{'errors': 'Usuário não possui lista aberta'}])
        if len(errors['errors']) > 0:
           return Response([errors])
        recyle_balance_occurrences = list()
        for recycle_balance in user_open_list['recicle_balance_array']:
            recyle_balance_occurrence = {'recycle_balance_id': recycle_balance['id']}
            control = object_.deactivate_recycle_balance_occurrence(recycle_balance['id'])
            recyle_balance_occurrences.append(recyle_balance_occurrence)
        if len(recyle_balance_occurrences) > 0:
            _ = OperationsBalance(
                user_id=user_id,
                total=user_open_list['final_value'],
                operation_type=1,
                balance_ids=recyle_balance_occurrences).save()
            _ = object_user.alter_user_value(user_id, user_open_list['final_value'], 1)
            return Response([{'errors': 'Operação Finalizada'}], status=status.HTTP_204_NO_CONTENT)
        else:
            return Response([{'errors': 'Usuário não possui ocorrências na Balança'}])


class UserControlView(APIView):
    """
        Class used to return the
        users amount
    """
    def get(self, request):
        user_id = request.GET.get('user_id_occurrence')
        errors = {'errors': list()}
        if not user_id:
            errors['errors'].append('Necessário enviar um Usuário Válido')
        if len(errors['errors']) > 0:
           return Response([errors])    
        object_user = UserStorage()
        possible_user = object_user.get_by_id_control(user_id)
        if possible_user:
            return Response([possible_user])
        else:
            return Response([{'errors': 'Usuário não encontrado ou não possui nenhuma operação'}])
