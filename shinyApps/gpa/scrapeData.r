

  
  #Open, download, and locate the links to each school's website on 
  #www.gradeinflation.com
  
  tab <- readLines("http://www.gradeinflation.com")
  
  #Identify strings of letters, followed by a ".html" that occur in rows 158 and
  # beyond; table of schools begins in row 158 of tab
  tmp <- str_extract(tab[c(158:length(tab))], "[a-zA-z]+[.][a-zA-Z]+")
  
  #Eliminate rows that are 'NA'
  tmp <- tmp[which(!is.na(tmp))]
  
  #Drop the last row which is only a link back to gradeinflation.com
  school <- tmp[-length(tmp)]
  #Remove row of SAT Comparison
  school <- school[-41]

  #Create string directly to each school's page by pasting the address
  link <- paste0("http://www.gradeinflation.com/", school)
  #Remove row of SAT Comparison
  link <- link[-41]
  #Remove the ".html" from the vector of school names 
  school <- gsub(".html", "", school)
  
  #Create a function that will allow R to open each html page individually, 
  #find the years and the associated GPAs, add the name of the school into the 
  #data frame, and compile all of the rows together so that at the end there is 
  #one dataFrame[N, 3], where columns are school, year, and GPAs

  allData <- NA 
  
  for(i in c(1, 3:195, 197:length(link))){
    #Read in each school's data
    tmp <- readLines(link[i])
    #Eliminate all spaces in the file
    tmp <- gsub(" ", "", tmp)
    #Look for values in the data that equation to 19XX or 20XX
    year <- str_extract(tmp, "[1-2]{1}[0|9]{1}[0-9]{2}<")
    #Eliminate nonexistent values
    year <- year[which(!is.na(year))]
    #Remove the HTML tags
    year <- gsub("<|>", "", year)
    
    #Find GPA values
    gpa <- str_extract(tmp, "[2-4]{1}[.][0-9]+<")
    #Eliminate nonexistent values
    gpa <- gpa[which(!is.na(gpa))]
    #Remove the HTML tags
    gpa <- gsub("<|>", "", gpa)
    
    #Cbind the data together
    info <- as.data.frame(cbind(as.numeric(year), as.numeric(gpa)))
    #Name the columns
    names(info) <- c("year", "gpa")
    #Add school name
    info$school <- school[i]

    #Add the 'info' data frame to the allData
    allData <- rbind(allData, info)
  }
  
#  write.csv(allData, "C:/Users/Steven Harris Ranney/Desktop/gpaData.csv", 
#            row.names = F)
  #Create some spotchecks
#  test <- sample(c(1, 3:195, 197:length(link)), .10*length(link), replace = F)
#  school[test]
  
  
