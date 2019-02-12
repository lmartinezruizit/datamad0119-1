from bs4 import BeautifulSoup
import asyncio, requests
import json

class IronhackMeetupMembers:
    """
    This is the constructor class to which you can pass a bunch of parameters. 
    These parameters are stored to the class instance variables so that the
    class functions can access them later.
    
    url_pattern: the regex pattern of the web urls to scape
    pages_to_scrape: how many pages to scrape
    sleep_interval: the time interval in seconds to delay between requests. If <0, requests will not be delayed.
    content_parser: a function reference that will extract the intended info from the scraped content.
    """
    def __init__(self, url_pattern, sleep_interval=-1,ids=[]):
        self.url_pattern = url_pattern
        self.ids = ids
        self.sleep_interval = sleep_interval
        self.content_parser = quotes_parser
        self.members_groups = {}
    
    async def async_func(self):
        loop = asyncio.get_event_loop()
        futures=[]
        
        futures = [loop.run_in_executor(None, requests.get, self.url_pattern % i) for i in self.ids]
        for response in await asyncio.gather(*futures):
            id = response.url.rsplit('/', 1)[-2].rsplit('/', 1)[-1]
            
            self.members_groups[str(id)] = self.content_parser(response.content)
            print(id)

                    
        # self.output_results(data)


    """
    Scrape the content of a single url.
    """
    def scrape_url(self, url):
        response = requests.get(url)
        result = self.content_parser(response.content)
        self.output_results(result)
    
    """
    Export the scraped content. Right now it simply print out the results.
    But in the future you can export the results into a text file or database.
    """
    def output_results(self, r):
        print(r)
    
    """
    After the class is instantiated, call this function to start the scraping jobs.
    This function uses a FOR loop to call `scrape_url()` for each url to scrape.
    """
    def kickstart(self):
        loop = asyncio.get_event_loop()
        loop.run_until_complete(self.async_func())
        # for i in self.ids:
        #     self.scrape_url(self.url_pattern % i)


"""
This is a custom parser function you will complete in the challenge.
Right now it simply returns the string passed to it. But in this lab
you will complete this function so that it extracts the quotes.
This function will be passed to the IronhackSpider class.
"""
def quotes_parser(content):
    soup = BeautifulSoup(content, "lxml")

    groups_list = soup.select("#my-meetup-groups-list")
    if not groups_list or len(groups_list) <= 0:
        return []

    groups=[x.text for x in groups_list[0].find_all("h4") if x.text != '']
    return groups

# Instantiate the IronhackSpider class
# ih_members = IronhackMeetupMembers(URL_PATTERN, content_parser=quotes_parser,ids)

# Start scraping jobs
# ih_members.kickstart()