from rest_framework.generics import ListCreateAPIView
from rest_framework.permissions import IsAuthenticated

from fingerprints.models import Gathering
from fingerprints.serializers import GatheringSerializerV1
from permissions import UserIsCreator


most_recent_serializer = GatheringSerializerV1


class GatheringListCreate(ListCreateAPIView):
  permission_classes = [IsAuthenticated, UserIsCreator ]

  def get_queryset(self):
    queryset = Gathering.objects.filter(user=self.request.user)
    return queryset
  

  def get_serializer_class(self):
    if self.request.version == 'v1':
      return GatheringSerializerV1
    return most_recent_serializer
  

  def get_serializer_context(self):
    context = super().get_serializer_context()
    context['request'] = self.request
    return context
