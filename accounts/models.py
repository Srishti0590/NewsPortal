from django.contrib.auth.models import User
from django.db import models



class Profile(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    username =  models.CharField(max_length=100)
    First_Name =  models.CharField(max_length=50)
    Last_Name = models.CharField(max_length=50)
    Contact_Number = models.CharField(max_length=10)
    profile_picture = models.FileField(upload_to='static/profile', default='static/default_user.png')
    created_date = models.DateTimeField(auto_now_add=True)



