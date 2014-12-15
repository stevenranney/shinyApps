source("EstLinQuantRegCoefDist.r")

wae <- read.csv('data/WAE_independent.csv', header=T)

shinyServer(function(input, output) {
  
  dataset <- reactive(function() {
    wae[wae$length>input$lengthRange[1] & wae$length<input$lengthRange[2], ]
  })
  

  tmp <- reactive(EstLinQuantRegCoefDist(df = dataset(), n = input$bootstrapSamples, 
                                         numSamples = input$sampleSize, tau = input$quantile))
  
  shapiroResults <- reactive(shapiro.test(sample(tmp()[,2], 4900, replace=T)))

output$plot <- renderPlot({
    
    hist(tmp()[,2], breaks = 25, col="gray", xlab = "Slope", main = "Distribution of slopes")
    abline(v=quantile(tmp()[,2], probs=0.025), lty=2)
    abline(v=quantile(tmp()[,2], probs=0.975), lty=2)
    abline(v=quantile(tmp()[,2], probs=0.5, type=6), col="red")
    abline(v=mean(tmp()[,2]), col="blue", lty=2)
    legend("topright", lty=c(2,1,2,2), legend=c("2.5%", "Median", "Mean", "97.5%"), 
           col=c("black", "red", "blue", "black"), bty="n")
    
    if(input$normality){
        legend("topleft", legend=c(paste0("W = ", round(shapiroResults()$statistic, 3)), 
                                   paste0("p = ", signif(shapiroResults()$p.value, 3))),
               bty="n")
    }
    
    })
  
})
  
  