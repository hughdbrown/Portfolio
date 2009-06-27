from datetime import datetime

from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponseNotFound, HttpResponseServerError
from django.shortcuts import render_to_response
from django.template import RequestContext, Context, loader, Context
from django.views.generic.list_detail import object_list, object_detail
from django.views.defaults import server_error as default_server_error
from django.views.defaults import page_not_found as default_page_not_found
from django.conf import settings

from portfolio.work.models import Project, ImageList

def project_list(request) :
	projects = Project.objects.all().order_by('-completion_date')
	template_name = 'work/project_list.html'
	d = { 'object_list': projects }
	return render_to_response(template_name, d, context_instance=RequestContext(request))

def project_detail(request, object_id):
	project = get_object_or_404(Project, user=request.user, pk=object_id)
	d = { 'queryset':projects }
	return object_detail(request, d)

def page_not_found(request, template_name='404.html') :
	t = loader.get_template(template_name) # You need to create a 404.html template.
	c = Context()
	return HttpResponseNotFound(t.render(c))

def server_error(request, template_name='500.html'):
	t = loader.get_template(template_name) # You need to create a 500.html template.
	c = Context()
	return HttpResponseServerError(t.render(c))
