from django import forms
from django.forms import ModelForm
from .models import Category, News, Articles, Covid, Advertisement


class CategoryForm(ModelForm):
    class Meta:
        model= Category
        fields = "__all__"


class NewsForm(ModelForm):
    class Meta:
        model= News
        fields= "__all__"


class ArticlesForm(ModelForm):
    class Meta:
        model= Articles
        fields = "__all__"


class CovidForm(ModelForm):
    class Meta:
        model= Covid
        fields = "__all__"


class AdvertisementForm(ModelForm):
    class Meta:
        model= Advertisement
        fields= "__all__"
