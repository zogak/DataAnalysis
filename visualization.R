library(dplyr)
library(ggplot2)
first_data <- read.csv(file="DataAnalysis-main/data3.csv")
second_data <- read.csv(file="DataAnalysis-main/ColorContain.csv")

second_data <- second_data %>% select(name, color)
targetData <- first_data %>% full_join(second_data, by=c('App'='name'))
View(targetData)

#for whole data
#review and rating
ggplot(data=targetData, aes(Rating, Reviews)) + geom_jitter(size = 2, alpha=0.8, height=0.2) + scale_y_log10()

#relation between SIZE and INSTALL
ggplot(data=targetData, aes(Size, Installs)) + geom_jitter(size=2,height = 0.8) + scale_y_log10()
mean(targetData$Size, na.rm = TRUE)

#type and rating
ggplot(data=targetData, aes(Type, Rating)) + geom_boxplot(width = 0.3)

#by group
#category & install
category_install <- targetData%>%group_by(Category)%>%summarize(mean_Installs = mean(Installs))
CI <- category_install
#sort
CI$Category <- factor(CI$Category, levels=CI$Category[order(CI$mean_Installs)])
ggplot(data=CI, aes(x = mean_Installs, y = Category)) + geom_bar(stat = 'identity')

#category & size
category_size <- targetData %>% filter(!is.na(Size))
category_size <- category_size%>%group_by(Category)%>%summarize(mean_size = mean(Size))
CS <- category_size
CS$Category <- factor(CS$Category, levels=CS$Category[order(CS$mean_size)])
ggplot(data=CS, aes(x = mean_size, y = Category)) + geom_bar(stat='identity')

#that has color
allCol <- targetData %>% filter(!is.na(color))
ggplot(data=allCol, aes(x = Installs, y = Category)) + geom_jitter(shape = 21, color = 'black', fill = allCol$color, size = 4, width = 0.6, height = 0.2) + scale_x_log10()

ggplot(data=allCol, aes(x = color, y = Category)) + geom_point(size = 3, color = allCol$color)
ggplot(data=allCol, aes(x = color, y = Category)) + geom_point(shape = 21, color = 'black', fill = allCol$color, size = 3, stroke = 0.7)

colGroup <- allCol
colGroup$color <- factor(colGroup$color, levels=c('red','pink','orange','yellow','green','lightBlue','blue','purple','black','white'))
ggplot(data=colGroup, aes(x = color, y = Category)) + geom_point(shape = 21, color = 'black', fill = allCol$color, size = 3, stroke = 0.7)

#merge blue & the most used color
blueColor <- allCol
blueColor[blueColor$color == 'lightBlue', 'color'] <- 'blue'
table(blueColor$color)
barplot(sort(table(blueColor$color), decreasing = TRUE), col=c('white','darkblue','darkred','black','darkgreen','purple3','gold','pink1','orange2'))
