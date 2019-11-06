library(remotes)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
library(dplyr)

setwd('C:/Users/MG-Lab-PC/Desktop/SPECIAL TOPICS EXAM')

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      uiOutput('selectWid')
    )
  ),
  dashboardBody()
)

server <- function(input,output){
  
df <- read.csv('data.csv')
  
  output$selectWid <- renderUI({
    
    selectInput(inputId = 'selectWid',label = 'Choose crime category',choices = unique(df$Category))
    
  })
  
}

shinyApp(ui,server)


