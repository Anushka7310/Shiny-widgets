library(shiny)
shinyUI(fluidPage(
  headerPanel("Shiny App Example using Video and Image"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload the file", multiple = TRUE),
      h6("Default max. file size is 5MB"),
      hr(),
      h5("Select the read.table parameters below"),
      checkboxInput(
        inputId = 'header',
        label = 'Header',
        value = FALSE
      ),
      checkboxInput(
        inputId = 'stringAsFactors',
        label = 'stringAsFactors',
        value = FALSE
      ),
      br(),
      radioButtons(
        inputId = 'sep',
        label = 'Separator',
        choices = c(
          Comma = ',',
          Semicolon = ';',
          Tab = '\t',
          Space = ''
        ),
        selected = ','
      ),
      h6("Powered by:"),
      tags$img(
        src = 'RStudio-Ball.png',
        height = 50,
        width = 50
      )
    ),
    mainPanel(uiOutput("tb"))
  )
))
