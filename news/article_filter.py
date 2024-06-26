import django_filters
from .models import *
from django_filters import CharFilter

class ArticleFilter(django_filters.FilterSet):
    article_contains=CharFilter(field_name="article_title", lookup_expr="icontains")
    class Meta:
        model= Articles
        fields= []
