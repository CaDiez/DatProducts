#Load libraries
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        
                output$distPlot <- renderPlot({                
                # define linear regression model
                fitModel <- lm(mpg ~ wt + am + am*wt, mtcars)
                #Plot the graphic
                ggplot(data = mtcars, aes(x = mpg, y = wt, colour = factor(am))) +
                        geom_point() + 
                        stat_smooth(method=lm) +
                        scale_colour_discrete(name  ="Transmission Type",
                                              labels=c("Automatic", "Manual")) +
                        xlab("Miles/(US) gallon") +
                        ylab("Weight (lb/1000)") +
                        geom_point(data = data.frame(wt = input$weight/1000,
                                                     mpg = predict(fitModel, data.frame(wt = input$weight/1000, am = as.numeric(input$am))),
                                                     am = 0),
                                   aes(x = mpg, y = wt), colour = "blue", size = 5)
                        })
                #Plot diagnostics graphics
                output$residual1 <- renderPlot(plot(lm(mpg ~ wt + am + am*wt, mtcars),which=1,col="blue",pch=16))
                output$residual2 <- renderPlot(plot(lm(mpg ~ wt + am + am*wt, mtcars),which=2,col="blue",pch=16))
                #Print summary of the linear model
                output$model <- renderPrint(summary(lm(mpg ~ wt + am + am*wt, mtcars)))    
                #Print the MPG predictions
                output$predictedMpg <- renderText({
                fitModel <- lm(mpg ~ wt + am + am*wt, mtcars)
                output <- format(round(predict(fitModel, 
                                 data.frame(wt = input$weight/1000, am = as.numeric(input$am))),
                                 digit = 3), nsmall = 3)
                p1 <- paste("MPG Predictions: ", output)
                paste(p1, "MPG")
        })
})
