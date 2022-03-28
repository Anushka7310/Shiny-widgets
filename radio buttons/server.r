library(shiny)

shinyServer(function(input, output) {
  output$out <- renderText(paste("You selected the value: ", input$slide))
  output$state <- renderText(input$statenames)
})
