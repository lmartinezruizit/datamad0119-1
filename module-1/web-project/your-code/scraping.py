from bs4 import BeautifulSoup
import asyncio, requests
import json

class IronhackMeetupMembers:
    """
    This is the constructor class to which you can pass a bunch of parameters. 
    These parameters are stored to the class instance variables so that the
    class functions can access them later.
    
    url_pattern: the regex pattern of the web urls to scape
    content_parser: a function reference that will extract the intended info from the scraped content.
    """
    def __init__(self, url_pattern, ids=[]):
        self.url_pattern = url_pattern
        self.ids = ids
        self.content_parser = quotes_parser
        self.members_groups = {}

    """
    Scrape the content asynchronously.
    """
    async def async_func(self):
        loop = asyncio.get_event_loop()
        futures=[]
        
        futures = [loop.run_in_executor(None, requests.get, self.url_pattern % i) for i in self.ids]
        for response in await asyncio.gather(*futures):
            
            #I take the id from url
            id = response.url.rsplit('/', 1)[-2].rsplit('/', 1)[-1]
            
            self.members_groups[str(id)] = self.content_parser(response.content)
            print(id)

    """
    After the class is instantiated, call this function to start the scraping jobs.
    This function uses a FOR loop to call `async_func()` for each url to scrape.
    """
    def kickstart(self):
        loop = asyncio.get_event_loop()
        loop.run_until_complete(self.async_func())


"""
This function extract the specific content of the scrape
"""
def quotes_parser(content):
    soup = BeautifulSoup(content, "lxml")

    groups_list = soup.select("#my-meetup-groups-list")
    if not groups_list or len(groups_list) <= 0:
        return []

    groups=[x.text for x in groups_list[0].find_all("h4") if x.text != '']
    return groups