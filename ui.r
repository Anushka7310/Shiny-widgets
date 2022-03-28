library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "This is my first shiny app, hello shiny!"),
  sidebarLayout(position = "right",
                sidebarPanel(
                  h3("this is the side  bar panel"), h4("widget"), h5("widget5")
                ),
                mainPanel(
                  h4("this is the main panel text, output is displayed here"),
                  h5("this is the output5")
                ))
))
