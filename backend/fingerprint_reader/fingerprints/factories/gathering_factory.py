from factory.django import DjangoModelFactory, ImageField
import factory
from random import choice

from faker_base import faker
from fingerprints.models import Gathering
from fingerprints.factories import BabyFactory, UserFactory


class GatheringFactory(DjangoModelFactory):
  class Meta:
    model = Gathering
  
  fingerprint = ImageField(color=faker.hex_color())
  baby = factory.SubFactory(BabyFactory)
  user = factory.SubFactory(UserFactory)
  months = factory.LazyAttribute(lambda _: faker.random_int(0, 12))