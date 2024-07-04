from rest_framework import serializers

from fingerprints.models import Baby

class BabySerializerV1(serializers.ModelSerializer):

  class Meta:
    model = Baby
    fields = ['id', 'code', 'birth_date', 'gender', 'created_at', 'updated_at']
    read_only_fields = ['id', 'created_at', 'updated_at']