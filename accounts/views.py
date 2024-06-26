from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.contrib.auth.forms import User
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib import messages
from .forms import LoginForm, ProfileForm, CreateUserForm
from accounts.auth import unauthenticated_user, admin_only, user_only
from django.contrib.auth.decorators import login_required
from news.models import Advertisement
from .models import Profile


@user_only
def homepage(request):
    advertisements = Advertisement.objects.all()
    context = {
        'advertisements':advertisements
    }
    return render(request, 'accounts/homepage.html', context)


@login_required
def logout_user(request):
    logout(request)
    return redirect('/login')

@unauthenticated_user
def login_user(request):
    if request.method == "POST":
        form= LoginForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            user = authenticate(request, username=data['username'], password=data['password'])
            print(user)
            if user is not None:
                if user.is_staff:
                    login(request, user)
                    return redirect('/admins/dashboard')
                elif not user.is_staff:
                    login(request, user)
                    return redirect('/home')

            else:
                messages.add_message(request, messages.ERROR, "Invalid login")
                return render(request, 'accounts/login.html', {'form_login':form})
    context={
        'form_login': LoginForm,
        'activate_login': 'active'
    }
    return render(request, 'accounts/login.html', context)

@unauthenticated_user
def register_user(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            Profile.objects.create(user=user, username=user.username)
            messages.add_message(request, messages.SUCCESS, 'User registered successfully')
            return redirect('/login')
        else:
            messages.add_message(request, messages.ERROR, 'Unable to register user')
            return render(request, 'accounts/register.html', {'form_register': form})
    context = {
        'form_register': CreateUserForm,
        "activate_register": 'active'
    }
    return render(request, 'accounts/register.html', context)

@login_required
@admin_only
def change_password(request):
    if request.method == "POST":
        form = PasswordChangeForm(request.user,request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.add_message(request, messages.SUCCESS, 'Password Changed Successfully')
            if request.user.is_staff:
                return redirect('accounts/password_change.html/')
            else:
                return redirect('accounts/homepage.html')
        else:
            messages.add_message(request, messages.ERROR, 'Please verify the form fields')
            return render(request, 'accounts/password_change.html', {'password_change_form':form})
    context = {
        'password_change_form':PasswordChangeForm(request.user)
    }

    return render(request, 'accounts/password_change.html/', context)

@login_required
@user_only
def profile(request):
    profile = request.user.profile
    if request.method == "POST":
        form = ProfileForm(request.POST, request.FILES, instance=profile)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Profile updated successfully")
            return redirect('/profile')
    context = {
        'form': ProfileForm(instance=profile),
        'activate_profile': 'active'
    }
    return render(request, 'accounts/profile.html', context)


# def contact_form(request):
#     contact = request.user.contact
#     if request.method == "POST":
#         form = ProfileForm(request.POST, request.FILES, instance=contact)
#         if form.is_valid():
#             form.save()
#             messages.add_message(request, messages.SUCCESS, "Thank you! your feedback is sent to admin")
#             return redirect('/homepage')
#     context = {
#         'form': ProfileForm(instance=profile),
#         'activate_contact': 'active'
#     }
#     return render(request, 'accounts/homepage.html', context)
