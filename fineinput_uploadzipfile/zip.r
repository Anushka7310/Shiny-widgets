

library(shiny)

ui <- fluidPage(
  fileInput("file", "Upload Zip file", accept = ".zip"),
  actionButton("unzip", "Unzip Files"),

  tableOutput("filedf"),

  tableOutput("unzipped")

)


server <- function(input, output, session) {
  output$filedf <- renderTable({
    if (is.null(input$file)) {
      return ()
    }
    input$file
  })



  observeEvent(input$unzip,
               output$unzipped <- renderTable({
                 unzip(input$file$datapath)
               }))


}

shinyApp(ui, server)
