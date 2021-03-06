from urllib import request
from io import BytesIO
from PIL import Image
import pandas as pd

#open csv file
myData = pd.read_csv('beforeCol.csv')

#to dataframe
df = pd.DataFrame(myData, columns=['name', 'img', 'color'])

def color(r, g, b):
  #black
  if r<=51 and g<=51 and b<=51:
    return 'black'
  #white
  elif r>204 and g>204 and b>153:
    return 'white'
  #gray
  elif r/256 == g/256 == b/256:
    return 'gray'
  #red
  elif (51<=r<102 and g<51 and 51<=b<102) or (102<=r<153 and g<51 and b<102) or (153<=r<204 and g<102 and b<102) or (r>=204 and g<153 and b<153):
    return 'red'
  #blue
  elif (r<51 and 102<=g<153 and b>=204) or (r<102 and 52<=g<102 and b>=102) or (r<51 and g<51 and b>=102) or (51<=r<102 and g<51 and b>=153) or (102<=r<153 and g<51 and b>=204):
    return 'blue'
  #pink
  elif (r>=204 and g<204 and b>=153) or (153<=r<204 and g<153 and 102<=b<204) or (153<=r<204 and g<102 and b>=204) or (102<=r<153 and g<102 and 102<=b<153) or (r>=204 and 51<=g<102 and 102<=b<153):
    return 'pink'
  #purple
  elif (51<=r<102 and g<51 and 102<=b<153) or (102<=r<153 and g<153 and 153<=b<204) or (102<=r<153 and 51<=g<153 and 51<=b<153) or (153<=r<204 and 102<=g<204 and b>=204):
    return 'purple'
  #yellow
  elif (102<=r<204 and 102<=g<153 and b<102) or (153<=r<204 and 153<=g<204 and b<153) or (r>=204 and g>=204 and b<153):
    return 'yellow'
  #orange
  elif (102<=r<153 and 51<=g<102 and b<102) or (153<=r<204 and 51<=g<102 and 51<=b<102) or (153<=r<204 and g>=204 and b<51) or (r>=204 and 102<=g<153 and 51<=b<153) or (r>=204 and 153<=g<204 and b<153):
    return 'orange'
  #lightBlue
  elif (51<=r<204 and g>=204 and b>=153) or (r<153 and g>=204 and b>=204) or (r<153 and 153<=g<204 and b>=153) or (51<=r<102 and 102<=g<153 and b>=153) or (r<51 and 102<=g<153 and 153<=b<204):
    return 'lightBlue'
  #green
  else:
    return 'green'

for i in df.index:
  lastAdress = df.loc[i, 'img']
  url = 'https://play-lh.googleusercontent.com/' + str(lastAdress)
  res = request.urlopen(url).read()
  img = Image.open(BytesIO(res))
  #img.convert("RGB")
  #width, height = img.size
  #print(width, height)  
  pixel = img.load()

  colors = {'black':0, 'white':0, 'gray':0, 'red':0, 'pink':0, 'purple':0, 'green':0, 'blue':0, 'lightBlue':0, 'yellow':0, 'orange':0}
  
  #print(type(pixel[0,0]))
  
  
  #in one picture
  for x in range(0, 128):
    for y in range(0, 128):
      #get rgb value in the position [x,y]
      if str(type(pixel[x,y])) =="<class 'int'>":
        r = pixel[x,y]
        g = pixel[x,y]
        b = pixel[x,y]
      else:
        pix = list(pixel[x,y])
        r = pix[0]
        g = pix[1]
        b = pix[2]
      
      #determine what color
      theColor = color(r,g,b)
      #count
      if theColor == 'black':
        colors['black'] += 1
      elif theColor == 'white':
        colors['white'] += 1
      elif theColor == 'gray':
        colors['gray'] += 1
      elif theColor == 'red':
        colors['red'] += 1
      elif theColor == 'pink':
        colors['pink'] += 1
      elif theColor == 'purple':
        colors['purple'] += 1
      elif theColor == 'green':
        colors['green'] += 1
      elif theColor == 'blue':
        colors['blue'] += 1
      elif theColor == 'lightBlue':
        colors['lightBlue'] += 1
      elif theColor == 'yellow':
        colors['yellow'] += 1
      elif theColor == 'orange':
        colors['orange'] += 1
      
      mainColor = max(colors, key=colors.get)
  #df = df.append({'color' : mainColor}, ignore_index=True )
  df.color[i] = mainColor

df.to_csv('ColorContain', encoding='utf-8-sig', index=False)
