from django import forms
from auth_user.models import CustomUser
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

class ContactForm(UserCreationForm):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder" : "Username",                
                "class": "form-control"
            }
        ))
    email = forms.EmailField(
        widget=forms.EmailInput(
            attrs={
                "placeholder" : "Email",                
                "class": "form-control"
            }
        ))
    find_id = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder" : "Find ID",                
                "class": "form-control"
            }
        ))
    password1 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder" : "Password",                
                "class": "form-control"
            }
        ))
    password2 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder" : "Password check",                
                "class": "form-control"
            }
        ))

    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'find_id', 'password1', 'password2')

class UpdateForm(UserChangeForm):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder" : "Username",                
                "class": "form-control"
            }
        ))
    email = forms.EmailField(
        widget=forms.EmailInput(
            attrs={
                "placeholder" : "Email",                
                "class": "form-control"
            }
        ))
    find_id = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder" : "Find ID",                
                "class": "form-control"
            }
        ))
    

    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'find_id')