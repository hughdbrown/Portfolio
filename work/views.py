from django.http import HttpResponseRedirect, HttpResponseNotFound, HttpResponseServerError
from django.views.generic.list_detail import object_list, object_detail
from django.views.defaults import server_error as default_server_error
from django.views.defaults import page_not_found as default_page_not_found
from django.conf import settings
from django.template import loader, Context

from portfolio.work.models import Project, ImageList

def project_list(request) :
	if request.method == 'GET':
		projects = Project.objects.all().order_by('-completion_date')
		return object_list(request, queryset=projects )
	else:
		return HttpResponseRedirect(request.path)

def project_detail(request, object_id):
	if request.method == 'GET':
		project = get_object_or_404(Project, user=request.user, pk=object_id)
		return object_detail(request, queryset=project )
	else:
		return HttpResponseRedirect(request.path)

def page_not_found(request, template_name='404.html') :
	t = loader.get_template(template_name) # You need to create a 404.html template.
	c = Context({ "MEDIA_URL": settings.MEDIA_URL })
	return HttpResponseNotFound(t.render(c))

def server_error(request, template_name='500.html'):
	t = loader.get_template(template_name) # You need to create a 500.html template.
	c = Context({ "MEDIA_URL": settings.MEDIA_URL })
	return HttpResponseServerError(t.render(c))
