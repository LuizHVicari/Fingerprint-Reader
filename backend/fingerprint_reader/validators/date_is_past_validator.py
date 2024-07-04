from datetime import date
from django.core.exceptions import ValidationError


def date_is_past(d):
  if d > date.today():
    raise ValidationError('Date cannot be future')