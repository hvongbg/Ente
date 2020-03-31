shinyServer(
  function(input, output, session){
    
    output$Visualisierung <- renderPlot({
      
      distType <- input$Regel
  
      library(ggplot2)
      
      #data
      Test_A <- c(0:9)
      Test_B <- c(0:9)
      dat <-as.data.frame(cbind(Test_A, Test_B))
      
      p <- ggplot(dat, aes(x = Test_A, y = Test_B)) +
      scale_y_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9)) +
        scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9)) +
      annotate("rect", xmin=c(0), xmax=c(9),
               ymin=c(0) , ymax=c(9), alpha=0.0, fill="blue") 
      
      
      
      if(distType == "Kompensatorisch"){
        p <- p +
          annotate("segment", x = 0, xend = as.numeric(input$testA), y = as.numeric(input$testB), yend = 0, 
                   colour = "black", size=2, alpha=0.5) 

        
      }
      
      else if(distType == "Oder" ){
        p<- p +
          annotate("rect", xmin=c(0), xmax= as.numeric(input$testAo),
                   ymin=c(0) , ymax=as.numeric(input$testBo), alpha=0.2, color="blue", fill="blue") 
        
        
        
      }
      
      else{
        p<- p +
          annotate("rect", xmin=c(0), xmax= as.numeric(input$testAk),
                   ymin=c(0) , ymax=c(9), alpha=0.2, color="lightsalmon3", fill="lightsalmon3") +
          annotate("rect", xmin=c(0), xmax= c(9),
                   ymin=c(0) , ymax= as.numeric(input$testBk), alpha=0.2, color="lightsalmon3", fill="lightsalmon3")
      }

      p
    })
    
  }
)