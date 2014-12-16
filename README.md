shinyApps
=========

*Apps that have been published to the Shiny server*

This repository will include all apps that I have pushed to the Shiny server.  As of 14 Dec 2014, I have three apps published to Shiny.  They include:

* https://stevenranney.shinyapps.io/waeDemo/ - My first app (published 12 Aug 2014) as a 'proof of concept' for myself.  This is a simple app, meant only as a training exercise.  The plots in this app are 'standard' plots and regressions are "standard" plots for fisheries science.  Indeed, weight-length data is some of the most important data collected in fisheries (see Ranney et al. 2010 and Ranney et al. 2011 for more information).
* https://stevenranney.shinyapps.io/craps - An app for fun (published 9 Sep 2014).  I spent a cold and windy Sunday afternoon coding a craps simulation in `R` in winter 2013.  Recently I decided that it'd be fun to rewrite that for publication to Shiny.
* https://stevenranney.shinyapps.io/slopeDistDemo - Much more academic (published 1 Sep 2014), I wrote this app to easily explore how the distribution of the slopes of fisheries weight-as-a-function-of-Length data changes as the length range of a population changes.  This is part of a manuscript I'm working on to introduce quantile regression of fisheries weight-length data as a means to compare actual fish weights to estiated fish weights of different distributions.
* https://stevenranney.shinyapps.io/gradeInflation - An exercise in web scraping (15 Dec 2014), I pulled these data from the website [GradeInflation.com](http://www.gradeinflation.com) for disply purposes.  I doubt most people realize how prevalent--and rapid--grade inflation is throughout our university system.  

I have learned that Shiny Apps are an excellent tool for visualizing how models change with different data.  While plots can easily be updated from within R code, redisplayed, and evaluated on a desktop, using Shiny to visualize this information can make changes much more clear and simple to execute.  

Look for new subfolders here as I write more apps.

#####References

[Ranney, S. H., M. R. Fincel, M. R. Wuellner, J. A. VanDeHey, and M. L. Brown. 2010. Assessing length-related bias and the need for data standardization in the development of standard weight equations. North American Journal of Fisheries Management 30:655-664.](http://www.steven-ranney.com/pubs/Ranney%20et%20al_2010_Ws%20equations.pdf)

[Ranney, S. H., M. R. Fincel, M. R. Wuellner, J. A. VanDeHey, and M. L. Brown. 2011. Assessing length-related biases in standard weight equations: response to comment. North American Journal of Fisheries Management 31:661-665.](http://www.steven-ranney.com/pubs/Ranney%20et%20al_2011_Ws%20equations%20response.pdf)