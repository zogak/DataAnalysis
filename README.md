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


## Data Visualization
