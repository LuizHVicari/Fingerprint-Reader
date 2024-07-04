from rest_framework import serializers

from fingerprints.models import Gathering


class GatheringSerializerV1(serializers.ModelSerializer):

  class Meta:
    model = Gathering
    fields = ['id', 'fingerprint', 'baby', 'months', 'created_at', 'updated_at']
    read_only_fields = ['id', 'user', 'created_at', 'updated_at']

  def create(self, validated_data):
    user = self.context['request'].user
    gathering = Gathering(
      fingerprint=validated_data['fingerprint'],
      baby=validated_data['baby'],
      user=user,
      months=validated_data['months']
    )

    gathering.full_clean()
    gathering.save()
    return gathering
    