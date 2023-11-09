from django.http import JsonResponse
import requests
from recicle_apis_consume.libs.litorallimpo_class import LitoralLimpoAPI
from recicle_apis_consume.recicle_atlas.libs.recicle_atlas_class import RecicleAtlas
from django.shortcuts import render, redirect, HttpResponseRedirect
from rest_framework.response import Response
from rest_framework.views import APIView
import pandas as pd
import plotly.express as px


class RecicleMaterialsStatisticsView(APIView):
    """
        View used to extract information about 
        statistics on recicled material from 
        all the states from brasil
    """


    def get(self, request):
        recicle_atlas = RecicleAtlas()
        recicle_atlas.extract_information_about_recicles()
        recicle_atlas.treat_data_state()
        temp_list = list()
        for state in recicle_atlas.by_state.keys():
            possible_state = recicle_atlas.by_state[state]
            possible_state['state'] = state
            temp_list.append(possible_state)
        recicle_atlas.all_materials = temp_list
        return Response(recicle_atlas.all_materials)

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

class RecicleMaterialsSByState(APIView):
    """
        View used to extract information about 
        statistics on recicled material from 
        all the states from brasil
    """
    def get(self, request):
        object_ = RecicleAtlas()
        object_.extract_information_about_recicles()
        object_.treat_data_state()
        temp_list = list()
        for state in object_.by_state.keys():
            possible_state = object_.by_state[state]
            possible_state['state'] = state
            temp_list.append(possible_state)
        object_.all_materials = temp_list
        return Response(object_.all_materials)

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
            