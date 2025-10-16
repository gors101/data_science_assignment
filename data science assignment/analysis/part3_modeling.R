install.packages("tidyverse")
library(tidyverse)

temp_data <- read.csv("C:/Users/gors1/PycharmProjects/PythonProject/data/combined_table.csv", header=TRUE)
str(temp_data)

model_age <- lm(event_count ~ age, data=temp_data)
summary(model_age)

model_gender <- lm(event_count ~ gender, data=temp_data)
summary(model_gender)

model_day <- lm(event_count ~ day_been_user, data=temp_data)
summary(model_day)

mul_model <- lm(event_count ~ age+ gender+day_been_user, data=temp_data)
summary(mul_model)

model_type <- lm(event_count ~ signup_date, data=temp_data)
summary(model_type)



temp_data[temp_data$event_count >=25,]$event_count <- 1
temp_data[temp_data$event_count <25,]$event_count <- 0
str(temp_data)


pre_age <- glm(event_count ~ age, data=temp_data, family=binomial)
summary(pre_age)

pre_gender <- glm(event_count ~ gender, data=temp_data, family=binomial)
summary(pre_gender)

pre_day_been_user <- glm(event_count ~ day_been_user, data=temp_data, family=binomial)
summary(pre_day_been_user)

