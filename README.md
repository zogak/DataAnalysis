# Google Play Store Data Analysis
to figure out overall characteristics of apps in Google Play Store

## Contents
- [Data Acquistion](#data-acquisition)
- [Data Preprocessing](#data-preprocessing)
- [Data Visualization](#data-visualization)

## Data Acquisition
- Google Play Store Apps Data
  * from [Kaggle](https://www.kaggle.com/lava18/google-play-store-apps)
- Google Play Store Img Data
  * crawling data
  * crawling code : googlecrawling.py

## Data Preprocessing
__1. Architecture__

<img src="https://user-images.githubusercontent.com/76643037/119264109-bb280380-bc1c-11eb-9089-5c42498def46.png" width="60%">

  * GoogleAppAnalysis.R : preprocessing code of data 'Google Play Store Apps Data'
  * ImgDataPrep.R : preprocessing code of data 'Google Play Store Img Data'
  * visualization.R : visualizing code of the target data
  * googlecrawling.py : Google Play Store crawling code (App name, img url)
  * color.py : extracting the most used color from the App img

__2. Color classification__

<img src="https://user-images.githubusercontent.com/76643037/120064751-db3a4580-c0a8-11eb-8d4f-e52fe419c0e4.png" width="80%">
(R,G,B) has value between 0 - 255 each.<br>
I set R,G,B as axis in 3D space and divided each axis with 5 ranges(0-50,51-101,102-152,153-203,105-255).<br>
Then, it is divided into total 125 ranges and I specified one color for each range.<br>
I limited the color to 10(red, pink, orange, yellow, green, lightblue, blue, purple, white, black).<br>
<br>

<img src="https://user-images.githubusercontent.com/76643037/120064753-de353600-c0a8-11eb-9ef3-5724b379071e.png" width="80%">
Each app img is consists of 128X128 pixels.<br> 
With RGB values for each pixel, I specified the pixel's color by putting RGB values to the formula above.<br>

*ex) if a certain pixel has (220, 50, 50) RGB value, the pixel's color is 'red'.*

After specifying colors of all pixels in the img, I set the img's color to the pixel's color that appeared the most.
<br>

## Data Visualization
<p>
<img src="https://user-images.githubusercontent.com/76643037/119490882-4aa5f180-bd98-11eb-8069-296f0bd6af51.png" width="32%">
<img src="https://user-images.githubusercontent.com/76643037/119490978-63aea280-bd98-11eb-8c75-85a39878b90e.png" width="32%">
<img src="https://user-images.githubusercontent.com/76643037/119490993-6a3d1a00-bd98-11eb-9ca9-a1d8f29ce507.png" width="32%">
 
 * Rating - Reviews
 * Size - Installs
 * Type - Rating
</p>

<p>
<img src="https://user-images.githubusercontent.com/76643037/119491036-74f7af00-bd98-11eb-9c9e-35ec3706626e.png" width="32%">
<img src="https://user-images.githubusercontent.com/76643037/119491077-7cb75380-bd98-11eb-8b14-8c472b23b1df.png" width="32%">
 
 * mean Installs - Category
 * mean Size - Category
</p>

<p>
<img src="https://user-images.githubusercontent.com/76643037/119491182-9789c800-bd98-11eb-8a6e-5423c8042078.png" width="32%">
<img src="https://user-images.githubusercontent.com/76643037/119491138-8b9e0600-bd98-11eb-946a-61c81bf5e305.png" width="32%">
<img src="https://user-images.githubusercontent.com/76643037/119491155-90fb5080-bd98-11eb-86b7-a5122c27dc37.png" width="32%">
</p>

