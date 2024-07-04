from rest_framework.generics import ListCreateAPIView
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from fingerprints.models import Baby
from fingerprints.serializers import BabySerializerV1


most_recent_serializer = BabySerializerV1


class BabyListCreate(ListCreateAPIView):
  permission_classes = [IsAuthenticated, ]

  def get_queryset(self):
    queryset = Baby.objects.all()
    return queryset
  

  def get_serializer_class(self):
    if self.request.version == 'v1':
      return BabySerializerV1
    return most_recent_serializer