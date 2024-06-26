from django.shortcuts import render
from django.shortcuts import render, redirect
from accounts.auth import admin_only
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from news.models import *
from django.contrib import messages


@login_required
@admin_only
def admin_dashboard(request):
    news = News.objects.all()
    news_count = news.count()
    category = Category.objects.all()
    category_count = category.count()
    article = Articles.objects.all()
    article_count = article.count()
    covid = Covid.objects.all()
    covid_count = covid.count()
    user = User.objects.filter(is_staff=0)
    user_count = user.count()
    admin = User.objects.filter(is_staff=1)
    admin_count = admin.count()

    context ={
        'news': news_count,
        'category': category_count,
        'articles': article_count,
        'covid': covid_count,
        'user': user_count,
        'admin':admin_count
    }
    return render(request, 'admins/dashboard.html', context)

@login_required
@admin_only
def show_users(request):
    users = User.objects.filter(is_staff=0).order_by('-id')
    context = {
        'users': users
    }
    return render(request, 'admins/user.html', context)

@admin_only
@login_required
def delete_user(request, user_id):
    user = User.objects.get(id=user_id)
    user.delete()
    messages.add_message(request, messages.SUCCESS, 'User Deleted Successfully')
    return redirect("admins/user.html")

@login_required
@admin_only
def show_admins(request):
    admins = User.objects.filter(is_staff=1).order_by('-id')
    context = {
        'admins': admins
    }
    return render(request, 'admins/admin.html', context)


@login_required
@admin_only
def promote_user(request, user_id):
    user = User.objects.get(id=user_id)
    user.is_staff = True
    user.save()
    messages.add_message(request, messages.SUCCESS, 'User is successfully promoted to admin')
    return redirect('/admins/admins')


@login_required
@admin_only
def demote_admin(request, user_id):
    admin = User.objects.get(id=user_id)
    admin.is_staff = False
    admin.save()
    messages.add_message(request, messages.SUCCESS, 'Admin is demoted to user')
    return redirect('/admins/users')

