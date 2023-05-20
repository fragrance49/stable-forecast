# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib import admin
from django.urls import path, include  # add this

urlpatterns = [
    # path('admin/', admin.site.urls),
    path("", include("auth_user.urls")),  # add this
    path("", include("app.urls")),  # add this
    
]
