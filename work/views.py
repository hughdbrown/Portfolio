from datetime import datetime

#from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
#from django.shortcuts import render_to_response
#from django.template import RequestContext, Context
from django.views.generic.list_detail import object_list, object_detail
from django.views.defaults import server_error as default_server_error
from django.views.defaults import page_not_found as default_page_not_found

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

def page_not_found(request) :
	return default_page_not_found(request, '404.html')

def server_error(request):
	return default_server_error(request, '500.html')
