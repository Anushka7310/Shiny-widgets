library(shiny)

shinyServer(function(input, output) {
  output$filedf <- renderTable({
    if (is.null(input$file)) {
      return ()
    }
    input$file
  })


  output$filedf2 <- renderTable({
    if (is.null(input$file)) {
      return ()
    }
    input$file$datapath
  })


  output$fileob <- renderPrint({
    if (is.null(input$file)) {
      return ()
    }
    str(input$file)
  })


  output$selectfile <- renderUI({
    if (is.null(input$file)) {
      return()
    }
    list(
      hr(),
      helpText(
        "Select the files for which you need to see data and summary stats"
      ),
      selectInput("Select", "Select", choices = input$file$name)
    )

  })


  output$summ <- renderPrint({
    if (is.null(input$file)) {
      return()
    }
    summary(
      read.table(
        file = input$file$datapath[input$file$name == input$Select],
        sep = input$sep,
        header = input$header,
        stringsAsFactors = input$stringAsFactors
      )
    )
  })


  output$table <- renderTable({
    if (is.null(input$file)) {
      return()
    }
    read.table(
      file = input$file$datapath[input$file$name == input$Select],
      sep = input$sep,
      header = input$header,
      stringsAsFactors = input$stringAsFactors
    )

  })


  output$tb <- renderUI({
    if (is.null(input$file)) {
      return()
    }
    else
      tabsetPanel(
        tabPanel(
          "Input File Object DF ",
          tableOutput("filedf"),
          tableOutput("filedf2")
        ),
        tabPanel(
          "Input File Object Structure",
          verbatimTextOutput("fileob")
        ),
        tabPanel("Dataset", tableOutput("table")),
        tabPanel("Summary Stats", verbatimTextOutput("summ"))
      )
  })
})
