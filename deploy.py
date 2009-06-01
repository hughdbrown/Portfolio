import os.path

DEBUG = False

# Make sure it ends in a trailing slash!
BASE_DIR = os.path.dirname(__file__).replace('\\', '/')
DJANGO_ROOT = "C:/Python25/Lib/site-packages/django/"
#DJANGO_ROOT = "/usr/lib/python2.5/site-packages/django/"
ADMIN_MEDIA_ROOT = DJANGO_ROOT + "contrib/admin/media/"
