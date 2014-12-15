library(shiny)
library(quantreg)
#library(RODBC)

wae <- read.csv('data/WAE_independent.csv', header=T)

shinyUI(pageWithSidebar(
  
  headerPanel("Distribution of quantile regression slopes in walleye"),

  sidebarPanel(
  
  sliderInput('lengthRange', 'Length Range (mm)', min=min(wae$length), 
               max=max(wae$length), value=c(250, 750), step=1, round=0),
 
  sliderInput('quantile', 'Quantile', min=0.01, max=0.99, value=0.75, step=0.01),
  
  numericInput("sampleSize", "How many observations in each sample?", value = 100), 
  numericInput("bootstrapSamples", "Number of bootstrap regressions", value = 1000),
  em("More bootstrap samples will increase computation time."), 
  checkboxInput('normality', 'Display results of Shapiro-Wilk test for normality')
    
    
  ),

  mainPanel(
    plotOutput('plot')
  )
  ))        