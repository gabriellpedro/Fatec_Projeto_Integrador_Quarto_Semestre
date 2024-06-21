from djongo import models
from djongo.models import DjongoManager
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class MaterialsbyState(models.Model):
    """docstring for MaterialsbyState"""
    def __init__(self):
        state = models.CharField(max_length=10)
        paper = models.CharField(max_length=10000)
        plastic = models.CharField(max_length=10000)
        glass = models.CharField(max_length=10000)
        steel = models.CharField(max_length=10000)
        cooperatives = models.CharField(max_length=10000)

class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('O Email deve ser informado')
        
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        
        return user
    
    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        
        return self.create_user(email, password, **extra_fields)

class User(AbstractBaseUser):
    email = models.EmailField(unique=True, max_length=254)
    password = models.CharField(max_length=128)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)
    name = models.CharField('name', max_length=100, default="Não informado")

    USERNAME_FIELD = 'email'
    
    objects = UserManager()
    djongo_objects = DjongoManager()
    
    def has_perm(self, perm, obj=None):
        return self.is_superuser
    
    def has_perms(self, perm_list, obj=None):
        return self.is_superuser
    
    def has_module_perms(self, app_label):
        return self.is_staff

class RecycleBalance(models.Model):
    """
        Class used to save each occurrence
        from the balance that are going to be made
        while the operator is adding products to the list.

        After the confirmation off the operator
        all the products that are current in the list, are going to
        receive the status is_active = True and is going to be
        added to the client OperationsBalance as a positive operation
    """
    date_balance = models.DateTimeField(auto_now_add=True)
    user_id_occurrence = models.IntegerField()
    material_id = models.IntegerField()
    mesure = models.FloatField(default=1)
    is_active = models.BooleanField(default=True)

class MaterialsToRecycle(models.Model):
    """
        Class used to save all materials
        occurrence, from the actives and the
        ones that are not longer in use
    """
    created_at = models.DateTimeField(auto_now_add=True)
    last_updated = models.DateTimeField(auto_now_add=True)
    price = models.FloatField()
    name = models.CharField(max_length=150)
    mesure_unity = models.CharField(max_length=50)
    is_active = models.BooleanField(default=True)

class RecycleBalanceOccurrence(models.Model):
    """
        Class used to save all materials
        occurrence, from the actives and the
        ones that are not longer in use

        One Occurrence
    """
    recycle_balance_id = models.IntegerField()

    class Meta:
        abstract = True
        
    def __str__(self):
        return self.name

class OperationsBalance(models.Model):
    """
        Class used to save all users
        changes on his final account number

        ArrayField(ids) => from RecycleBalance

        operation_type == 1:
            positive (+)

        operation_type == 0:
            positive (-)
    """
    created_at = models.DateTimeField(auto_now_add=True)
    user_id = models.IntegerField()
    total = models.FloatField()
    operation_type = models.IntegerField()
    balance_ids = models.ArrayField(model_container=RecycleBalanceOccurrence)

class UserControl(models.Model):
    """
        Class used to the
        final value from user
    """
    created_at = models.DateTimeField(auto_now_add=True)
    user_id = models.IntegerField()
    current_total = models.FloatField()
    total_earned = models.FloatField()
    last_operation = models.DateTimeField()


class EcoPontoLocation(models.Model):
    """
        Class used to manage 
        the EcoPonto location
    """

    created_at = models.DateTimeField(auto_now_add = True)
    name = models.CharField(max_length= 100)
    material_list = models.CharField(max_length= 250)
    latitude = models.CharField(max_length=10)
    longitude = models.CharField(max_length=10)
    street = models.CharField( max_length=100)
    place_number = models.IntegerField()
    neighborhood = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=2)
    cep = models.CharField(max_length=9)

    def __str__(self):
        return self.name
