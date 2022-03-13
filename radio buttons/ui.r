library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "Demonstration of sliderInput and selectInput widget in shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "slide",
        "Select the value from Slider",
        min = 0,
        max = 5,
        value = 2,
        animate = TRUE,
        step = 0.2
      ),
      selectInput(
        "statenames",
        "Select the state",
        c("INDIA", "AUSTRALIA", "RUSSIA", "INDONESIA"),
        selected = "INDIA"
      )
    ),
    mainPanel(textOutput("out"),
              textOutput("state"))
  )
))
