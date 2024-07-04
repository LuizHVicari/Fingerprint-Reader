from django.test import TestCase
from fingerprints.models import Baby
from django.urls import reverse
from datetime import date, timedelta
from django.core.exceptions import ValidationError

from fingerprints.factories import BabyFactory


class BabyModelTest(TestCase):
  def setUp(self):
    self.baby1 = BabyFactory()
    self.baby2 = BabyFactory()

    for _ in range(10):
      BabyFactory()

  
  def test_create_new_baby(self):
    baby = Baby(
      code = '1234',
      birth_date = date.today(),
      gender = 'M'
    )
    baby.full_clean()
    baby.save()

    self.assertEqual(Baby.objects.count(), 13)


  def test_cannot_create_baby_with_same_code(self):
    with self.assertRaises(ValidationError):
      baby = Baby(
        code = self.baby1.code,
        birth_date = date.today(),
        gender = 'F'
      )
      baby.full_clean()
      baby.save()

    self.assertEqual(Baby.objects.count(), 12)

  
  def test_birthday_not_informed_should_be_today(self):
    baby = Baby(
      code = '1234',
      gender = 'F'
      )
    baby.full_clean()
    baby.save()

    self.assertEqual(Baby.objects.count(), 13)
    self.assertEqual(baby.birth_date, date.today())

  
  def test_gender_can_only_be_either_male_or_female(self):
    with self.assertRaises(ValidationError):
      baby = Baby(
        code = self.baby1.code,
        birth_date = date.today(),
        gender = 'G'
      )
      baby.full_clean()
      baby.save()

    self.assertEqual(Baby.objects.count(), 12)

  
  def test_can_update_baby(self):
    self.baby1.code = '1234'
    self.baby1.birth_date = date.today() - timedelta(days=1)
    new_gender = 'M' if self.baby1.gender == 'F' else 'F'
    self.baby1.gender = new_gender
    self.baby1.full_clean()
    self.baby1.save()

    id = self.baby1.id

    baby = Baby.objects.get(pk=id)

    self.assertEqual(baby.code, '1234')
    self.assertEqual(baby.birth_date, date.today() - timedelta(days=1))
    self.assertEqual(baby.gender, new_gender)

  def test_can_delete_baby(self):
    self.baby1.delete()

    self.assertEqual(Baby.objects.count(), 11)