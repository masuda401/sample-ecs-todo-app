from django.contrib import admin

from todo import models


@admin.register(models.Todo)
class TodoAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'description', 'created_at']
    search_fields = ['title']
