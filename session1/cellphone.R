# Umair Chaanda
# DSC465 Homework-1 
# Problem-5 - Cell Phone Pricing Plans


# loading packages
library(dplyr)
library(mosaic)
library(lubridate)
library(ggplot2)

# ********************DATA FRAME*********************

# creating a data frame named cellPlans
cellPlans = data.frame(
    c("ATT", "Sprint", "Verizon", "ATT", "Sprint",
      "Verizon", "ATT", "Sprint", "Verizon", "ATT",
      "Verizon", "Sprint", "Verizon", "ATT",
      "Verizon", "Sprint", "ATT", "ATT", "Sprint"),
    c(1, 1, 2, 3, 3, 4, 6, 6, 8, 10, 12, 12, 16, 16,
      24, 24, 25, 30, 40),
    c(30, 20, 35, 40, 30, 50, 60, 45, 70, 80, 80, 60,
      90, 90, 110, 80, 110, 135, 100))


# names of the columns in data frame
names(cellPlans) = c("Company", "DataGB", "Price")


head(cellPlans) # see top portion of the data
cellPlans       # see complete data


# *******Trend b/w Price and Data Bandwidth Per Company********

# *****************AESTHETICS AND GEOMS******************

# define aesthetic
a <- ggplot(cellPlans, aes(DataGB, Price, color=Company))


# set geoms
a1 <- a + 
  geom_line(size=1, alpha=1) +
  geom_point()


# *****************PLOT TITLE AND LABELS*******************

# define default theme, plot title, and labels for x and y axis
a2 <- a1 +
  theme_bw() +
  ggtitle("Trend B/w Price And Data Bandwidth Per Company") +
  xlab("Data Bandwidth") + ylab("Price of the Plan")


# change the color, size, face and position of plot title and axis
a3 <- a2 + 
  theme(
    plot.title = element_text(color="#993333", size=14, face="bold", hjust = 0.5),
    axis.title.x = element_text(color="#993333", size=14, face="bold"),
    axis.title.y = element_text(color="#993333", size=14, face="bold")
  )


# *****************TICK MARKS AND LABELS***********************

# customize tick marks on y and x axis
a4 <- a3 + 
  scale_y_continuous(breaks=seq(0,140,10)) +    # y = tick marks from 0 to 140 with break 10
  scale_x_continuous(breaks=seq(0,40,5))        # x = tick marks from 0 to 40 with break 5


# Change the face, color, and size of axis tick labels
a5 <- a4 + 
  theme(
    axis.text.x = element_text(face="bold", color="black", size=10),
    axis.text.y = element_text(face="bold", color="black", size=10))


# ***********************AXIS LINES***************************

# Change the line type and color of x and y axis lines
a6 <- a5 + 
  theme( 
    axis.line = element_line(colour = "black", size = 1, linetype = "solid"))

a6


# ****************Cell Phone Companies Plans Comparison*************

# *****************AESTHETICS AND GEOMS******************

# define aesthetic
b <- ggplot(cellPlans, aes(DataGB, Company, color=Company))


# set geoms
b1 <- b + 
  geom_point(aes(size = DataGB))


# *****************PLOT TITLE AND LABELS*******************

# define default theme, plot title, and labels for x and y axis
b2 <- b1 +
  theme_bw() +
  ggtitle("Cell Phone Companies Plans Comparison") +
  xlab("Data Bandwidth") + ylab("Companies")


# change the color, size, face and position of plot title and axis
b3 <- b2 + 
  theme(
    plot.title = element_text(color="#993333", size=14, face="bold", hjust = 0.5),
    axis.title.x = element_text(color="black", size=14, face="bold"),
    axis.title.y = element_text(color="black", size=14, face="bold")
  )


# *****************TICK MARKS AND LABELS***********************

# customize tick marks on y and x axis
b4 <- b3 + 
  scale_x_continuous(breaks=seq(0,40,5))        # x = tick marks from 0 to 40 with break 5


# Change the face, color, and size of axis tick labels
b5 <- b4 + 
  theme(
    axis.text.x = element_text(face="bold", color="black", size=10),
    axis.text.y = element_text(face="bold", color="black", size=10))


# ***********************AXIS LINES***************************

# Change the line type and color of x and y axis lines
b6 <- b5 + 
  theme( 
    axis.line = element_line(colour = "black", size = 1, linetype = "solid"))

b6



