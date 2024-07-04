from rest_framework import permissions
from django.contrib.auth.models import User


class UserIsCreator(permissions.BasePermission):
  def has_object_permission(self, request, view, obj):
    if request.user.user.is_superuser:
      return True
    return False