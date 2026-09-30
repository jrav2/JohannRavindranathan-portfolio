# About this folder
 This project was the culmination of my work studying the foundations of statistical models in R, specifically in this case with Linear Models. For my final project, I tested several linear models to find best-fit solution for describing how the populations density of animals in a certain environment. My goal was to find the combination of variables that best explained the observed animal densities in the dataset, while minimizing the complexity of the model.<br>

The chosen dataset included seven predictor variables and one response variable, being population density. 

In this folder I have included the dataset used, a pdf-version of the R Markdown sheet I used for my work, and the presentation I made to share my findings and results. 

### Description of Findings

My first step was preparing the dataset for my models. Five of the response variables (*ndvi,dist_water,elevation,human_footprint,snow_depth*) were continuous, and two of them (*region,season*) were categorical. I checked the continous variables for linearity and collinearity, and then played with their relationships with region and season. I decided to omit region as a variable, and the concentrate on the relationship between the continous variables and season.<br>

My initial linearity and collinearity tests found no issues with the continuous variables in the dataset. Of the two categorical variables, season and region, I chose to work only with season to reduce the scope of the project and make things more manageable. <br>

From here I built two types of model. The first strand used season as just another variable, meaning its effects were treated the same as any of the continuous variables. The second branch of models applied the effects of seasonality to all the continuous variables. In other words, the second model assumed that the influence of the continuous vairables would change based on the which season the data was recorded in. <br>

In both cases, I built the models additively by adding a variable in each subsequent model. I used Likelihood ratio testing and AICc testing to determine whether the added complexity contributed a significant improvement to the model accuracy. Ultimately I found that the best models did indeed use all six of the variables (the five continuous variables plus season). <br>

I compared the first and second types of models, and the second strand proved more likely. After running this winning formula through dredge(), I found my best fit model. 

