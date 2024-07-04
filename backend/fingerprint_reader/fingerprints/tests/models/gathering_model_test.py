from django.test import TestCase
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
from django.db.models.deletion import ProtectedError
import tempfile

from fingerprints.factories import GatheringFactory
from fingerprints.models import Gathering, Baby
from faker_base import faker



class GatheringModelTest(TestCase):
  def setUp(self):
    self.gathering1 = GatheringFactory()
    self.gathering2 = GatheringFactory()

    for _ in range(10):
      GatheringFactory()


  def test_can_create_new_gathering_factory(self):
    gathering = Gathering(
      fingerprint=tempfile.NamedTemporaryFile(suffix='jpg').name,
      baby=self.gathering1.baby,
      user=self.gathering1.user,
      months=12
    )
    gathering.full_clean()
    gathering.save()

    self.assertEqual(Gathering.objects.count(), 13)

  
  def test_cannot_create_gathering_with_more_than_12_months(self):
    with self.assertRaises(ValidationError):
      gathering = Gathering(
        fingerprint=tempfile.NamedTemporaryFile(suffix='jpg').name,
        baby=self.gathering1.baby,
        user=self.gathering1.user,
        months=13
      )
      gathering.full_clean()
      gathering.save()

    self.assertEqual(Gathering.objects.count(), 12)


  def test_cannot_create_gathering_with_less_than_0_months(self):
    with self.assertRaises(ValidationError):
      gathering = Gathering(
        fingerprint=tempfile.NamedTemporaryFile(suffix='jpg').name,
        baby=self.gathering1.baby,
        user=self.gathering1.user,
        months=-1
      )
      gathering.full_clean()
      gathering.save()

    self.assertEqual(Gathering.objects.count(), 12)


  def test_cannot_create_gathering_without_user(self):
    with self.assertRaises(ValidationError):
      gathering = Gathering(
        fingerprint=tempfile.NamedTemporaryFile(suffix='jpg').name,
        baby=self.gathering1.baby,
        months=4
      )
      gathering.full_clean()
      gathering.save()
    
    self.assertEqual(Gathering.objects.count(), 12)

  
  def test_cannot_create_gathering_without_image(self):
    with self.assertRaises(ValidationError):
      gathering = Gathering(
        user=self.gathering1.user,
        baby=self.gathering1.baby,
        months=4
      )
      gathering.full_clean()
      gathering.save()
    
    self.assertEqual(Gathering.objects.count(), 12)


  def test_cannot_create_gathering_without_baby(self):
    with self.assertRaises(ValidationError):
      gathering = Gathering(
        fingerprint=tempfile.NamedTemporaryFile(suffix='jpg').name,
        user=self.gathering1.user,
        months=4
      )
      gathering.full_clean()
      gathering.save()
    
    self.assertEqual(Gathering.objects.count(), 12)

  
  def test_cannot_create_gathering_without_months(self):
    with self.assertRaises(ValidationError):
      gathering = Gathering(
        fingerprint=tempfile.NamedTemporaryFile(suffix='jpg').name,
        user=self.gathering1.user,
        baby=self.gathering1.baby,
      )
      gathering.full_clean()
      gathering.save()
    
    self.assertEqual(Gathering.objects.count(), 12)

  
  def test_can_update_gathering(self):
    self.gathering1.fingerprint = tempfile.NamedTemporaryFile(suffix='jpg').name
    self.gathering1.months = self.gathering1.months + 1 if self.gathering1.months != 12 else 1  
    self.gathering1.baby = self.gathering2.baby
    self.gathering1.user = self.gathering2.user

    self.gathering1.full_clean()
    self.gathering1.save()

    id = self.gathering1.id

    self.assertEqual(Gathering.objects.get(pk=id).fingerprint, self.gathering1.fingerprint)
    self.assertEqual(Gathering.objects.get(pk=id).months, self.gathering1.months)
    self.assertEqual(Gathering.objects.get(pk=id).baby, self.gathering2.baby)
    self.assertEqual(Gathering.objects.get(pk=id).user, self.gathering2.user)


  def test_can_delete_gathering(self):
    self.gathering1.delete()
    self.assertEqual(Gathering.objects.count(), 11)

  
  def test_cannot_delete_baby_with_gatherings(self):
    with self.assertRaises(ProtectedError):
      self.gathering1.baby.delete()
    self.assertEqual(Baby.objects.count(), 12)


  def test_cannot_delete_user_with_gatherings(self):
    with self.assertRaises(ProtectedError):
      self.gathering1.user.delete()
    self.assertEqual(User.objects.count(), 12)