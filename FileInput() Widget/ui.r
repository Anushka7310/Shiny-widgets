library(shiny)
shinyUI(fluidPage(
  titlePanel("File Input"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload the file"),
      helpText("Default max, file size is 9MB"),
      tags$hr(),
      h5(helpText("Select the read,table parameters below")),
      checkboxInput(
        inputId = 'header',
        label = 'Header',
        value = FALSE
      ),
      checkboxInput(inputId = "stringFactors", label = "stringFactors", FALSE),
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
      )
    ),
    mainPanel(uiOutput("tb"))
  )
))
