import datetime
import json
import zoneinfo

import pytest
from rest_framework.test import APIRequestFactory

from todo.tests.factories import TodoFactory
from todo.views import TodoViewSet


@pytest.mark.freeze_time(datetime.datetime(2022, 8, 11, 9, 0, 0, tzinfo=zoneinfo.ZoneInfo('Asia/Tokyo')))
@pytest.mark.django_db
def tests_should_get_two_todos():
    TodoFactory(status=1)
    TodoFactory(id=2, title='Code Review', description='Review Pull Request #1')

    client = APIRequestFactory()
    todo_list = TodoViewSet.as_view({'get': 'list'})

    request = client.get('/api/todos/')
    response = todo_list(request)
    response.render()

    assert response.status_code == 200
    assert json.loads(response.content) == [
        {
            'id': 2,
            'title': 'Code Review',
            'description': 'Review Pull Request #1',
            'status': 0,
            'created_at': '2022-08-11T09:00:00+09:00'
        },
        {
            'id': 1,
            'title': 'Implement API',
            'description': 'Implement an API to retrieve Todo',
            'status': 1,
            'created_at': '2022-08-11T09:00:00+09:00'
        }
    ]
