from django.shortcuts import render, redirect
from .forms import CategoryForm, NewsForm, ArticlesForm, CovidForm, AdvertisementForm
from django.contrib import messages
from .models import News, Category, Articles, Covid, favourite, Advertisement
from accounts.auth import unauthenticated_user, admin_only, user_only
from django.contrib.auth.decorators import login_required
import os
from .article_filter import ArticleFilter
def homepage(request):
    return render(request, 'accounts/homepage.html')


@login_required
@admin_only
def category_form(request):
    if request.method == "POST":
        form = CategoryForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "category added succesfully")
            return redirect("/news/get_category")
        else:
            messages.add_message(request, messages.ERROR, "unable to add category")
            return render(request, 'news/category_form.html', {'form_category': form})
    context = {
        'form_category': CategoryForm,
        'activate_category': 'active'
    }
    return render(request, 'news/category_form.html', context)

@login_required
@admin_only
def get_category(request):
    categories= Category.objects.all().order_by('-id')
    context={
        'categories':categories,
        'activate_category': 'active'
    }
    return render(request, 'news/get_category.html', context)

@login_required
@admin_only
def category_update_form(request, category_id):
    category= Category.objects.get(id=category_id)
    if request.method=="POST":
        form = CategoryForm(request.POST, request.FILES, instance=category)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "category updated succesfully")
            return redirect("/news/get_category")
        else:
            messages.add_message(request, messages.ERROR, "unable to update category")
            return render(request, 'news/category_update_form.html', {'form_category': form})
    context = {
        'form_category': CategoryForm(instance=category),
        'activate_category': 'active'
    }
    return render(request, 'news/category_form.html', context)

@admin_only
@login_required
def delete_category(request, category_id):
    category = Category.objects.get(id=category_id)
    category.delete()
    messages.add_message(request, messages.SUCCESS, 'Category Deleted Succesfully')
    return redirect("/news/get_category")

def show_categories(request):
    categories=Category.objects.all().order_by('-id')
    context={
        'categories':categories,
        'activate_category_user': 'active'
    }
    return render(request, 'news/show_categories.html', context)


@login_required
@admin_only
def newsform(request):
    if request.method=="POST":
        form = NewsForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "news added succesfully")
            return redirect("/news/get_news")
        else:
            messages.add_message(request, messages.ERROR, "unable to add news")
            return render(request, 'news/news_form.html', {'form_news': form})
    context = {
        'form_news': NewsForm,
        'activate_news': 'active'
    }

    return render(request, 'news/news_form.html', context)


@login_required
@admin_only
def get_news(request):
    news= News.objects.all().order_by('-id')
    context={
        'news':news,
        'activate_news': 'active'
    }
    return render(request, 'news/get_news.html', context)


@login_required
@admin_only
def news_update_form(request, news_id):
    news= News.objects.get(id=news_id)
    if request.method=="POST":
        if request.FILES.get('food_image'):
            os.remove(news.news_image.path)
        form = NewsForm(request.POST, request.FILES, instance=news)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "news updated succesfully")
            return redirect("/news/get_news")
        else:
            messages.add_message(request, messages.ERROR, "unable to update news")
            return render(request, 'news/news_form.html', {'form_news': form})
    context = {
        'form_news': NewsForm(instance=news),
        'activate_news': 'active'
    }
    return render(request, 'news/news_update_form.html', context)


@admin_only
@login_required
def delete_news(request, news_id):
    news = News.objects.get(id=news_id)
    os.remove(news.news_image.path)
    news.delete()
    messages.add_message(request, messages.SUCCESS, 'News Deleted Succesfully')
    return redirect("/news/get_news")


def show_news(request, category_id):
    category=Category.objects.get(id=category_id)
    context={
        'category':category,
        'activate_news_user':'active'
    }
    return render(request, 'news/show_news.html', context)


def articles_form(request):
    if request.method=="POST":
        form = ArticlesForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "article added succesfully")
            return redirect("/news/get_article")
        else:
            messages.add_message(request, messages.ERROR, "unable to add article")
            return render(request, 'news/articlesform.html', {'form_article':form})
    context = {
        'form_article': ArticlesForm,
        'activate_article': 'active'
    }
    return render(request, 'news/articlesform.html', context)


def get_articles(request):
    articles= Articles.objects.all().order_by('-id')
    context={
        'articles':articles,
        'activate_article': 'active'
    }
    return render(request, 'news/get_articles.html', context)



@login_required
@admin_only
def article_update_form(request, article_id):
    article= Articles.objects.get(id=article_id)
    if request.method=="POST":
        form = ArticlesForm(request.POST, request.FILES, instance=article)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Article updated succesfully")
            return redirect("/news/get_article")
        else:
            messages.add_message(request, messages.ERROR, "unable to update article")
            return render(request, 'news/article_update_form.html', {'form_article': form})
    context = {
        'form_article': ArticlesForm(instance=article),
        'activate_article': 'active'
    }
    return render(request, 'news/articlesform.html', context)


