from core.models import User


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

    def get_by_email(self, email: str or None=None) -> dict or None:
        if email:
            self.email = email
        if not self.email:
            raise ValueError('Need to pass a valid email')
        user_occurrence = User.objects.all().filter(email=self.email)
        if user_occurrence:
            user_occurrence = user_occurrence.__dict__
            self.__user = user_occurrence.get('_result_cache')
            if self.__user and len(self.__user) == 1:
                self.__user = self.__user[0].__dict__
                _ = self.__user.pop('password')
                _ = self.__user.pop('_state')
                return self.__user
