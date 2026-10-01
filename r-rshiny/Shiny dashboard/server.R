# Server Definition for NSDUH Data Explorer
# Author: Johann Ravindranathan

### Get required packages
# The app requires ggplot2 and dplyr
library(ggplot2)
library(dplyr)

### Get and clean Data

NSDUH <- read.csv("https://raw.githubusercontent.com/cgmr-asu/NEU290/main/NSDUH.csv")
NSDUH <- NSDUH |> 
  filter(Year == 2018) |>
  rename(Mar12_17 = "Mar1_17")

### Define the server function
#   This should create and output a graph
#   The x-axis and y-axis variables should depend on user input
#   The graph should use either geom_point or geom_text depending on user input
#   The axis labels should show the variable name
#   The graph caption should include your name
server <- function(input, output){
  output$headline_graph <- renderPlot({ 
    
    x_axis <- input$x_var
    y_axis <- input$y_var
    marker <- input$marker
    
   
      if(marker == "point"){
        p1 <- NSDUH |>
        ggplot(aes(x = get(x_axis), y = get(y_axis))) +
          geom_point()+
          theme_minimal() +
          labs(#title = paste0("Use of the phrase ", x_axis),
            #subtitle = "BBC Online Headlines",
            x = x_axis,
            y = y_axis,
            caption = "Data from NSDUH, graph made by Johann Ravindranathan")
      } else{
        p1 <- NSDUH |>
        ggplot(aes(x = get(x_axis), y = get(y_axis), label = State)) +
          geom_text()+
          theme_minimal() +
          labs(#title = paste0("Use of the phrase ", x_axis),
            #subtitle = "BBC Online Headlines",
            x = x_axis,
            y = y_axis,
            caption = "Data from NSDUH, graph made by Johann Ravindranathan")
      }
      
    return(p1)
  })
  
  
  
}
