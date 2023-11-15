from django.contrib import admin
from django.urls import path
from core.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('getstatistics/', RecicleMaterialsStatisticsView.as_view(), name='materialstatistics'),
    path('getmaterials/', RecicleMaterialsView.as_view(), name='materials'),
    path('reciclestatistics/<str:state>', RecicleMaterialsStatisticsViewByState.as_view(), name='cities_by_state'),
    path('user_search/', UserSearch.as_view(), name='user_search'),
    path('recycle_balance/', RecycleBalanceView.as_view(), name='recycle_balance'),
    path('recycle_balance/add_occurrence', RecycleBalanceView.as_view(), name='recycle_balance_occurrence'),
    path('recycle_balance/close', OperationsBalanceView.as_view(), name='recycle_balance_close'),
    path('operation/', OperationsBalanceView.as_view(), name='operation_get'),
    path('register/', RegisterUser.as_view(), name='register'),
    path('login/', AuthLoginView.as_view(), name='login'),
    path('logout/', AuthLogoutView.as_view(), name='logout'),
]