@admin_only
@login_required
def delete_article(request, article_id):
    article = Articles.objects.get(id=article_id)
    article.delete()
    messages.add_message(request, messages.SUCCESS, 'Article Deleted Succesfully')
    return redirect("/news/get_article")



def show_articles(request):
    articles=Articles.objects.all().order_by('-id')
    context={
        'articles':articles,
        'activate_article_user':'active'
    }
    return render(request, 'news/show_article.html', context)

@login_required
@admin_only
def covid_form(request):
    if request.method == "POST":
        form = CovidForm(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Details added succesfully")
            return redirect("/news/get_covid")
        else:
            messages.add_message(request, messages.ERROR, "unable to add new patient")
            return render(request, 'news/covid_form.html', {'form_covid': form})
    context = {
        'form_covid': CovidForm,
        'activate_covid': 'active'
    }
    return render(request, 'news/covid_form.html', context)

@login_required
@admin_only
def covid_update_form(request, covid_id):
    covid= CovidForm.objects.get(id=covid_id)
    if request.method=="POST":
        form = ArticlesForm(request.POST, request.FILES, instance=covid)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Details updated succesfully")
            return redirect("/news/get_covid")
        else:
            messages.add_message(request, messages.ERROR, "unable to update details")
            return render(request, 'news/covid_form.html', {'form_covid': form})
    context = {
        'form_covid': CovidForm,
        'activate_covid': 'active'
    }
    return render(request, 'news/covid_form.html', context)


def get_covid(request):
    covid= Covid.objects.all().order_by('-id')
    context={
        'covid':covid,
        'activate_covid': 'active'
    }
    return render(request, 'news/get_covid.html', context)

def show_covid(request):
    covid= Covid.objects.all().order_by('-id')
    context={
        'covid':covid,
        'activate_covid_user':'active'
    }
    return render(request, 'news/show_covid.html', context)

@login_required
@user_only
def add_to_favourite(request, news_id):
    user = request.user
    news = News.objects.get(id=news_id)
    check_item_presence_favourite = favourite.objects.filter(user=user, news=news)
    if check_item_presence_favourite:
        messages.add_message(request, messages.ERROR, 'Item is already present in your favourite list')
        return redirect('/news/show_news')
    else:
        favourites = favourite.objects.create(news=news, user=user)
        if favourites:
            messages.add_message(request, messages.SUCCESS, 'News added to favourites')
            return redirect('/news/my_favourite')
        else:
            messages.add_message(request, messages.ERROR, 'Unable to add news to favourites')

@login_required
@user_only
def show_favourite_items(request):
    user = request.user
    items = favourite.objects.filter(user=user)
    context = {
        'items': items,
        'activate_my_favourite': 'active'
    }
    return render(request, 'news/get_favourites.html', context)

@login_required
@user_only
def remove_favourite_item(request, favourite_id):
    item = favourite.objects.get(id=favourite_id)
    item.delete()
    messages.add_message(request, messages.SUCCESS, 'News removed sucessfully')
    return redirect('/news/my_favourite')


@login_required
@admin_only
def advertisement_form(request):
    if request.method == "POST":
        form = AdvertisementForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "Advertisement added succesfully")
            return redirect("/news/get_advertisement")
        else:
            messages.add_message(request, messages.ERROR, "unable to add advertisement")
            return render(request, 'news/advertisement_form.html', {'form_advertisement': form})
    context = {
        'form_advertisement': AdvertisementForm,
        'activate_advertisement': 'active'
    }
    return render(request, 'news/advertisement_form.html', context)

def get_advertisement(request):
    advertisement = Advertisement.objects.all().order_by('-id')
    context = {
        'advertisement': advertisement,
        'activate_advertisement': 'active'
    }
    return render(request, 'news/get_advertisement.html', context)

@admin_only
@login_required
def delete_advertisement(request, advertisement_id):
    advertisement = Advertisement.objects.get(id=advertisement_id)
    os.remove(advertisement.ad_title.path)
    advertisement.delete()
    messages.add_message(request, messages.SUCCESS, 'Ad. Deleted Succesfully')
    return redirect("/news/get_advertisement")

@login_required
def get_articles(request):
    articles = Articles.objects.all()
    article_filter=ArticleFilter(request.GET, queryset=articles)
    article_final= article_filter.qs
    context = {
        'articles': article_final,
        'activate_article': 'active',
        'article_filter': article_filter
    }
    return render(request, 'news/get_articles.html', context)




