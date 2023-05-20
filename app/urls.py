# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from django.urls import path, re_path
from app import views

urlpatterns = [
    # The home page
    path('', views.index, name='home'),
    path('homepage/', views.homepage, name='homepage'),
    path('services/', views.services, name='services'),
    path('weather_lab/', views.weather_lab, name='weather_lab'),
    path('lab_pro/', views.lab_pro, name='lab_pro'),
    path('lab_basic/', views.lab_basic, name='lab_basic'),
    path('contact_us/', views.contact_us, name='contact_us'),
    path('current_weather/', views.current_weather, name='current_weather'),
    path('historical_weather/', views.historical_weather, name='historical_weather'),
    path('forecast_weather/', views.forecast_weather, name='forecast_weather'),

    # The admin page
    path('admin/', views.admin_index, name='admin'),
    path("admin/profile/", views.profile, name="profile"),
    path('admin/weather/', views.weather, name='weather'),
    path('admin/user_table/', views.user_table, name='user_table'),
    path('admin/create_user/', views.create_user, name='create_user'),    
    path('admin/update_user/<int:id>', views.update_user, name='update_user'),    
    path('admin/delete_user/<int:id>', views.delete_user, name='delete_user'),    
    path('admin/gallery_view/', views.gallery_view, name ='gallery_view'),
    # re_path(r'^google-maps/', views.google_maps, name='google-maps'),


    # Matches any html file - to be used for gentella
    # Avoid using your .html in your resources.
    # Or create a separate django app.
    re_path(r'^.*\.*', views.pages, name='pages'),

]
