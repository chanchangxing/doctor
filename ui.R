#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  headerPanel(""),
  
  sidebarPanel(
    fileInput('file1', "choose csv file",
              accept = c("text/csv", 
                         'text/comma-separated-values,text/plain', 
                         'xlsx',
                         'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')),
    helpText("*病人的名字列名必须设置为\"姓名\""),
    helpText("*病人的性别列名必须设置为\"性别\""),
    helpText("*病人的年龄列名必须设置为\"年龄\"")
  ),
  
  mainPanel(
    h5("该文件中病人数量"),
    textOutput('people'),
    h5("该文件中男女数量"),
    tableOutput('gender'),
    h5("病人平均年龄"),
    textOutput("age_avg")
  )
))
