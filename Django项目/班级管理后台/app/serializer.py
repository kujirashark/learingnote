
from rest_framework import serializers

from app.models import Student, Grade


class StudentSerizlizer(serializers.ModelSerializer):


    class Meta:
        model = Student
        fields = ['s_name','s_yuwen','g','id']

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['g_name'] = instance.g.g_name

        return data


class GradeSerizlizer(serializers.ModelSerializer):

    class Meta:
        model = Grade
        fields = ['g_name','id','g_create_time']

    def do_update(self,instance,validated_data):

        instance.g_name = validated_data['g_name']
        instance.save()
        data = self.to_representation(instance)
        return data



