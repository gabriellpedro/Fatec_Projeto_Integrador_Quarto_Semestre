from manager.manager import Manager
from bs4 import BeautifulSoup
import requests


class StateInformation(Manager):
    """
        Class used to extract information about 
        states from brasil.
    """
    def __init__(self):
        super(StateInformation, self).__init__()
        self.primordial_link = 'https://www.infoescola.com/geografia/estados-do-brasil/'
        self.by_state = dict()
        self.possible_request_error = (requests.exceptions.ConnectTimeout,
                                        requests.exceptions.SSLError,
                                        requests.exceptions.ConnectionError,
                                        requests.exceptions.ReadTimeout)

    def extract_states(self) -> None:
        self.send_requisitons_requests(self.primordial_link)
        if self.availiable:
            self.soup = BeautifulSoup(self.response.text, 'html.parser')
            self.states_box = self.soup('h2')
            self.images_box = self.soup.find_all('img', {'decoding': 'async'})
            if len(self.states_box):
                for state in self.states_box:
                    possible_state = state.text
                    if "(" in possible_state and ")" in possible_state:
                        final_image = str()
                        state_id = state.attrs.get('id', str())[:-3]
                        for image in self.images_box:
                            possible_image = image.get('src')
                            if possible_image and state_id in possible_image:
                                final_image = possible_image
                        simbol = possible_state.split('(')
                        state = simbol[0].strip()
                        simbol = simbol[1].replace(')', str()).strip()
                        self.by_state[simbol] = {
                            'simbol': simbol,
                            'state': state,
                            'state_img': final_image,
                        }
