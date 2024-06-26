from django.contrib.auth.models import User
from django.db import models
from django.core.validators import *
from django.core import validators


class Category(models.Model):
    category_name=models.CharField(max_length=200, null=True, validators=[validators.MinLengthValidator(2)])
    category_description= models.TextField()
    created_date= models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.category_name


class Articles(models.Model):
    article_title=models.CharField(max_length=500, null=True, validators=[validators.MinLengthValidator(2)])
    article_description= models.TextField()
    created_date= models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.article_title


class Covid(models.Model):
    objects = None
    new_cases = models.CharField(max_length=500, null=True)
    tests_done = models.CharField(max_length=500, null=True)
    recovered_patients = models.CharField(max_length=500, null=True)
    recovery_percentage = models.CharField(max_length=500, null=True)
    total_deaths = models.CharField(max_length=500, null=True)
    created_date = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return self.new_cases


class News(models.Model):
    objects = None
    news_title = models.CharField(max_length=500, null=True)
    news_description = models.TextField(null=True)
    news_image = models.ImageField(upload_to='static/uploads', null=True)
    created_date = models.DateTimeField(auto_now_add=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.news_title


class Advertisement(models.Model):
    objects = None
    ad_title = models.FileField(upload_to ='static/uploads')

    def __str__(self):
        return self.ad_title


class favourite(models.Model):

    news = models.ForeignKey(News, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_date = models.DateTimeField(auto_now_add=True)
