from recicle_apis_consume.libs.litorallimpo_class import LitoralLimpoAPI
from recicle_apis_consume.recicle_atlas.libs.recicle_atlas_class import RecicleAtlas
from django.shortcuts import render, redirect, HttpResponseRedirect
from rest_framework.response import Response
from rest_framework.views import APIView


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
