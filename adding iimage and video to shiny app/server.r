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
      stringsAsFactors = input$stringAsFactors
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
      return ()
    }
    data()
  })


  output$tb <- renderUI({
    if (is.null(data()))
      h6(
        "intro video",
        br(),
        tags$video(
          src = 'reactive.mp4',
          type = "video/mp4",
          width = "350px",
          height = "350px",
          controls = "controls"
        )
      )
    else
      tabsetPanel(
        tabPanel("About file", tableOutput("filedf")),
        tabPanel("Data", tableOutput("table")),
        tabPanel("Summary", tableOutput("sum"))
      )
  })
})
