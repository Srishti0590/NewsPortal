from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('homepage', views.homepage),
    path('home', views.homepage),

    path('category_form', views.category_form),
    path('get_category', views.get_category),
    path('delete_category/<int:category_id>', views.delete_category),
    path('update_category/<int:category_id>', views.category_update_form),
    path('show_categories', views.show_categories),

    path('news_form', views.newsform),
    path('get_news', views.get_news),
    path('delete_news/<int:news_id>', views.delete_news),
    path('update_news/<int:news_id>', views.news_update_form),
    path('show_news/<int:category_id>', views.show_news),
    path('articlesform', views.articles_form),
    path('get_article', views.get_articles),
    path('show_article', views.show_articles),
    path('update_article/<int:article_id>', views.article_update_form),
    path('delete_article/<int:article_id>', views.delete_article),

    path('covid_form', views.covid_form),
    path('get_covid', views.get_covid),
    path('covid_update_form/<int:covid_id>', views.covid_update_form),
    path('show_covid', views.show_covid),

    path('add_to_favourite/<int:news_id>', views.add_to_favourite),
    path('my_favourite', views.show_favourite_items),
    path('remove_favourite_item/<int:favourite_id>', views.remove_favourite_item),

    path('advertisement_form', views.advertisement_form),
    path('get_advertisement', views.get_advertisement),
    path('delete_advertisement/<int:advertisement_id>', views.delete_advertisement),

]

