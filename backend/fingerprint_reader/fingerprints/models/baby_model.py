from django.db import models
from datetime import date

from validators import date_is_past


GENDER_CHOICES = {
  'M': 'masculino',
  'F': 'feminino'
  }


class Baby(models.Model):
  code = models.CharField(max_length=14, unique=True)
  birth_date = models.DateField(default=date.today, validators=[date_is_past])
  gender = models.CharField(choices=GENDER_CHOICES, max_length=1)

  created_at = models.DateTimeField(auto_now=True)
  updated_at = models.DateTimeField(auto_now_add=True)


  def __str__(self):
    return self.code