from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS

import database
DATABASE_ENGINE = database.DATABASE_ENGINE
DATABASE_NAME = database.DATABASE_NAME
DATABASE_USER = database.DATABASE_USER
DATABASE_PASSWORD = database.DATABASE_PASSWORD
DATABASE_HOST = database.DATABASE_HOST
DATABASE_PORT = database.DATABASE_PORT

import deploy
DEBUG = deploy.DEBUG
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('Hugh Brown', 'hughdbrown@yahoo.com'),
)

MANAGERS = ADMINS

# Base directory.
BASE_DIR = deploy.BASE_DIR

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

import os.path

# MEDIA_URL: URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
# MEDIA_ROOT: Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_URL = '/site-media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'site-media/').replace('\\','/')

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/media/'
ADMIN_MEDIA_ROOT = deploy.ADMIN_MEDIA_ROOT

# Make this unique, and don't share it with anybody.
SECRET_KEY = ')gmkmexf%6plg%85fzm6z@et#=9id=qz@y89+h^6g^ag33mt!l'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
)

ROOT_URLCONF = 'portfolio.urls'

TEMPLATE_DIRS = (
    os.path.join(BASE_DIR, 'templates/'),
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

SERVE_MEDIA = True

