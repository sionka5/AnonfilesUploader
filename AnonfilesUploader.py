import requests
import json

url = 'https://api.anonfiles.com/upload'
file = input("File name: ")
files = {'file':(file, open(file, 'rb'))}
r = requests.post(url, files=files)

with open('outputfile.json', 'w') as f:
    f.write(r.text)


with open("outputfile.json", "r") as read_file:
    jsondata = json.load(read_file)
    link = jsondata['data']['file']['url']['short']
    print("Link to file: ", link)