from django.http import response
from django.test import TestCase, Client
from django.urls import reverse

from .models import News, Category, Articles, Covid

# Create your tests here.


class BasicTest(TestCase):
    def test_fields(self):
        category = Category()
        category.title= "Others"
        category.description="All news"
        category.save()
        record = Category.objects.get(pk=1)
        self.assertEqual(record, category)

    def test_art(self):
        article = Articles()
        article.title= "Others"
        article.description="All news"
        article.save()
        record = Articles.objects.get(pk=1)
        self.assertEqual(record, article)

    def test_covid(self):
        covid = Covid()
        covid.new_cases= "51"
        covid.total_deaths="20"
        covid.save()
        record = Covid.objects.get(pk=1)
        self.assertEqual(record, covid)

    def test_news(self):
        news = News()
        news.news_title= "hello!"
        news.news_description="See news"
        news.save()
        record = News.objects.get(pk=1)
        self.assertEqual(record, news)

    class TestViews(TestCase):
        def setUp(self):
             self.client = Client()
             self.display_category_url = reverse('display_category')
             self.display_news_url = reverse('display_news')

