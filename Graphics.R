install.packages("ggplot2")
install.packages('plyr')
install.packages("hexbin")
install.packages("gcookbook")
install.packages("lattice")
libs <- c("ggplot2", "plyr", "hexbin", "gcookbook")
lapply(libs, require, character.only = T)
data(aapl)
head(aapl)
#-----------------------------------------------------------------------------------

# Basic Histogram
hist(airqu$adj_price)

#-----------------------------------------------------------------------------------

# More detailed Histogram
#ggplot(aapl, aes(x = adj_price)) + geom_histogram()

#-----------------------------------------------------------------------------------

# Base colored scatter plot
plot(Solar.R ~ Wind,
     data=subset(airquality))
points(Solar.R ~ Wind,
       data=subset(h=airquality))

#-----------------------------------------------------------------------------------

# Colored scatter plot
ggplot(subset(aapl),
       aes(x=date,
           y=adj_price,
           color="pink"))+
  geom_point()

#-----------------------------------------------------------------------------------

## Points (Scatterplot)
hp2001Q1 <- subset(aapl) 
ggplot(hp2001Q1,
       aes(y = adj_price, x = date)) +
  geom_point()

#-----------------------------------------------------------------------------------

#Lines (Prediction Line)
hp2001Q1$pred.SC <- predict(lm(adj_price ~ date, data = hp2001Q1))
p1 <- ggplot(hp2001Q1, aes(x = date, y = adj_price))
p1 + geom_point(aes(color = 'pink')) +
  geom_line(aes(y = pred.SC))

p1 +
  geom_point(aes(color = 'pink')) + ## Smoothers
  geom_smooth()


dotchart(VADeaths, main = "Death Rates in Virginia - 1940")
op <- par(xaxs = "i")  # 0 -- 100%
dotchart(t(VADeaths), xlim = c(0,100),
         main = "Death Rates in Virginia - 1940")
par(op)

#-----------------------------------------------------------------------------------

dotchart(islands2, main = "Area of Islands")
op <- par(xaxs = "i")  # 0 -- 100%
dotchart(t(islands2), xlim = c(0,100),
         main = "Area of Islands")
par(op)

#plot(aapl$date, aapl$adj_price, log = "y")



