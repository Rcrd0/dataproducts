#
# ui.R
#
# Coursera class
# Developing data products
# Project assignment part 1

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Central Limit Theorem"),
    sidebarPanel(
        h3('Model Input'), # fallo
        numericInput("iSampleSize", label = h4("Sample Size"),
                     min = 1, max = 50, value = 1, step = 1),        
        sliderInput("iLambda", label = h4("Lambda"),
                    min = 0.05, max = 10, value = 0.2, step = 0.05),
        sliderInput("iSimulations", label = h4("Number of simulations"),
                    min = 1, max = 10000, value = 1000, step = 1),
        actionButton("iPB", "Plot results!")
    ),
    mainPanel(
        h4('Theoretical distribution vs simulation Results'), 
        p('This application plots the average of n exponentials and compares its distribution to the one predicted by the Central Limit Theorem'),
        p('Please, use the controls on the left to select the sample size, lambda value and number of simulations'),
        p('Then click on Plot Results! to see how the average of n exponentials (n = sample size) compares to a normal distribution'),
        plotOutput('OutChart')
    )
))
