# Main Script for NSDUH Explorer App
# Author: Johann Ravindranathan

library(shiny)

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)