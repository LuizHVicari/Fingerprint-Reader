from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.auth.models import User

from .baby_model import Baby


class Gathering(models.Model):
  fingerprint = models.ImageField()
  months = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(12)])
  baby = models.ForeignKey(Baby, on_delete=models.PROTECT)
  user = models.ForeignKey(User, on_delete=models.PROTECT)

  created_at = models.DateTimeField(auto_now=True)
  updated_at = models.DateTimeField(auto_now_add=True)

  def __str__(self):
    return f'{self.baby.code} in {self.created_at.date}'
