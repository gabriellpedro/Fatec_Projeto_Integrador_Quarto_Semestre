from django.contrib import admin
from django.urls import path
from core.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('getstatistics/', RecicleMaterialsStatisticsView.as_view(), name='materialstatistics'),
    path('getmaterials/', RecicleMaterialsView.as_view(), name='materials'),
    path('reciclestatistics/<str:state>', RecicleMaterialsStatisticsViewByState.as_view(), name='cities_by_state'),
    path('register/', RegisterUser.as_view(), name='register'),
    path('login/', AuthLoginView.as_view(), name='login'),
    path('logout/', AuthLogoutView.as_view(), name='logout'),
]
