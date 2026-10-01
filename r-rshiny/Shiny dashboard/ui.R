# User Interface for NSDUH Data Explorer
# Author: Johann Ravindranathan

### Data Prep for the User Interface
#   Get the list of variables to select from for the x and y axes

NSDUH <- read.csv("https://raw.githubusercontent.com/cgmr-asu/NEU290/main/NSDUH.csv")
NSDUH <- NSDUH |> 
  filter(Year == 2018) |>
  rename(Mar12_17 = "Mar1_17")
variables <- names(NSDUH)



### Create the User Interface
#   It should create an app with two pages: Information and Explore Data
#   The information page should include information about the app and no interaction
#   The Explore Data page should have a title and sidebar layout
#   Three user inputs should be on the left. They allow the user to choose the:
#   x-axis variable, y-axis variable, and graph type
#   The axis choice inputs should use dropdowns; graph type is chosen with radio buttons

ui <- navbarPage( "NSDUH Explorer",
                  
      tabPanel("Information",
                  h2("NSDUH Information"),
                           p("Adapted from the November 26th in-class work on Shiny, this app will allow a user to explore previously seen NSDUH data by comparing variables in a graph.
                             The NSDUH dataset includes a swathe of information on marijuana, alcohol, and tobacco use amongst three main age demographics:
                             12-17, 18-25, and 26+ years old."),
                           p("This app was made by Johann Ravindranathan in INFO 201 @ University of Washington"),
                  ),

      tabPanel("Explore Data",
               h2("Trend Explorer"),
               sidebarLayout( 
                 sidebarPanel( 
                   # sidebar stuff goes here 
               selectInput(inputId = "x_var",
                             label = "Choose an x-axis variable:",
                             choices = c(variables),
                             selected = "State"
                           ),
                   
                selectInput("y_var",
                                label = "Choose a y-axis variable",
                                choices = c(variables),
                                selected = "Pop12_17"
                            ),
                radioButtons("marker",
                             label = "Choose Marker",
                             choices = c("point", "text"),
                             selected = "point"
                            )
                            
                 ), 
                 
                 mainPanel( 
                   # main panel stuff goes here
                   plotOutput(outputId = "headline_graph")
                   
                 ) 
               )
      )
                  
                  
)
