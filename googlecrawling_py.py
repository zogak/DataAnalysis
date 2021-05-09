from bs4 import BeautifulSoup
from urllib.request import urlopen
import pandas as pd

#create new dataframe
df = pd.DataFrame(columns=['name', 'img'])

response = urlopen('https://play.google.com/store/apps/collection/cluster?clp=0g4eChwKFnRvcHNlbGxpbmdfZnJlZV9FVkVOVFMQBxgD:S:ANO1ljIri5g&gsr=CiHSDh4KHAoWdG9wc2VsbGluZ19mcmVlX0VWRU5UUxAHGAM%3D:S:ANO1ljL2Xvw&hl=ko&gl=US')
soup = BeautifulSoup(response, 'html.parser')

#app image and title
blocks = soup.find_all(class_='Vpfmgd')
for block in blocks:
  name = block.find(class_="WsMG1c nnK0zc").text
  img = block.find(class_="T75of QNCnCf").get('data-src')
  print(name)
  print(img)

  df = df.append({
      'name' : name,
      'img' : img
  }, ignore_index = True)

df.to_csv('PlayStoreImgs36', encoding='utf-8-sig', index=False)
