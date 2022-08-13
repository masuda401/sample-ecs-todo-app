from django.db import models


class Todo(models.Model):
    ACTIVE = 0
    DONE = 1
    STATUS = ((ACTIVE, 'active'), (DONE, 'done'))

    title = models.CharField(max_length=30)
    description = models.TextField(blank=True, null=True)
    status = models.SmallIntegerField(choices=STATUS, default=ACTIVE)
    created_at = models.DateTimeField(auto_now_add=True)
