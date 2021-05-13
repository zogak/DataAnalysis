library(dplyr)
#open csv file
imgData <- read.csv(file= "D:/21_1/appAnalysis/PlayStoreImgData.csv")
View(imgData)
str(imgData)

#eliminate https://
imgData$img <- substring(imgData$img, 39)
View(imgData)

#remove duplicates
imgData <- unique(imgData)
str(imgData)

#remove rownames
rownames(imgData) <- NULL

#save csv
write.csv(imgData,"imgData.csv", row.names=FALSE)

#open data3c
data3 <- read.csv(file = "D:/21_1/appAnalysis/data3.csv")
downsized <- imgData %>% inner_join(data3, by = c('name' = 'App'))
