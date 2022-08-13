import factory

from todo.models import Todo


class TodoFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Todo

    id = 1
    title = 'Implement API'
    description = 'Implement an API to retrieve Todo'
    status = 0
