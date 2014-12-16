
gpaData <- read.csv("C:/Users/Steven Harris Ranney/Documents/GitHub/shinyApps/shinyApps/gpa/data/gpaData.csv", 
                      header = T)
                      
#for(i in 1:2){
for(i in 1:length(unique(gpaData[,4]))){
  jpeg(paste0("C:/Users/Steven Harris Ranney/Desktop/plots/", unique(gpaData[,4])[i], ".jpg"))
  tmp <- plot(as.numeric(gpaData[as.character(gpaData$name2) == as.character(unique(gpaData$name2)[i]), 2])~
              as.numeric(gpaData[as.character(gpaData$name2) == as.character(unique(gpaData$name2)[i]), 1]), 
                         data = gpaData[as.character(gpaData$name2) == as.character(unique(gpaData$name2)[i]), ], 
                         type = "b", col = "blue", main = unique(gpaData[,4])[i])
  dev.off()
}