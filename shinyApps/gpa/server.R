#  source("lm_eqn.R")
  gpaData <- read.table('data/gpaData.txt', header=T, as.is = T)
 

  shinyServer(function(input, output) {

#    dataset <- reactive(function(){
#      gpaData[as.character(gpaData$name2) == as.character(unique(gpaData$name2)[input$School]), ]
#    })
    dataset <- reactive(function(){
      gpaData[gpaData$name2 == input$School, ]
    })
    
   
    #Create the linear least-squares regression model
#    lmMod <- reactive(function() {
#      lm(dataset()$gpa~dataset()$year, data = dataset())
#    })
    

    output$plot <- renderPlot({
      
#      qplot(x = dataset()$year, y = dataset()$gpa, data = dataset(), xlab = "Year", ylab = "GPA", 
#            main = dataset()$name2)# + geom_abline(intercept = coef(lmMod())[1], 
                                   #               slope = coef(lmMod())[2], 
                                   #               col = "blue", 
                                   #               lwd = 1.1)
      plot(x = dataset()$year, y = dataset()$gpa, type = "b", pch = 19, col = "blue", 
           main = dataset()$name2[1], xlab = "YEAR", ylab = "GPA")

      }) #Close renderPlot statement
    
    }) #Close shiny statement


      

    
        

     

  
    