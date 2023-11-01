from recicle_apis_consume.libs.manager import Manager
import requests


class LitoralLimpoAPI(Manager):
    """
        Class used to extract price information about
        recicleable material
    """
    def __init__(self):
        super(LitoralLimpoAPI, self).__init__()
        self.primordial_link = 'https://litorallimpo.com.br/wp-admin/admin-ajax.php'
        self.table_ids = ['2634', '2648']
        self.params = {
            'action': 'wp_ajax_ninja_tables_public_action',
            'table_id': str(),
            'target_action': 'get-all-data',
            'default_sorting': 'manual_sort',
            'skip_rows': '0',
            'limit_rows': '0',
            'ninja_table_public_nonce': '95c03727d4',
        }
        self.all_materials = list()
        self.possible_request_error = (requests.exceptions.ConnectTimeout,
                                        requests.exceptions.SSLError,
                                        requests.exceptions.ConnectionError,
                                        requests.exceptions.ReadTimeout)

    def extract_materials(self) -> None:
        for id_ in self.table_ids:
            self.params['table_id'] = id_
            self.send_requisitons_requests(self.primordial_link)
            if self.response and self.availiable:
                self.results = self.response.json()
                if len(self.results) > 0:
                    for occurrence in self.results:
                        value = occurrence.get('value')
                        if value:
                            material_occurrence = {
                                'name': value.get('material', str()),
                                'price': value.get('preco', str()).replace(',', '.'),
                                'mesure_unity': value.get('quantidade', str()),
                            }
                            if not material_occurrence in self.all_materials:
                                self.all_materials.append(material_occurrence) 

