#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(readxl)
library(sqldf)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
  output$people <- renderText({
    inFile <- input$file1
    if(is.null(inFile)) return(NULL)
    table <- read_xlsx(inFile$datapath)
  
    frame <- as.data.frame(table)
    name <- frame$姓名
    name <- name[!duplicated(name)]
    length(name)
  })
  output$gender <- renderTable({
    inFile <- input$file1
    if(is.null(inFile)) return(NULL)
    table <- read_xlsx(inFile$datapath)
    
    frame <- as.data.frame(table)
    m <- sqldf("select count(DISTINCT 姓名)
                   from frame 
                   where 性别 = 'M'")
    f <- sqldf("select count(DISTINCT 姓名)
                   from frame 
                   where 性别 = 'F'")
    女 <- m$'count(DISTINCT 姓名)'
    男 <- f$'count(DISTINCT 姓名)'
    data.frame(男, 女)
  })
  
  output$age_avg <- renderText({
    inFile <- input$file1
    if(is.null(inFile)) return(NULL)
    table <- read_xlsx(inFile$datapath)
    
    frame <- as.data.frame(table)
    
    avg <- sqldf("select avg(年龄) from frame")
    avg$'avg(年龄)'
  })
})
