from factory.django import DjangoModelFactory
import factory
from django.contrib.auth.models import User

from faker_base import faker


class UserFactory(DjangoModelFactory):
    class Meta:
        model = User

    email = factory.LazyAttribute(lambda _: faker.email())
    username = factory.LazyAttribute(lambda _: faker.user_name())
    password = factory.LazyAttribute(lambda _: faker.password())

    is_staff = True
