from core.models import UserControl
from core.models import User
from datetime import datetime


class UserStorage(object):
    """
        Class used to get Users
        from the database and 
        return to a view
    """
    def __init__(self, email:str or None=None):
        super(UserStorage, self).__init__()
        self.__user = None
        self.email = email

    # def __clean_user_occurrence(self, user_occurrence) -> dict:
    #     user_occurrence = user_occurrence.__dict__
    #     self.user = user_occurrence.get('_result_cache')
    #     if self.user and len(self.user) == 1:
    #         self.user = self.user[0].__dict__
    #         _ = self.user.pop('password')
    #         _ = self.user.pop('_state')
    #         return self.user

    def __clean_user_occurrence(self, user_occurrence) -> dict:
        if user_occurrence and len(user_occurrence) > 0:
            self.user = user_occurrence[0].__dict__
            if 'password' in self.user.keys():
                _ = self.user.pop('password')
            _ = self.user.pop('_state')
            return self.user

    def get_by_email(self, email: str or None=None) -> dict or None:
        if email:
            self.email = email
        if not self.email:
            raise ValueError('Need to pass a valid email')
        self.user_occurrence = User.objects.filter(email=self.email)
        return self.__clean_user_occurrence(self.user_occurrence)

    def get_by_id(self, user_id: int or None):
        if user_id:
            self.user_id = user_id
        if not self.user_id:
            raise ValueError('Need to pass a valid user id')
        user_occurrence = User.objects.filter(id=self.user_id)
        return self.__clean_user_occurrence(user_occurrence)

    def alter_user_value(self, user_id: int, amount: float, operation_type: int) -> bool:
        user_occurrence = UserControl.objects.filter(user_id=user_id)
        if user_occurrence and len(user_occurrence) == 1:
            if operation_type == 1:
                user_occurrence[0].total_earned += amount
                user_occurrence[0].current_total += amount
                user_occurrence[0].last_operation = datetime.now()
            elif operation_type == 0:
                user_occurrence[0].current_total -= amount
                user_occurrence[0].last_operation = datetime.now()    
            user_occurrence[0].save()
            return True
        else:
            UserControl(user_id=user_id,
                        total_earned=amount,
                        current_total=amount,
                        last_operation=datetime.now()).save()
            return True

    def get_by_id_control(self, user_id: int or None):
        if user_id:
            self.user_id = user_id
        if not self.user_id:
            raise ValueError('Need to pass a valid user id')
        user_occurrence = UserControl.objects.filter(user_id=self.user_id)
        return self.__clean_user_occurrence(user_occurrence)
