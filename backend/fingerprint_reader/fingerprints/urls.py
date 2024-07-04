from django.urls import path, include

from fingerprints.views import BabyListCreate, GatheringListCreate


baby_urls = [
  path('', BabyListCreate.as_view(), name='list-create-baby'),
]

gathering_urls = [
  path('', GatheringListCreate.as_view(), name='list-create-gathering')
]

urlpatterns = [
  path('babys/', include(baby_urls)),
  path('gatherings/', include(gathering_urls))
]
