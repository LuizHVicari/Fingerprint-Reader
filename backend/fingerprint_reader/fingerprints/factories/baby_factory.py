from factory.django import DjangoModelFactory
import factory
from random import choice

from faker_base import faker
from fingerprints.models import Baby


class BabyFactory(DjangoModelFactory):
  class Meta:
    model = Baby
  
  code = factory.LazyAttribute(lambda _: faker.name()[:40])
  birth_date = factory.LazyAttribute(lambda _: faker.past_date())
  gender = factory.LazyAttribute(lambda _: choice(('M', 'F')))