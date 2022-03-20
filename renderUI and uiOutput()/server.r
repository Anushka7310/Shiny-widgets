library(shiny)
library(ggplot2)

shinyServer(function(output, input)({

  var <- reactive({
    switch(input$data1,
           "iris" = names(iris),
           "mtcars" = names(mtcars),
           "trees" = names(trees)
    )
  })
  output$vx <- renderUI({
    selectInput("variablex", "Select the First (X) variable", choices = var())
  })

  output$vy <- renderUI({
    selectInput("variabley", "Select the Second (Y) variable", choices = var())
  })

  output$p <- renderPlot({

    attach(get(input$data1))
    plot(x= get(input$variablex), y= get(input$variabley), xlab=input$variablex, ylab=input$variabley)

  })

}))

