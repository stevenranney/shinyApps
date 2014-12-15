
  wae <- read.table('data/WAE Clean.txt', header=T)
  
  shinyServer(function(input, output) {

    dataset <- reactive(function() {
      wae[sample(nrow(wae), input$sampleSize, replace=TRUE), ]
    })
    

    #Create the linear least-squares regression model
    lmMod <- reactive(function() {
      lm(log10(dataset()$Weight)~log10(dataset()$Length))
    })
    
    #Create the linear quantile regression model
    quantMod <- reactive(function(){
      rq(log10(dataset()$Weight)~log10(dataset()$Length), tau=input$quantile)
    })
    
    #Create the nonlinear regression model
    nlsMod <- reactive(function() {
      nls(dataset()$Weight~alpha*dataset()$Length^beta,
          start=list(alpha=0.000001, beta=3.0), data=dataset())
    })
    
    #Create the nonlinear quantile regression model
    nonlinQuantMod <- reactive(function(){
      nlrq(dataset()$Weight~alpha*dataset()$Length^beta, 
           start=list(alpha=0.000001, beta=3.0), tau=input$quantile)
    })
    
    #Create a sequence of numbers from min-max Length
    wae.mod <- reactive(function() {
        seq(min(dataset()$Length), max(dataset()$Length), by=.1)
    })
    
  
    output$plot <- renderPlot({
      
      plot(Weight~Length, xlab = "Length (mm)", ylab = "Weight (g)", data=dataset())
#        if (input$nlsRegression){
#         lines(wae.mod(), predict(nlsMod(), list(Length=wae.mod())), col="red", lwd=2)
#        }
#        if (input$quantileRegression){
#          lines(wae.mod(), predict(nonlinQuantMod(), list(Length=wae.mod())), col="blue", lwd=2)
#        }
      
       
    if (input$linear){
      plot(log10(dataset()$Weight)~log10(dataset()$Length), 
           xlab = "log10(Length)", ylab = "log10(Weight)")
        if (input$lsRegression){
          abline(lmMod(), col="red", lwd=2)
          legend("topleft", paste0(round(summary(lmMod())$coef[1], 3), " + ", 
                                    round(summary(lmMod())$coef[2], 3), " x log10(Length)"), 
                 bty="n", lty=1, lwd=2, col="red")        
        }
        if (input$quantileRegression){
          abline(quantMod(), col="blue", lwd=2, lty=2)
          legend("bottomright", paste0(round(summary(quantMod())$coef[1], 3), " + ", 
                                    round(summary(quantMod())$coef[2], 3), " x log10(Length)"), 
                 bty="n", lty=2, lwd=2, col="blue")        
        }
    }
        
#    if (input$doICare){
#      plot(dataset()$Length, dataset()$Weight, pch="", xlab = "Length (mm)", ylab = "Weight (g)")
#      legend("center", "You don't care what happens here.", cex=1.5, bty="n")
#    }
    
      }) #Close renderPlot statement
    
    }) #Close shiny statement


      

    
        

     

  
    