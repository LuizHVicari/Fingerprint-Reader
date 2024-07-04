from rest_framework import permissions


class UserIsCreator(permissions.BasePermission):
  def has_object_permission(self, request, view, obj):
    if request.user.is_superuser:
      return True
    if obj.user == request.user: 
        return True
    return False