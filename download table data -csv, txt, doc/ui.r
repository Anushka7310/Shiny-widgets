library(shiny)
shinyUI(fluidPage(titlePanel(
  h4(
    'Demonstration of file download using downloadHandler() and  downloadbutton()',
    align = "center"
  )
),
sidebarLayout(
  sidebarPanel(
    selectInput(
      "dataset",
      "Select the dataset",
      choices = c("iris", "mtcars", "trees")
    ),
    br(),
    helpText("Select the download format"),
    radioButtons(
      "type",
      "Format type:",
      choices = c("Excel (CSV)", "Text(TSV)", "Text (Space Separated)", "Doc")
    ),
    br(),
    helpText(
      "Click on the download buttom to download thge dataset observations"
    ),
    downloadButton('downloadData', 'Download')
  ),
  mainPanel(tableOutput('table'))
)))
