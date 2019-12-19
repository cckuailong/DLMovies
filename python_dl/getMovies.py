from bs4 import BeautifulSoup
import os
import re
import json
import time
import requests
from requests.adapters import HTTPAdapter
import random
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


class Movie:
    def __init__(self, id):
        self.id = id
        self.title = ''
        self.actors = ''
        self.region = ''
        self.desc = ''
        self.urls = []
        
    def getCont(self):                
        s = requests.Session()
        s.keep_alive = False
        s.mount('http://', HTTPAdapter(max_retries=3))
        s.mount('https://', HTTPAdapter(max_retries=3))
        headers = {
            'X-Forwarded-For': '%s.%s.%s.%s'%(random.randint(1,255),random.randint(1,255),random.randint(1,255),random.randint(1,255)),
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36'
        }
        url = 'https://www.xxx.com/v/{}.html'.format(self.id)
        try:
            resp = s.get(url, headers=headers, verify=False, timeout=5)
            if resp.status_code == 200:
                with open("movie.html", "w", encoding="ISO-8859-1") as f:
                    f.write(resp.text)
        except:
            pass

    def parse(self):    
        with open("movie.html", "r", encoding="utf8") as f:
            cont = f.read()
        res = {}
        if not cont:
            return json.dumps(res)
        sp = BeautifulSoup(cont, "lxml")

        try:
            inputs = sp.find_all("div", "down_list")[0].find_all("input")
            for item in inputs:
                try:
                    self.urls.append({item["file_name"].strip(): item["value"].strip()})
                except:
                    pass
        except:
            pass
        if len(self.urls) == 0:
            return json.dumps(res)
        try:
            title = re.findall(r'《(.*?)》', str(sp.title))
            if title:
                self.title = title[0]
            else:
                self.title = str(sp.title)
        except:
            pass
        try:
            dds = sp.find_all("dd")
            self.actors = dds[1].text.split('：')[1].strip()
            self.region = dds[3].text.split('：')[1].strip()
            self.desc = dds[-1].text.strip()
        except:
            pass
               
        res = {"title":self.title, "actors":self.actors, "region":self.region, "desc":self.desc, "urls":self.urls}
        return json.dumps(res)

if __name__ == "__main__":
    for i in range(2525, 20000):
        print(i)
        movie = Movie(i)
        movie.getCont()
        res = movie.parse()
        with open("movies.csv", "a", encoding="utf8") as f:
            if len(res)>10:
                f.write("%s\t%s\n" % (i, res))
        time.sleep(random.randint(1,5))
