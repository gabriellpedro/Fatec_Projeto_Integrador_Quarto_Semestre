from recicle_apis_consume.libs.parameter.parameters import headers
import requests


class Manager(object):
    """
        Class used to manage request
        from any source
    """
    def __init__(self):
        self.response = None
        self.params = None
        self.json_data = None
        self.headers = headers
        self.possible_request_error = (requests.exceptions.ConnectTimeout,
                                        requests.exceptions.SSLError,
                                        requests.exceptions.ConnectionError,
                                        requests.exceptions.ReadTimeout)

    def send_requisitons_requests(self, base_url: str, verify: bool=True, method: str='GET') -> None:
        """
            Class used to send requisitions using the library
            requests passing parameters like params and headers.

            Receive as a parameter the url that is
            going to be used to send the requisition.
        """
        tried = int()
        while True:
            if tried > 5:
                self.availiable = False
                self.response = None
                break
            try:
                if method == 'GET':
                    self.response = requests.get(base_url,
                                                headers=self.headers,
                                                timeout=10,
                                                params=self.params,
                                                json=self.json_data,
                                                verify=True if verify else False)
                elif method == 'POST':
                    self.response = requests.post(base_url,
                                                headers=self.headers,
                                                timeout=10,
                                                params=self.params,
                                                json=self.json_data,
                                                verify=True if verify else False)                   
                if self.response and self.response.status_code in range(200, 300):
                    self.availiable = True
                    break
                else:
                    tried += 1
            except self.possible_request_error:
                tried += 1
                print(f'Connection Error - Trying the {tried} attempt...')
                continue




