from bs4 import BeautifulSoup
import requests
import pandas as pd
import re
from time import sleep
import random

# Setting up a timer (w/ random delay)
# for i in range(5):
#     print(f"Doing something... round {i+1}")
#     delay = random.uniform(1, 5)
#     print(f"Delay is {delay:.2f}")
#     sleep(delay)

# example page range
# for page in range(1, 6):
#     url = f"https://www.hplovecraft.com/writings/texts/fiction/{page}"
#     print(f"This is page {url}")


# /fiction/{page}.aspx

url = f"https://www.hplovecraft.com/writings/texts/"

r = requests.get(url)

soup = BeautifulSoup(r.content, 'html.parser')

#content = soup.find_all('a', href=f"fiction/{re.search('[a-zA-Z]', content)}.aspx")
# links = soup.find_all('a', {'href': re.compile(r'fiction')})
stories = []

links = soup.find_all('a', href=re.compile(r'fiction'))
print(links)

for page in links:
    href = page.get('href')  # Extract the href attribute as a string
    
    if href and 'fiction/' in href:
        # Find where 'fiction/' starts
        fiction_index = href.find('fiction/')
        
        # Calculate where the actual filename starts (after 'fiction/')
        start_index = fiction_index + len('fiction/')
        
        # Extract everything after 'fiction/'
        filename = href[start_index:]
        
        print(f"filename: {filename}")
        
        storyurl = "https://www.hplovecraft.com/writings/texts/fiction/"+filename
        res = requests.get(storyurl)
        soup = BeautifulSoup(res.content, 'html.parser')

        title = soup.find('b').text

        storycontent = soup.find('div').text

        story_stuff = {
            'title': title,
            'content': storycontent
        }
        stories.append(story_stuff)
        print(stories)


