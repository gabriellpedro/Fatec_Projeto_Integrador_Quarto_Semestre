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

    def get_activate_by_user_id(self, user_id_occurrence: int) -> list[dict] or list:
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
                    'materials_count': len(recycle_balance)}
        return list()
