Prediction App,  predict MPG by car weight and transmission type.
========================================================
author: Carlos Alberto Guevara Diez
date: December, 2015
transition: rotate
transition-speed: slow 

Introduction
========================================================
In this project I am going to explore the relationship between car transmission type, car weight and the miles per gallon obtained, the specific questions I am going to address are:

- Is an automatic or manual transmission better for MPG?
- Quantify the MPG difference between automatic and manual transmissions
- Show residual plots that help to understand the accuracy of the prediction

In order to answer the questions, I am using an interactive application that it is going to be explained further.

For the purpose of this analisys I am using the mtcars dataset available in R, for further information about the dataset please refer to its [help file](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html).

Considerations for the analysis
========================================================

- Develop a Shiny web application based on a prediction model.
- The statistical model base has been taken from a previous class exercise, nevertheless it have been modified for this new specific purpose.
- This documentation file was made using R Studio Presenter.
- The prediction model used is as follows:

```r
#Build model
fit <- lm(mpg ~ wt + am + am*wt, mtcars)
weight   = 4.0      # 4 Weight (lb/1000)
transm   = 1        # Transmission (0 = automatic, 1 = manual)
predict(fit, data.frame(wt = weight, am = transm))
```

How to use Shiny Application
========================================================
As I have said in the introduction, the shiny application is very simple and the main purpose is to explore the product,nevertheless the results obtained are as expected and the ease of use is amazing.

To interact with the app, adjust the slider to fit your car's weight, then choose wether your car is of automatic or manual transmission type. The predicted MPG value, regression graph and diagnostics will react to your input immediately at the right side of the screen, please scroll down to review all the elements of the output.

The Shiny application  can be accessed in the web following the link:
[Car MPG Prediction App](https://cadiez.shinyapps.io/CarMpgPrediction)


Final thoughts
========================================================
The main puropse of this application its to play with two extraordinary tools for Data Science: Shiny and R Studio Presenter, to do that, I have built a very simple shiny application that uses several web parts (slider, input, graphics, documentation class) and shows how interactive this kind of application might be, undoubtely, this kind of products are truly useful in real life applications.

The second product, R Studio Presenter really have a huge potential, the creation of slides is very simple, with some scripting, markdown and YAML you can get great results in a very short amount of time. I really love how easy is to build presentations using this product, and believe that the final result (this documentation file) fulfill with the requirements in a very short time.

Thank you for reading this presentation I have really enjoyed creating it.
