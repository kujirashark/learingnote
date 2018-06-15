import  django_filters
from rest_framework import filters

from app.models import Student


class  StudentFilter(filters.FilterSet):

        s_name = django_filters.CharFilter('s_name',lookup_expr='contains')
        s_yuwen_min = django_filters.NumberFilter('s_yuwen',lookup_expr='gte')
        s_yuwen_max = django_filters.NumberFilter('s_yuwen',lookup_expr='lte')


        class Meta:
            model = Student
            fields = ['s_name',]
