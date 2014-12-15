  
  library(shiny)
  library(quantreg)
  
  wae <- read.table('data/WAE Clean.txt', header=T)
  
  #  dataset <- wae
  

  shinyUI(pageWithSidebar(
  
    headerPanel("Walleye weight vs. length"),
  
    sidebarPanel(
    
      sliderInput('sampleSize', 'Sample Size', min=50, max=nrow(wae),
                  value=min(1000, nrow(wae)), step=50, round=0),
    
#      checkboxInput('nlsRegression', 'Display non-linear least-squares regression'),
      checkboxInput('linear', 'Linear'),
      checkboxInput('lsRegression', 'Display linear least-squares regression'),
      checkboxInput('quantileRegression', 'Display quantile regression'),
      
      sliderInput('quantile', 'Quantile', min=0.01, max=0.99, value=0.5, step=0.01),
      em("Currently, quantile regression is implemented for linear data only.")
#      checkboxInput('doICare', "I don't care about modeling fisheries data.")
    
    ),
  
    mainPanel(
      plotOutput('plot')
    )
  ))