


library(shiny)
library(markdown)


# Controller Function
shinyServer(
   function(input, output){
   
    originalData <- read.csv("Plants.csv", header=T, sep=",")

	output$helpline1 = renderText("Plant A: 12 hours light")
	output$helpline2 = renderText("Plant B:  8 hours light")
	output$helpline3 = renderText("Plant C:  4 hours light")
	
    output$welcome <- renderText("Hi, Welcome to my Shiny Application. This Application is created as part of Coursera Project. \n Goto the Tab \"Documentation\" to get Help about using this Application.")
   
	output$plantType <- reactive({
	                        v = c("All Plants", "Plants A and B", "Plants B and C", "Plants A and C")
							v[input$combo+1]	    
						})
						
    output$plantData <- renderTable(originalData)						
			
	output$plot1 <- renderPlot({
						
						plantA=originalData[which(originalData$Plant=="A"),]
						plantB=originalData[which(originalData$Plant=="B"),]
						plantC=originalData[which(originalData$Plant=="C"),]
						if(input$combo==1)originalData = rbind(plantA,plantB)
						if(input$combo==2)originalData = rbind(plantB,plantC)
						if(input$combo==3)originalData = rbind(plantA,plantC)

						par(mfcol=c(2,2),pch=1)
						if(input$combo==0){
							plot(plantA$Days,plantA$Height,col=3,main=paste("Tomato Plant Height"), xlab="no. of Days after Sprouting", ylab="Height (cm)", ylim=c(0,25))
							lines(plantA$Days,plantA$Height)

							points(plantB$Days,plantB$Height,col=2)
							lines(plantB$Days,plantB$Height)
							
							points(plantC$Days,plantC$Height,col=1)
							lines(plantC$Days,plantC$Height)
							
							legend("topleft",c("A","B", "C"),col=c(3,2,1), pch=1)
							
							plot(plantA$Days,plantA$Leaves,col=3,main=paste("Tomato Plant Leaves"), xlab="no. of Days after Sprouting", ylab="Leaves", ylim=c(0,30))
							lines(plantA$Days,plantA$Leaves)

							points(plantB$Days,plantB$Leaves,col=2)
							lines(plantB$Days,plantB$Leaves)
							
							points(plantC$Days,plantC$Leaves,col=1)
							lines(plantC$Days,plantC$Leaves)
							
							legend("topleft",c("A","B", "C"),col=c(3,2, 1), pch=1)							
						}						
						if(input$combo==1){
							plot(plantA$Days,plantA$Height,col=3,main=paste("Tomato Plant Height"), xlab="no. of Days after Sprouting", ylab="Height (cm)", ylim=c(0,25))
							lines(plantA$Days,plantA$Height)

							points(plantB$Days,plantB$Height,col=2)
							lines(plantB$Days,plantB$Height)
							
							legend("topleft",c("A","B"),col=c(3,2), pch=1)
							
							plot(plantA$Days,plantA$Leaves,col=3,main=paste("Tomato Plant Leaves"), xlab="no. of Days after Sprouting", ylab="Leaves", ylim=c(0,30))
							lines(plantA$Days,plantA$Leaves)

							points(plantB$Days,plantB$Leaves,col=2)
							lines(plantB$Days,plantB$Leaves)
							
							legend("topleft",c("A","B"),col=c(3,2), pch=1)							
						}
						
						if(input$combo==2){
							plot(plantB$Days,plantB$Height,col=2,main=paste("Tomato Plant Height"), xlab="no. of Days after Sprouting", ylab="Height (cm)", ylim=c(0,25))
							lines(plantB$Days,plantB$Height)

							points(plantC$Days,plantC$Height,col=1)
							lines(plantC$Days,plantC$Height)
							
							legend("topleft",c("B","C"),col=c(2,1), pch=1)
							
							plot(plantB$Days,plantB$Leaves,col=2,main=paste("Tomato Plant Leaves"), xlab="no. of Days after Sprouting", ylab="Leaves", ylim=c(0,30))
							lines(plantB$Days,plantB$Leaves)

							points(plantC$Days,plantC$Leaves,col=1)
							lines(plantC$Days,plantC$Leaves)
							
							legend("topleft",c("B","C"),col=c(2,1), pch=1)							
						}
						if(input$combo==3){
							plot(plantA$Days,plantA$Height,col=3,main=paste("Tomato Plant Height"), xlab="no. of Days after Sprouting", ylab="Height (cm)", ylim=c(0,25))
							lines(plantA$Days,plantA$Height)

							points(plantC$Days,plantC$Height,col=1)
							lines(plantC$Days,plantC$Height)
							
							legend("topleft",c("A","C"),col=c(3,1), pch=1)
							
							plot(plantA$Days,plantA$Leaves,col=3,main=paste("Tomato Plant Leaves"), xlab="no. of Days after Sprouting", ylab="Leaves", ylim=c(0,30))
							lines(plantA$Days,plantA$Leaves)

							points(plantC$Days,plantC$Leaves,col=1)
							lines(plantC$Days,plantC$Leaves)
							
							legend("topleft",c("A","C"),col=c(3,1), pch=1)							
						}
						plot(originalData$Height,originalData$Leaves,col=1,main=paste("Height vs Leaves"), xlab="Height (cm)", ylab="Leaves", xlim=c(0,25), ylim=c(0,30))

						plot(Height~Plant, data=originalData,ylim=c(0,25))	
					})
   }
)