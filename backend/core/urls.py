from django.contrib import admin
from django.urls import path
from core.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('getstatistics/', RecicleMaterialsStatisticsView.as_view(), name='materialstatistics'),
    path('getmaterials/', RecicleMaterialsView.as_view(), name='materials')
]
