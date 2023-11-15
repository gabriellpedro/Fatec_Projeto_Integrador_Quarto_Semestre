from recicle_apis_consume.libs.litorallimpo_class import LitoralLimpoAPI
from core.models import MaterialsToRecycle
from datetime import datetime



class Materials(object):
    """
        Class used to trat materials and
        check if they are updated
    """
    def __init__(self):
        super(Materials, self).__init__()
        self.materials_api = LitoralLimpoAPI()
        self.active_materials = list()

    def get(self, active: bool=True) -> list[dict]:
        self.active_materials = list()
        self.materials_db = MaterialsToRecycle.objects.all()
        if self.materials_db:
            if active:
                for occurrence in self.materials_db:
                    if occurrence.is_active:
                        self.active_materials.append(occurrence)
                return_elements = [element.__dict__ for element in self.active_materials]
                _ = [element.pop('_state') for element in return_elements]
                return return_elements
            else:
                return_elements = [element.__dict__ for element in self.materials_db]
                _ = [element.pop('_state') for element in return_elements]
                return return_elements

    def __check_last_updated(self) -> bool:
        if not len(self.active_materials) > 0:
            self.get()
        if len(self.active_materials) > 0:
            last_updated = self.active_materials[0].last_updated
            if last_updated:
                if last_updated.date() == datetime.now().date():
                    return True
        return False

    def update_materials(self) -> None:
        """
            Method responsable to check if the records
            from materials are updated.
        """
        print('[LOG] - Checking for any updates for materials occurrences')
        self.materials_api.extract_materials()
        prop = len(self.active_materials) > 0
        for material in self.materials_api.all_materials:
            material_assert = bool()
            if material['name'] != str() and material['price'] != str():
                try:
                    material['price'] = float(material['price'].strip())
                except (ValueError, TypeError):
                    continue
                material['name'] = material['name'].strip()
                material['mesure_unity'] = material['mesure_unity'].strip().lower()
                if prop:
                    for active_material in self.active_materials:
                        prop_1 = active_material.name == material['name']
                        prop_2 = active_material.price == material['price']
                        prop_3 = active_material.mesure_unity == material['mesure_unity']
                        if prop_1:
                            if not prop_2 or not prop_3:
                                active_material.is_active = False
                                active_material.last_updated = datetime.now()
                                active_material.save()
                                self.last_sended = material
                                MaterialsToRecycle(**material).save()
                                break
                            material_assert = True
                    if not material_assert:
                        self.last_sended = material
                        MaterialsToRecycle(**material).save()
                        material_assert = True
                else:
                    self.last_sended = material
                    MaterialsToRecycle(**material).save()
                    material_assert = True

    def run(self) -> None:
        if not self.__check_last_updated():
            self.update_materials()
        return self.get()
