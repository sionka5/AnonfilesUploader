import requests
import json
import os

url = 'https://api.anonfiles.com/upload'
file = input("File name: ")
files = {'file':(file, open(file, 'rb'))}
r = requests.post(url, files=files)


template = {"status": True}
template_status = template['status']

with open('outputfile.json', 'w') as f:
    f.write(r.text)

with open("outputfile.json", "r") as read_file:
    jsondata = json.load(read_file)
    status = jsondata['status']

    if(status == template_status):
        link = jsondata['data']['file']['url']['short']
        print("Link to file: ", link)
    else:
        error = jsondata['error']['message']
        print("Cant upload coz: ", error)




