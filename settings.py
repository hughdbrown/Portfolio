from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS
import os.path

DEBUG = True
TEMPLATE_DEBUG = DEBUG
SERVE_MEDIA = True

ADMINS = (
    ('Hugh Brown', 'hughdbrown@yahoo.com'),
)

MANAGERS = ADMINS

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/New_York'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

import django
DJANGO_ROOT = django.__path__[0]
PROJECT_ROOT = os.path.dirname(__file__)

THEME = "miner"
#THEME = "notheme"
THEME_DIR = os.path.join(PROJECT_ROOT, "themes", THEME)

MEDIA_URL =  "/themes/%s/site-media/" % THEME
MEDIA_ROOT = os.path.realpath(os.path.join(THEME_DIR, "site-media/"))

ADMIN_MEDIA_PREFIX = '/media/'
ADMIN_MEDIA_ROOT = os.path.realpath(os.path.join(DJANGO_ROOT, "contrib/admin/media/"))

# Make this unique, and don't share it with anybody.
SECRET_KEY = ')gmkmexf%6plg%85fzm6z@et#=9id=qz@y89+h^6g^ag33mt!l'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.gzip.GZipMiddleware',
    'django.middleware.cache.CacheMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'django.middleware.http.ConditionalGetMiddleware',
)

ROOT_URLCONF = 'portfolio.urls'

TEMPLATE_DIRS = (
    os.path.join(THEME_DIR, "templates"),
)

TEMPLATE_CONTEXT_PROCESSORS += (
    'django.core.context_processors.request',
    'django.core.context_processors.auth',
    'django.core.context_processors.media',
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.admin',
    'django.contrib.markup',
    'django.contrib.flatpages',
    'portfolio.work',
)

try:
    from local_settings import *
except ImportError:
    print "Missing %s" % os.path.join(PROJECT_ROOT, "local_settings.py")

if DEBUG:
    paths = [PROJECT_ROOT, MEDIA_ROOT, THEME_DIR, ADMIN_MEDIA_ROOT] + list(TEMPLATE_DIRS)
    for p in paths:
        p = os.path.normpath(p)
        if not os.path.exists(p):
            print "Missing path: %s" % p
