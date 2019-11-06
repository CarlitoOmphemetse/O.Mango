library(remotes)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)
library(dplyr)
library(plotly)

setwd('C:/Users/MG-Lab-PC/Desktop/SPECIAL TOPICS EXAM')

ui <- dashboardPage(
  dashboardHeader(title = 'South African Crime Analytics'),
  dashboardSidebar(
    sidebarMenu(
      
      uiOutput('selectWid'),
      DTOutput('dt'),
      uiOutput('radio'),
      menuItem('plot',tabName = 'first'),
      menuItem('plot2',tabName = 'second')
      
    
      
    )
  ),
  dashboardBody(
    fluidRow(
      
      tabItems(
        tabItem(tabName = 'first'),
        
        tabItem(tabName = 'second',
                
                column(width = 10,
                       plotOutput('bar')
                ),
                
                column(width = 2)
                
                )
        
      )
      
      
    )
  )
)

server <- function(input,output){
  
  
  
  df<- read.csv('data.csv')

  
  output$selectWid <- renderUI({
    
    selectInput(inputId = 'selectWid',label = 'Choose crime category',choices = unique(df$Category))
    
  })
  
  output$bar <- renderPlotly({
  
  plotly(df$category,df$Province) 
    
    
    
  })
  
  output$radio <- renderUI({
    radioButtons(inputId = 'radio',label = 'Select province',choices= unique(df$Province))
  })
  
  output$dt <- renderDT({
    
    datatable(data,options = list(df$radio))
    
  })
  
 # render reactive()
 
    
 
  
  
  
  
  
}

shinyApp(ui,server)


