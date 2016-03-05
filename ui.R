#My test ui.R

library(shiny)
shinyUI(
	pageWithSidebar(
		headerPanel('International Address Check'),
		sidebarPanel(
							h3('Please enter City, State, and Postal code of address'),
		 					textOutput('ointernat')
							),
		mainPanel( h1('Enter City, State, Postal'),
							textInput( 'city', 'City'),
							textOutput('ocity'),
							textInput( 'state', 'State'),
							textOutput('ostate'),
							textInput( 'postal', 'Postal'),
							textOutput('opostal'),
							submitButton( 'Go!')
							)
	)
)
