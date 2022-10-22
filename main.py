
import logging, os, sys, json, time
from curl_adapter import open_curl_session

def setup_logging():
	logging.basicConfig(format='[%(asctime)s][%(levelname)s][%(name)s]\t%(message)s',
                      datefmt='%m/%d/%Y %H:%M:%S',
                      handlers=[logging.StreamHandler(sys.stdout)],
                      level=logging.INFO)
	
	logging.info('set up logging')

def open_session():
	session = open_curl_session()
	return session

def main():
	pass

if __name__ == '__main__':
	setup_logging()
	main()