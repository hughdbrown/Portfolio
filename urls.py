from django.conf.urls.defaults import *
from django.conf import settings
from django.contrib import admin

admin.autodiscover()

handler404 = 'portfolio.work.views.page_not_found'
handler500 = 'portfolio.work.views.server_error'

urlpatterns = patterns('',
    url(r'^admin/',         include(admin.site.urls)),
)

urlpatterns += patterns('portfolio.work.views',
    url(r'^(?P<object_id>\d+)$', 'project_detail', name="project_detail"),
    url(r'^$',                   'project_list',   name="project_list"),
)

if settings.SERVE_MEDIA:
    media_url_regex = r'^%s(?P<path>.*)$' % settings.MEDIA_URL[1:]
    urlpatterns += patterns('',
        url(media_url_regex, 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
        url(r'^media/(?P<path>.*)$',      'django.views.static.serve', {'document_root': settings.ADMIN_MEDIA_ROOT}),
    )
