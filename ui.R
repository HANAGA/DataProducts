

library(shiny)
library(markdown)


shinyUI( pageWithSidebar(

     headerPanel("Coursera:shiny Project"),

     sidebarPanel(
	    h3("Tomato Plant Response to Light"),
		#selectInput("plant","Select Plant",c("A", "B", "C")),
	 	helpText(textOutput("helpline1")),		
		helpText(textOutput("helpline2")),
		helpText(textOutput("helpline3")),
		br(),
		#sliderInput("days","Number of Days after Sprouting", min=11, max=40, value=20),
		#sliderInput("leaves","Leaves", min=1, max=50, value=c(1,5)),
		sliderInput("combo","Select Plant combinations",min=0, max=3, value=0),
		helpText(textOutput("plantType"))
		

     ),

     mainPanel(
       tabsetPanel(type="tabs",
           tabPanel("Welcome",includeMarkdown("welcome.md")),
           tabPanel("Documentation",includeMarkdown("documentation.md")),
           tabPanel("Data",tableOutput("plantData")),
           tabPanel("Charts",plotOutput("plot1")),
		   tabPanel("Conclusions",includeMarkdown("conclusions.md"))
       )
    )
))
