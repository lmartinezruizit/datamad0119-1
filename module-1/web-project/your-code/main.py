import asyncio, requests
import json
import io
import pandas as pd
import csv
import numpy as np
import datetime
from scraping import IronhackMeetupMembers
from member import Member

URL='https://api.meetup.com/ironhack-madrid/members?page=200&order=name&offset=%d'
MEMBER_ENDPOINT = 'https://www.meetup.com/members/%d' # regex pattern for the urls to scrape


async def main():
    loop = asyncio.get_event_loop()
    futures=[]
    data={}
    member_ids = []
    futures = [loop.run_in_executor(None, requests.get, URL % i) for i in range(32)]
    for response in await asyncio.gather(*futures):
        for member in json.loads(response.content):
            member_obj = Member(
                member['name'],
                member['joined'],
                member['status'],
                member['city'],
                member['country'],
                member['is_pro_admin']
            )
            
            if 'bio' in member:
                member_obj.set_bio(member['bio'])

            if 'role' in member['group_profile']:
                member_obj.set_role(member['group_profile']['role'])

            if 'photo' in member:
                member_obj.set_photo(member['photo']['photo_link'])
            
            if 'answer' in member['group_profile']['answers'][0]:
                member_obj.set_answer(member['group_profile']['answers'][0]['question'], member['group_profile']['answers'][0]['answer'])     
            
            data[str(member['id'])]=member_obj

            member_ids.append(member['id'])

    return (data, member_ids)

loop = asyncio.get_event_loop()
data, member_ids=loop.run_until_complete(main())
members_groups = IronhackMeetupMembers(MEMBER_ENDPOINT, ids=member_ids)
members_groups.kickstart()

# members_groups.members_groups
for key,member_groups in members_groups.members_groups.items():
    data[key].set_groups(member_groups)
    data[key]=data[key].get_as_dict()

final_data = {
    'count': len(data),
    'content': data
}

file_name = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
with open('result' + file_name + '.json', 'a', encoding='utf-8') as f:
    json.dump(final_data,f)