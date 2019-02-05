import json
import requests
from dotenv import load_dotenv
import os

def language_repo_forks(fork_url):
    response = requests.get(fork_url)
    results = response.json()
    lista=[]
    lista=[lang['language'] for lang in results]
    lista=(set(lista))
    return lista

language_fork=language_repo_forks('https://api.github.com/repos/ironhack-datalabs/datamad0119/forks')
print("Languages for datamad01019: {}".format(language_fork))
language_fork_18=language_repo_forks('https://api.github.com/repos/ironhack-datalabs/mad-oct-2018/forks')
print("Languages for mad-oct-2018: {}".format(language_fork_18))