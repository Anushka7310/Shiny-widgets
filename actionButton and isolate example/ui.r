library(shiny)
shinyUI(fluidPage(
  titlePanel("Demonstration of actionBUtton and isloate"),
  sidebarPanel(
    selectInput(
      "dataset",
      "Choose a dataset:",
      choices = c("iris", "pressure", "mtcars")
    ),
    numericInput("obs", "Number of observations:", 6),
    br(),
    actionButton("act", "Click on the button to update/view the observation of the dataset dataset")

  ),
  mainPanel(
    h4(textOutput("dataname")),

    verbatimTextOutput("structure"),

    h4(textOutput("observation")),
    tableOutput("view")
  )
))
