library(shiny)
shinyUI(fluidPage(
  titlePanel("demonstration of actionButton and isolate"),
  sidebarLayout(
    sidebarPanel(
      textInput("text1", "Enter your first name"),
      textInput("text2", "Enter your last name"),
      actionButton("action", "Update last name"),
      p("Click on update button to update and display the last name")
    ),
    mainPanel(textOutput("txt1"),
              textOutput("txt2"))
  )
))
