library(dplyr)
library(ggplot2)
first_data <- read.csv(file="DataAnalysis-main/data3.csv")
second_data <- read.csv(file="DataAnalysis-main/ColorContain.csv")

second_data <- second_data %>% select(name, color)
targetData <- first_data %>% full_join(second_data, by=c('App'='name'))
View(targetData)

#for whole data
#1.relation between SIZE and INSTALLS
ggplot(data=targetData, aes(Size, Installs)) + geom_point()

#by group
#Installs by Category
category_install <- targetData%>%group_by(Category)%>%summarize(mean_Installs = mean(Installs))
CI <- category_install
#sort
CI$Category <- factor(CI$Category, levels=CI$Category[order(CI$mean_Installs)])
ggplot(data=CI, aes(x = mean_Installs, y = Category)) + geom_bar(stat = 'identity')

#table(targetData$color)

#that has color
allCol <- targetData %>% filter(!is.na(color))
ggplot(data=allCol, aes(x = Rating, y = Category)) + geom_point(shape = 21, color = 'black', fill = allCol$color, size = 3, stroke = 0.7)

ggplot(data=allCol, aes(x = color, y = Category)) + geom_point(size = 3, color = allCol$color)
ggplot(data=allCol, aes(x = color, y = Category)) + geom_point(shape = 21, color = 'black', fill = allCol$color, size = 3, stroke = 0.7)

colGroup <- allCol
colGroup$color <- factor(colGroup$color, levels=c('red','pink','orange','yellow','green','lightBlue','blue','purple','black','white'))
ggplot(data=colGroup, aes(x = color, y = Category)) + geom_point(shape = 21, color = 'black', fill = allCol$color, size = 3, stroke = 0.7)


barplot(table(allCol$color))


#category bul color
