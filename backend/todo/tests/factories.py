import factory

from todo.models import Todo


class TodoFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Todo

    id = 1
    title = 'APIを実装'
    description = 'Todoを取得するAPIを実装する'
