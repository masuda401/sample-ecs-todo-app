from rest_framework import serializers

from todo.models import Todo


class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todo
        fields = ['id', 'title', 'description', 'created_at']

    def create(self, validated_data):
        pass

    def update(self, instance, validated_data):
        pass

