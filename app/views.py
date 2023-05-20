# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404, redirect
from django.template import loader
from django.http import HttpResponse
from django import template
from auth_user.models import CustomUser
from app.forms import ContactForm
from app.forms import UpdateForm



def index(request):
    return render(request, "home/weather_index.html")


def homepage(request):
    return render(request, "home/weather_index.html")

def services(request):
    return render(request, "home/services.html")
def weather_lab(request):
    return render(request, "home/weather_lab.html")

def lab_pro(request):
    return render(request, "home/lab_pro.html")
def lab_basic(request):
    return render(request, "home/lab_basic.html")

def current_weather(request):
    return render(request, "home/current_weather.html")

def historical_weather(request):
    return render(request, "home/historical_weather.html")
def forecast_weather(request):
    context ={}
    context["hours"] = range(0,48)
    return render(request, "home/forecast_weather.html", context)

def contact_us(request):
    return render(request, "home/contact_us.html")




@login_required(login_url="/login/")
def admin_index(request):       
    return render(request, "admin/index.html")

@login_required(login_url="/login/")
def profile(request):
    return render(request, "admin/profile.html")

@login_required(login_url="/login/")
def weather(request):
    return render(request, "admin/weather.html")


@login_required(login_url="/login/")
def user_table(request):
    context ={}
    context["dataset"] = CustomUser.objects.all() 
    return render(request, "admin/basic-table.html", context)

@login_required(login_url="/login/")
def create_user(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('user_table')
    form = ContactForm()

    return render(request,'admin/create_user.html',{'form': form})



@login_required(login_url="/login/")
def update_user(request, id):    
    context ={}   
    obj =CustomUser.objects.get(id = id) 
    form = UpdateForm(request.POST or None, instance = obj)   
  
    if form.is_valid(): 
        form.save() 
        return redirect('user_table')
  
    context["form"] = form   
    return render(request, "admin/update_user.html", context) 

@login_required(login_url="/login/")  
def delete_user(request, id):    
    CustomUser.objects.get(id = id).delete()    
    return redirect('user_table')




@login_required(login_url="/login/")
def gallery_view(request):
    return render(request, 'admin/gallery.html')


@login_required(login_url="/login/")
def pages(request):
    context = {}
    # All resource paths end in .html.
    # Pick out the html file name from the url. And load that template.
    try:
        
        load_template = request.path.split('/')[-1]
        html_template = loader.get_template( load_template )
        return HttpResponse(html_template.render(context, request))
        
    except template.TemplateDoesNotExist:

        html_template = loader.get_template( 'admin/error.html' )
        return HttpResponse(html_template.render(context, request))

    except:
    
        html_template = loader.get_template( 'admin/error.html' )
        return HttpResponse(html_template.render(context, request))
