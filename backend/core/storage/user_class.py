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
