#Load libraries
library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
        # Application title
        titlePanel("Prediction App,  predict MPG by car weight and transmission type."),
        
        #Create the layout used for input the data
        sidebarLayout(
                sidebarPanel(
                  #Some documentation about the data
                  h4("Documentation:"),
                  p("To get help follow this: ", a("Help ", href="http://rpubs.com/CaDiez/MarMpgPredictionDoc")),
                  #p("The data mtcars was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74)."),
                  #Instructions
                  h4("How to use this application:"),
                  p("Adjust the slider to fit your car's weight, then choose wether your car is of automatic or manual transmission type. The predicted MPG value, regression graph and diagnostics will react to your input immediately. Please scroll down to review all the elements."),
                  #Slider for weight      
                  sliderInput("weight",
                              label = h3("Please your car´s weight in lb:"),
                              min = 1000,
                              max = 6000,
                              value = 3000),
                  #List Box for Trasmission Type
                  selectInput("am",
                              label = h3("Please select your car´s transmission type"),
                              choices = list("Automatic" = 0,
                                             "Manual" = 1),
                                              selected = 0
                                    )

                ),
                #Create the layout for presenting the results
                mainPanel(
                        h3("Summary model, MPG prediction and Regression Graphic"),
                        verbatimTextOutput ("model"),
                        h4(textOutput("predictedMpg"), style = "color:red; font-size: 14px"),
                        plotOutput("distPlot"),
                        h3("Diagnostic plots"),
                        h4("Residuals vs Fitted"),
                        plotOutput("residual1"),
                        h4("Normal QQ-plot"),
                        plotOutput("residual2")
                )
        )
))
