EstLinQuantRegCoefDist <- function(df, n = 50, numSamples, tau = 0.75){
  
  regCoefs <- as.data.frame(matrix(NA, nrow = n, ncol=2))
  
  for(i in 1:n){
    rowVec <- sample(1:nrow(df), numSamples, replace=T)
    tmp <- df[rowVec, ]
    mod <- rq(log10(weight)~log10(length), data=tmp, tau = tau)
    
    regCoefs[i,1] <- mod$coefficients[1]
    regCoefs[i,2] <- mod$coefficients[2]
  }
  names(regCoefs) <- c("intercept", "slope")
  return(regCoefs)
}
