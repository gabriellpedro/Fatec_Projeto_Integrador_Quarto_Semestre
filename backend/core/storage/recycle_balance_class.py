from core.storage.materials_class import Materials
from core.models import RecycleBalance


class RecycleBalanceStorage(object):
    """
        Class used to manipulate the occurrences from the
        colletion RecycleBalanceStorage that are occurrence from
        the materials that are going to be selled
    """
    def __init__(self):
        super(RecycleBalanceStorage, self).__init__()
        self.recicle_balance = RecycleBalance()
        self.materials = Materials()

    def get_activate_by_user_id(self, user_id_occurrence: int) -> dict:
        recycle_balance = RecycleBalance.objects.filter(user_id_occurrence=user_id_occurrence).order_by('-date_balance')
        if len(recycle_balance) > 0:
            temp_list = list()
            final_mesure = float()
            for occurrence in recycle_balance:
                if occurrence.is_active:
                    occurrence = occurrence.__dict__
                    _ = occurrence.pop('_state')
                    material_occurrence = self.materials.get_by_id(occurrence['material_id'])
                    final_mesure += material_occurrence['price'] * occurrence['mesure']
                    temp_list.append(occurrence)
            return {'recicle_balance_array': temp_list,
                    'final_value': final_mesure,
                    'materials_count': len(temp_list)}
        return dict()

    def __clean_recycle_balance_occurrence(self, recycle_balance_occurrence) -> dict:
        if recycle_balance_occurrence and len(recycle_balance_occurrence) > 0:
            self.__recycle_balance_occurrence = recycle_balance_occurrence[0].__dict__
            _ = self.__recycle_balance_occurrence.pop('_state')
            return self.__recycle_balance_occurrence

    def get_by_id(self, recycle_balance_id: int, return_object: bool=False) -> dict:
        if recycle_balance_id:
            self.recycle_balance_id = recycle_balance_id
        if not self.recycle_balance_id:
            raise ValueError('Need to pass a valid user id')
        recycle_balance_occurrence = RecycleBalance.objects.filter(id=self.recycle_balance_id)
        return recycle_balance_occurrence if return_object else\
        self.__clean_recycle_balance_occurrence(recycle_balance_occurrence)

    def deactivate_recycle_balance_occurrence(self, recycle_balance_id: int) -> bool:
        if recycle_balance_id:
            self.recycle_balance_id = recycle_balance_id
        if not self.recycle_balance_id:
            raise ValueError('Need to pass a valid user id')
        recycle_balance_occurrence = RecycleBalance.objects.filter(id=self.recycle_balance_id)
        if len(recycle_balance_occurrence) == 1:
            if recycle_balance_occurrence and recycle_balance_occurrence[0].is_active:
                recycle_balance_occurrence[0].is_active = False
                recycle_balance_occurrence[0].save()
                return True
        return False
