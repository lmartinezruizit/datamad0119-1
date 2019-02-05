import requests
import json

def count_repo_commits_lastWeek(commits_url):
    r = requests.get(commits_url)
    commits = json.loads(r.content)
    return commits['all'][-1]

commits_count=count_repo_commits_lastWeek('https://api.github.com/repos/ironhack-datalabs/datamad0119/stats/participation')
print("Commits for datamad01019: {}".format(commits_count))
commits_count_18=count_repo_commits_lastWeek('https://api.github.com/repos/ironhack-datalabs/mad-oct-2018/stats/participation')
print("Commits for mad-oct-2018: {}".format(commits_count_18))
req = requests.get('https://api.github.com/search/code?q=repo:ironhack-datalabs/scavenger+filename:.scavengerhunt')