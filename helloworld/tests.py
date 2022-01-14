from django.test import TestCase

class TestHelloWorld(TestCase):
    def test_render_page(self):
        """
            Test status code 200
        """
        response = self.client.get('')
        self.assertEqual(response.status_code, 200)