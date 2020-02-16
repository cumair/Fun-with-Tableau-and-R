# Umair Chaanda
# DSC465 Homework-2 
# Problem-3(b) - Portland Water Level


# loading packages
library(ggplot2)    # grammar of graphics
library(dplyr)      # data wrangling
library(mosaic)     # dealing with data
library(lubridate)  # dealing with dates
library(reshape)    # for the melt command
library(tidyverse)  # makes it easier to work with data
library(gcookbook)  # Load gcookbook for the heightweight data set
library(scales)     # to make less intense versions of the colors
library(data.table)

# import data using RStudio 
head(water)


# *******Water Level by hour of time and date********
# *****************AESTHETICS AND GEOMS******************

# change the format of date
water$Date <- as.Date(water$Date, format = "%m/%d/%Y")

# order time
water$Time <- factor(water$Time, 
                     levels(water$Time)[c(1:2,13,18:24,3:12,14:17)])

# define aesthetic
a <- ggplot(water, aes(x=Date, 
                       y=Time, 
                       fill=WL))

# set geoms
a1 <- a + 
  geom_tile()

a1

# *****************PLOT TITLE AND LABELS*******************

# define default theme, plot title, and labels for x and y axis
a2 <- a1 +
  theme_bw() +
  ggtitle("Portland Water Level by Hour of Time and Date") +
  xlab("Date") + ylab("Hour of Time")


# change the color, size, face and position of plot title and axis
a3 <- a2 + 
  theme(
    plot.title = element_text(color="darkblue", size=14, face="bold", hjust = 0.5),
    axis.title.x = element_text(color="darkblue", size=14, face="bold"),
    axis.title.y = element_text(color="darkblue", size=14, face="bold")
  )

a3
