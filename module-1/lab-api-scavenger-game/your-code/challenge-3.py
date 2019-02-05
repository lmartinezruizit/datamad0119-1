import base64
import requests


req = requests.get('https://api.github.com/search/code?q=repo:ironhack-datalabs/scavenger+filename:.scavengerhunt')

if req.ok:
    req = req.json()
    r=req["items"][0]["url"]
    numbers=[]
    lista=[]
    lista_2=[]
    lista_3=[]
    for i in req["items"]:
        lista.append(i["url"])
        numbers.append(int(i["name"][1:5]))
    for j in lista:    
        req_down=requests.get(j)
        req_down=req_down.json()
        lista_2.append(req_down['download_url'])
    for k in lista_2:
        req_value=requests.get(k)
        lista_3.append(req_value.text.replace("\n",""))
    
    dictionary=dict(zip(numbers, lista_3))
    dictionary=dict(sorted(dictionary.items()))
    print(' '.join(dictionary.values()))
    # print(lista_3)
else:
    print('Content was not found.')
