library(XML)
library(ggplot2)
library(reshape2)
library(RCurl)
library(stringr)

December <- c(3,4,5,6,7)
y <- c(96/100, 76/100, -5/100, -5/100, -2/100)
y1 <- c(0, .10, -.12, -.17, .04)

sentiment <- data.frame(December =December , y=y)
stock <- data.frame(December=December, y=y1)

plot(December,y,type="o", col="red")
points(December,y1,type="o",col="blue")

zz <- melt(list(sentiment=sentiment, stock=stock), id.vars="December")

ggplot(zz, aes(December, y=value, color=L1)) + 
  geom_point() + 
  geom_line(data=zz) +
  scale_color_manual("Dataset", 
                     values = c("sentiment" = "darkgreen", "stock" = "blue"))