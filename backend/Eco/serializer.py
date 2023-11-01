from rest_framework import serializers
from .models import *


class MaterialsSerializer(serializer.ModelSerializer):
	class Meta:
		model = MaterialsbyState
		fields = ['state', 'paper', 'plastic', 'glass', 'steel', 'cooperatives']
