library(shiny)
source("addressCheck.R")



shinyServer(
	function( input, output) {
		output$ocity = renderText(input$city)
		output$ostate = renderText( input$state )
		output$opostal = renderText(input$postal)
		output$ointernat = renderText( { addressCheck( input$city, input$state, input$postal ) } )
	}

)
