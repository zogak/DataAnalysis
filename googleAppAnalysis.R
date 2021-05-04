#Google Play Store Data Analysis
library(dplyr)

#open csv file
data <- read.csv(file = "D:/21_1/appAnalysis/googleplaystore.csv")

#data check
dim(data)
str(data)
View(data)

#data preprocessing

#remove duplicated Apps
duplicated(data$App) #check whether there are duplicates
data <- unique(data)
dim(data)

#remove special characters in column"Installs"
data$Installs <- gsub("[+$,]","",data$Installs)
#data
#data[data$Category=="ART_AND_DESIGN","Installs"]

#change chr type to numeric
data$Installs <- as.numeric(data$Installs)

#data$Installs
#mean(data$Installs, na.rm=T)
#data$Category
#data$Genres
#data$Content.Rating

#remove NA
data1 <- na.omit(data)
View(data1)
dim(data1)

#remove unrefined rows
data2 <- data1[!(data1$Installs)==0,]
View(data2)

table(data2$Category)
table(data2$Type)
#category개수대비 install수
#library(dplyr)
#data2%>%group_by(Category)%>%summarise(avg=mean(Installs))

#remove NAN in column "Rating"
data2$Rating <- as.numeric(data2$Rating)
View(data2)
table(is.nan(data2$Rating))
data2 <- na.omit(data2)
View(data2)

#unit integration in column"Size"
data2$Size <- gsub("[k]","000",data2$Size)
data2$Size <- gsub("[M]","",data2$Size)
data2$Size <- as.numeric(data2$Size)
View(data2)
table(is.na(data2$Size))
