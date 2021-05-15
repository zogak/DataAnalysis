library(dplyr)
#open csv file
imgData <- read.csv(file= "DataAnalysis-main/PlayStoreImgData.csv")
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
write.csv(imgData,"DataAnalysis-main/imgData.csv", row.names=FALSE)

#open data3
data3 <- read.csv(file = "DataAnalysis-main/data3.csv")
downsized <- imgData %>% inner_join(data3, by = c('name' = 'App'))
View(downsized)

#remove same name
downsized1 <- downsized[-which(duplicated(downsized$name)),]
rownames(downsized1) <- NULL
View(downsized1)

#data prepared for counting color (==small)
small <- downsized1 %>% select(name, img)
View(small)
write.csv(small, "DataAnalysis-main/beforeCol.csv", row.names=FALSE)
