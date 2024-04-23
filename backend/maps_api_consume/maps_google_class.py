from backend.manager.manager import Manager
import requests

API_KEY = ''

class MapsInformation(Manager):
    
    def _init_(self):
        super(MapsInformation, self)._init_()
        self.base_add = 'https://maps.googleapis.com/maps/api/geocode/json?'
        self.possible_request_error = (requests.exceptions.ConnectTimeout,
                                        requests.exceptions.SSLError,
                                        requests.exceptions.ConnectionError,
                                        requests.exceptions.ReadTimeout)
        
    def returns_localization(self, latlng):
        self.primordial_link = self.base_add  + 'latlng=' + latlng  + '&key=' + API_KEY
        self.send_requisitons_requests(self.primordial_link)