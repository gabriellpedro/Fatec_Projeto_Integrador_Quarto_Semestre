from recicle_apis_consume.libs.manager import Manager
from bs4 import BeautifulSoup
from tqdm import tqdm


class RecicleAtlas(Manager):
    """
        Class used to extract information
        about recicleable products from Brazil
    """
    def __init__(self):
        super(RecicleAtlas, self).__init__()
        self.primordial_link = 'https://atlasbrasileirodareciclagem.ancat.org.br'
        self.results = dict()
        self.by_state = dict()
        self.by_city = dict()

    def extract_information_about_recicles(self) -> bool or None:
        self.send_requisitons_requests('https://atlasbrasileirodareciclagem.ancat.org.br/static/js/main.0d42bcb2.chunk.js')
        if self.response and self.availiable:
            self.peace = self.response.text.split("e.exports=JSON.parse(")
            if len(self.peace) >= 3:
                self.peace = self.peace[2].split("}]}]')},")
                if len(self.peace) > 0:
                    self.peace = self.peace[0] + "}]}]')}]"
                    self.peace = self.peace.encode().decode('unicode-escape')
                    self.peace = self.peace[1:][:-4]
                    try:
                        self.results = eval(self.peace)
                    except SyntaxError:
                        return False

    def treat_data_state(self) -> None:
        if len(self.results) > 0:
            for state in tqdm(self.results, desc='by_state'):
                state_uf = state.get('uf')
                if state_uf:
                    self.by_state[state_uf] = {
                        'paper': state.get('paperTotal', str()),
                        'plastic': state.get('plasticTotal', str()),
                        'glass': state.get('glassTotal', str()),
                        'steel': state.get('steelTotal', str()),
                        'cooperatives': state.get('totalCooperatives', str()),
                        'people': state.get('totalPeople', str()),
                    }
                    cities = state.get('cities', list())
                    if len(cities) > 0:
                        for city in tqdm(cities, desc='by_city'):
                            self.by_city[city.get('city')] = {
                                'state': state_uf,
                                'paper': city.get('paperTotal', str()),
                                'plastic': city.get('plasticTotal', str()),
                                'glass': city.get('glassTotal', str()),
                                'steel': city.get('steelTotal', str()),
                                'cooperatives': city.get('totalCooperatives', str()),
                                'people': city.get('totalPeople', str()),
                                'cooperatives_anmes': ';'.join(city.get('cooperativeNames', list())),
                            }
