#
# server.R
#
# Coursera class
# Developing data products
# Project assignment part 1


library(shiny)
shinyServer(
    function(input, output) {
        
        output$OutChart <- renderPlot({
            input$iPB
            isolate({
                set.seed(1) 
                lambda <- input$iLambda
                number_experiments <- input$iSimulations
                sample_size <- input$iSampleSize
                
                # Theoretical parameters
                x_mean <- 1/lambda
                x_sd <- x_mean/sqrt(sample_size)
                
                # Results of the simulation
                experiment_results <- numeric(number_experiments)
                for (i in 1: number_experiments) {
                    experiment_results[i] <- mean(rexp(sample_size, lambda))
                }
                s_mean <- mean(experiment_results)
                s_sd <- sd(experiment_results)
                
                hist(experiment_results, col = "ivory", main="", xlab="", ylab="",xlim=c(x_mean-4*x_sd, x_mean+4*x_sd), prob = TRUE)
                abline(v = s_mean, lwd = 2, , col = "red")
                segments(s_mean, .1 , s_mean + s_sd, .1 , col = "red", lwd = 2)
                
                x <- seq(min(experiment_results), max(experiment_results), length.out = 100)
                curve(dnorm(x, mean = x_mean, sd=x_sd), add = TRUE, col = "blue", lwd=2)
                abline(v = x_mean, col = "blue", lwd = 2)
                segments(x_mean, .2 , x_mean + x_sd, .2 , col = "blue", lwd = 2)
                
                l1 <- sprintf("Theor: mu=%0.2f, sigma=%0.2f", x_mean, x_sd)
                l2 <- sprintf("Simul: mu=%0.2f, sigma=%0.2f", s_mean, s_sd)
                legend("topright", col = c("blue", "red"), lwd = 2, c(l1, l2))
                
           })
        })        
    }
)

