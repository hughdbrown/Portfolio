#!/usr/bin/env python

from django.contrib import admin
from portfolio.work.models import *

class ProjectAdmin(admin.ModelAdmin):
    list_filter = ('name', )
    ordering = ('-completion_date',)

class ImageListAdmin(admin.ModelAdmin):
    pass
    #list_filter = ('name', )
    #ordering = ('name',)

admin.site.register(Project, ProjectAdmin)
admin.site.register(ImageList, ImageListAdmin)
