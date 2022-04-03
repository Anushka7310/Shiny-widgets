library(shiny)
shinyServer(function(input, output) {
  data <- reactive({
    file1 <- input$file
    if (is.null(file1)) {
      return()
    }
    read.table(
      file = file1$datapath,
      sep = input$sep,
      header = input$header,
      stringsAsFactors = input$stringFactors
    )
  })

  output$filedf <- renderTable({
    if (is.null(data())) {
      return()
    }
    input$file
  })

  output$sum <- renderTable({
    if (is.null(data())) {
      return()
    }
    summary(data())
  })

  output$table <- renderTable({
    if (is.null(data())) {
      return()
    }
    data()
  })

  output$tb <- renderUI({
    if (is.null(data()))
      h5("Powered by",
         tags$img(
           src = 'RStudio-Ball.png',
           height = 200,
           width = 200
         ))
    else
      tabsetPanel(
        tabPanel("About File", tableOutput("fildedf")),
        tabPanel("data", tableOuput("table")),
        tabPanel("Summary", tableOutput("sum"))
      )
  })
})
