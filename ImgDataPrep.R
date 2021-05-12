#open csv file
imgData <- read.csv(file= "PlayStoreImgData.csv")
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
