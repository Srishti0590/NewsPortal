from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, models
from django.forms import ModelForm

from accounts.models import Profile


class LoginForm(forms.Form):
    username= forms.CharField()
    password= forms.CharField(widget=forms.PasswordInput)


class ProfileForm(ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'
        exclude = ['user', 'username','email']


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

#
# class ContactForm(ModelForm):
#     class Meta:
#         model = User
#         fields = ['fullname', 'email', 'phone', 'feedback']