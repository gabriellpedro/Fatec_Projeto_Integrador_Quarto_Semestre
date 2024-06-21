from rest_framework import serializers

from core.models import EcoPontoLocation

class MaterialSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    created_at = serializers.DateTimeField()
    last_updated = serializers.DateTimeField()
    price = serializers.FloatField()
    name = serializers.CharField()
    mesure_unity = serializers.CharField()
    is_active = serializers.BooleanField()

class BalanceSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    date_balance = serializers.DateTimeField()
    user_id_occurrence = serializers.IntegerField()
    mesure = serializers.FloatField()
    is_active = serializers.BooleanField()
    material = MaterialSerializer()

class UserOperationSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    created_at = serializers.DateTimeField()
    user_id = serializers.IntegerField()
    total = serializers.FloatField()
    operation_type = serializers.IntegerField()
    balances = BalanceSerializer(many=True)

class EcoPontoLocationSerializer(serializers.Serializer):
    created_at = serializers.DateTimeField()
    name = serializers.CharField()
    material_list = serializers.CharField()
    latitude = serializers.CharField()
    longitude = serializers.CharField()
    street = serializers.CharField()
    place_number = serializers.IntegerField()
    neighborhood = serializers.CharField()
    city = serializers.CharField()
    state = serializers.CharField()
    cep = serializers.CharField()