# Umair Chaanda
# DSC465 Homework-3 
# Problem-4 - Air Quality

# loading packages
library(ggplot2)    # grammar of graphics
library(dplyr)      # data wrangling
library(mosaic)     # dealing with data
library(lubridate)  # dealing with dates
library(reshape)    # for the melt command
library(tidyverse)  # makes it easier to work with data
library(scales)     # to make less intense versions of the colors
library(datasets)   # for AirQuality dataset
library(ggforce)    # for sina plots
library(ggbeeswarm) # for beeswarm plots
library(magrittr)   # %$% gives access to individual columns
library(scales)     # 
library(gcookbook)  # Load gcookbook for the aapl data set
library(tidyquant)  # for moving averages


library(datasets) # for AirQuality dataset
aq <- airquality %>%
  drop_na() # convenient way to remove rows with missing values

head(aq)

x <- aq$Wind
y <- aq$Solar.R

# scatterplot
plot(x, y, main = "Relationship Between Wind and Solar with a Fit Line",
     xlab = "WIND", ylab = "SOLAR RADIATION",
     pch = 19, frame = FALSE)

# Add loess fit
lines(lowess(x, y), col = "blue")


# --------------------------------------
#         PIVOTING/MELTING DATA
# --------------------------------------

head(aq)
ds <- as.data.frame(aq) # make our copy
head(ds)

# Melt collapses columns into one field 
# like the "pivot" feature in Tableau
# The id parameter here tells what fields to keep (i.e. not "melt")
aqTrans = melt(ds, id=c("Month","Day"))
head(aqTrans)


# rename the new field with the column name to "Measurement"
names(aqTrans)[3] = "Measurement"
head(aqTrans)


# **********************************************************
# ************Multiple Distribution Comparisons*************
# **********************************************************
# There are lots of ways to compare mutiple distriubtions. 
# The right one for a given visualization depends on data, audience and message.


# Comparing Wind and Solar Distributions
# BEESWARM PLOT
aqTrans %>% 
  filter(Measurement == 'Wind' | Measurement == 'Solar.R') %>% # pipe symbol means or (& means and)
  ggplot(aes(Measurement, log(value))) +
  geom_beeswarm() +
  theme_bw() +
  ggtitle("Comparing Distributions of Wind and Solar.R ")


# Now we can compare the different measurements.
# BEESWARM PLOT
aqTrans %>% 
  ggplot(aes(Measurement, log(value))) +
  geom_beeswarm() +
  theme_bw() +
  ggtitle("Comparing Multiple Distributions Using All Variables")


# **********************************************************
# *****************Fine Detail Distribution*****************
# **********************************************************
# There is a convenient tool for comparing a distribution to the 
# Normal distribution in ggplot: geom_qq.

library(magrittr) # %$% gives access to individual columns
library(scales)

# Note this is starting back from the non-transformed version in the previous section
# This could be accomplished with mutate but then we need a separate step to remove 
# all the extra variables
aq.qq <- aq %$%
  data.frame(wind=sort(Wind),
             ozone=sort(Ozone),
             solar=sort(Solar.R),
             temp=sort(Temp))
head(aq.qq)


# To add that 45 degree line, we have to actually scale the values to the same range.
# We can just scale them all to be 0 to 1.
# There are a few ways to accomplish this, including scaling variables when they're sorted, 
# rescaling in the aesthetic, or using mutate. You can write the formula yourself, or use the rescale function.

# scaling when they're sorted
aq.qq <- aq %$%
  data.frame(wind=rescale(Wind, to=c(0,1)) %>% sort,
             ozone=rescale(Ozone, to=c(0,1)) %>% sort,
             solar=rescale(Solar.R, to=c(0,1)) %>% sort,
             temp=rescale(Temp, to=c(0,1)) %>% sort)
head(aq.qq)


aq.qqpl <- aq.qq %>%
  ggplot(aes(wind,solar)) + 
  geom_point() + 
  geom_abline(slope=1, intercept=0) +
  theme_bw() +
  ggtitle("Compare Wind and Solar With a QQ plot")

aq.qqpl


