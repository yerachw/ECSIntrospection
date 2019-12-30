import requests
import os
import json

result = requests.get(url = 'http://169.254.169.254/latest/meta-data/instance-id')
print('The instance ID is: ' + result.text)

url = os.environ.get('ECS_CONTAINER_METADATA_URI')
print('ECS_CONTAINER_METADATA_URI: ' + url)
result = requests.get(url = url + '/task')
print(result.text)
data = json.loads(result.text)
print ('TaskARN=' + data['TaskARN'])