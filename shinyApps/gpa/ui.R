  
  library(shiny)
  library(ggplot2)

  gpaData <- read.table('data/gpaData.txt', header=T, as.is = T)

#  gpaData$year <- as.numeric(gpaData$year)
#  gpaData$gpa <- as.numeric(gpaData$gpa)
  
  #  dataset <- wae
  

  shinyUI(pageWithSidebar(
  
    headerPanel("Grade inflation at universities and colleges"),
  
    sidebarPanel(
    
      selectInput("School", label = h4("School"), 
                  choices = unique(as.character(gpaData$name2)))
#      selectInput("School", label = h4("School"), 
#                  choices = as.character(gpaData$name2), selected = unique(gpaData$name2[1]))
#      selectInput("School", label = h4("School"), 
#                  choices = gpaData$name2)#, selected = unique(gpaData$name2[1])),
      
#      checkboxInput('regression', 'Display linear least-squares regression')
    
    ),
  
    mainPanel(
      plotOutput('plot'), 
      p("These data are from the ", a("Grade Inflation", href = "http://www.gradeinflation.com"), "website.  They are presented here
        for educational, not-for-profit use only.  Please visit ", a("www.gradeinflation.com", 
        href = "http://www.gradeinflation.com"), "for a detailed discussion of grade inflation 
        in universities and colleges across the U.S.  The ", a("Grade Inflation ", href = "http://www.gradeinflation.com"),
        "website also contains detailed information on how these data were collected."),
      p("These data were collected automatically with R; every effort was made to clean the 
        data where necessary.  However, mistakes may remain.  If you find errors in the data, 
        please feel free to report them to: steven[dot]ranney[at]gmail[dot]com.  They will be updated
        as time allows."),
      p("I considered adding a linear regression line to each of these plots but thought better of it.  With some sort of 
        statistical representation comes potentially bad inferences.  The data are simply presented as GPA as a function of 
        Time.  Make of it what you will.  Between these graphical representations and the information available at ", 
        a("gradeinflation.com", href = "http://www.gradeinflation.com"), ", you should be able to come to your own conclusions.")
    )
  ))