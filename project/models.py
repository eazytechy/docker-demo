from django.db import models

# Create your models here.
class Project(models.Model):

    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)


    class Meta:
        db_table = 'project'