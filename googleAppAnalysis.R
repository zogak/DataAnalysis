#Google Play Store Data Analysis
library(dplyr)

#open csv file
data <- read.csv(file = "DataAnalysis-main/googleplaystore.csv")

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

#remove NA
data1 <- na.omit(data)
View(data1)
dim(data1)

#remove unrefined rows
data2 <- data1[!(data1$Installs)==0,]
View(data2)

table(data2$Category)
table(data2$Type)

#remove NAN in column "Rating"
data2$Rating <- as.numeric(data2$Rating)
View(data2)
table(is.nan(data2$Rating))
data2 <- na.omit(data2)
View(data2)

#remove rownames
rownames(data2) <- NULL
View(data2)

#unit integration(to Mbyte) in column"Size"

Kbyte <- grep('k', data2$Size)
View(data2[Kbyte,])
rownames(data2[Kbyte,])

#store the number of rows whose size is kbyte to the new vector called KbyteRows
KbyteRows <- c(rownames(data2[Kbyte,]))
KbyteRows

#remove character 'k'
data2[Kbyte,]$Size <- gsub("[k]", "", data2[Kbyte,]$Size)
View(data2[Kbyte,])

#remove character 'M'
data2[Kbyte,]$Size <- gsub("[M]", "", data2[-Kbyte,]$Size)
View(data2[Kbyte,])

#change type of 'Size' column into numeric
data2$Size <- as.numeric(data2$Size)
View(data2)

#multiply 0.001 to those originally kByteRows
data2[KbyteRows,]$Size <- data2[KbyteRows,]$Size*0.001
View(data2[KbyteRows,])

View(data2)
table(is.na(data2$Size))

#select app, category, rating, reviews, size, installs, type
data3 <- data2%>%select(App, Category, Rating, Reviews, Size, Installs, Type)
View(data3)
write.csv(data3,"DataAnalysis-main/data3.csv", row.names=FALSE)
