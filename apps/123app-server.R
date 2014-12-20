library(shiny)
library(ggplot2)
library(scales)

#load and preprocess the data
origdata <- read.csv('./data/activity.csv',
                     header = TRUE, na.strings = 'NA', stringsAsFactors = FALSE)

#transform the date column from character to date type
origdata$date <- as.Date(origdata$date, format = '%Y-%m-%d')

#create and append the day of the week factor variable to the data data.frame
origdata$DayOfWeek <- weekdays(origdata$date)
origdata$DayOfWeek <- as.factor(origdata$DayOfWeek)

output$text1 <- renderText({
        input$days
        })
    
output$text2 <- renderText({
       mean(origdata$steps[origdata$DayOfWeek %in% input$days], na.rm = TRUE)
    })
    


