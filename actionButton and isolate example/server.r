library(shiny)
library(datasets)
shinyServer(function(input, output) {
  output$dataname <- renderText({
    paste("Structure of the dataset", input$dataset)
  })

  output$structure <- renderPrint({
    str(get(input$dataset))
  })
  output$observation <- renderText({
    input$act
    isolate(paste(
      "First",
      input$obs,
      "observation of the dataset",
      input$dataset
    ))
  })

  output$view <- renderTable({
    input$act

    isolate(head(get(input$dataset), n = input$obs))
  })
})
