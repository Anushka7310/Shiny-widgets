

library(shiny)
shinyUI(fluidPage(
  titlePanel(
    h4(
      'Iris Dataset',
      align = "center"
    )
  ),


  sidebarPanel(
    selectInput(
      "var",
      label = "1. Select the quantitative Variable",
      choices = c(
        "Sepal.Length" = 1,
        "Sepal.Width" = 2,
        "Petal.Length" = 3,
        "Petal.Width" = 4
      ),
      selected = 3
    ),


    sliderInput(
      "bin",
      "2. Select the number of histogram BINs by using the slider below",
      min = 5,
      max = 25,
      value = 15
    ),

    radioButtons(
      "colour",
      label = "3. Select the color of histogram",
      choices = c("Green", "Red",
                  "Yellow"),
      selected = "Green"
    )
  ),


  mainPanel(
    tabsetPanel(
      type = "tab",
      tabPanel("Summary", verbatimTextOutput("sum")),
      tabPanel("Structure", verbatimTextOutput("str")),
      tabPanel("Data", tableOutput("data")),
      tabPanel("Plot", plotOutput("myhist"))
    )

  )

))
