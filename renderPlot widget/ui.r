
library(shiny)
shinyUI(fluidPage(


  titlePanel(h4('Demostration of the renderPlot() - A Histogram with iris dataset', align = "center")),


  sidebarPanel(



    selectInput("var", label = "1. Select the quantitative Variable",
                choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width"=4),
                selected = 3),


    sliderInput("bin", "2. Select the number of histogram BINs by using the slider below", min=5, max=25, value=15),

    radioButtons("colour", label = "3. Select the color of histogram",
                 choices = c("Green", "Red",
                             "Yellow"), selected = "Green")
  ),


  mainPanel(
    textOutput("text1"),
    textOutput("text2"),
    textOutput("text3"),
    plotOutput("myhist")

  )

)
)
