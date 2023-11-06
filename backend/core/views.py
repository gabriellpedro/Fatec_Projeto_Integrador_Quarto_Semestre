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
            