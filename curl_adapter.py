
import requests
from requests_curl import CURLAdapter

def open_curl_session():
	session = requests.Session()
	session.mount("http://", CURLAdapter())
	session.mount("https://", CURLAdapter())
	return session