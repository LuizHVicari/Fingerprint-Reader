from django.contrib import admin

from fingerprints.models import Baby, Gathering


@admin.register(Baby)
class BabyAdmin(admin.ModelAdmin):
  list_display = ['code', 'birth_date', 'gender' , 'created_at', 'updated_at',]
  sortable_by = ['created_at', ]
  list_filter = ['gender', ]
  

@admin.register(Gathering)
class GatheringAdmin(admin.ModelAdmin):
  list_display = ['baby', 'months', 'user', 'created_at', 'updated_at',]
  sortable_by = ['created_at']
  list_filter = ['baby', 'user', 'baby__gender']