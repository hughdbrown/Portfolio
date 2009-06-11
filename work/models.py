from django.db import models

class Project(models.Model):
	name = models.CharField(max_length=250)
	project_url = models.URLField('Project URL')
	description = models.TextField(null=True, blank=True)
	completion_date = models.DateField(null=True, blank=True)

	def __unicode__(self):
		return u"Project %s" % self.name

	@models.permalink
	def get_absolute_url(self):
		return self.project_url

class ImageList(models.Model):
	project = models.ForeignKey(Project)
	description = models.TextField(null=True, blank=True)
	image = models.ImageField(upload_to="storage/images")
	image_number = models.IntegerField()

	def __unicode__(self):
		return u"Image %d" % self.id

	@models.permalink
	def get_absolute_url(self):
		return "storage/images/%d" % self.id
