library(remotes)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
library(dplyr)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input,output){
  output
}

shinyApp(ui,server)