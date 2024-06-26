from django.test import TestCase
from .models import Profile


#tests for profile

class BasicTest(TestCase):
    def test_profile(self):
        profile = Profile()
        profile.username= "srishti"
        profile.last_name="parajuli"
        profile.save()
        record = Profile.objects.get(pk=1)
        self.assertEqual(record, profile)

