shinyServer(
  function(input, output, session){
    library(ggplot2)
    library(gridExtra) 
    

       
    zWerte <- reactive({
      
      distType <- input$Regel
      
      #data
      TestA <- c(-2:2)
      TestB <- c(-2:2)
      date <-as.data.frame(cbind(TestA, TestB))

      
      #Input transformation from C-values to z-values 
      
      werA <- (as.numeric(input$WertA)-5)/2
      werB <- (as.numeric(input$WertB)-5)/2
      
      
      teA <- (as.numeric(input$testA)-5)/2
      teB <- (as.numeric(input$testB)-5)/2
      
      teAo <- (as.numeric(input$testAo)-5)/2
      teBo <- (as.numeric(input$testBo)-5)/2
      
      teAk <- (as.numeric(input$testAk)-5)/2
      teBk <- (as.numeric(input$testBk)-5)/2
      
      #base plot      
      p <- ggplot(date, aes(x = TestA, y = TestB)) +
        scale_y_continuous(breaks=c(-2,-1.5,-1,-0.5,0, 0.5,1,1.5,2)) +
        scale_x_continuous(breaks=c(-2,-1.5,-1,-0.5,0, 0.5,1,1.5,2)) +
        annotate("rect", xmin=c(-2), xmax=c(2),
                 ymin=c(-2) , ymax=c(2), alpha=0.0, fill="blue") +         
      annotate("pointrange", x = as.numeric(werA), y = as.numeric(werB), 
               ymin = 0, ymax = 0,colour = "springgreen4", size = 0.6)

      
      if(distType == "Kompensatorisch"){
        p <- p +
          annotate("segment", x = -2, xend = as.numeric(teA), y = as.numeric(teB), yend = -2, 
                   colour = "coral1", size=2, alpha=0.5) 
        
        
      }
      
      else if(distType == "Oder" ){
        p<- p +
          annotate("rect", xmin=c(-2), xmax= as.numeric(teAo),
                   ymin=c(-2) , ymax=as.numeric(teBo), alpha=0.2, color="cadetblue3", fill="cadetblue3") 
        
        
        
      }
      
      else{
        p<- p +
          annotate("rect", xmin=c(-2), xmax= as.numeric(teAk),
                   ymin=c(-2) , ymax=c(2), alpha=0.2, color="lightsalmon3", fill="lightsalmon3") +
          annotate("rect", xmin=c(-2), xmax= c(2),
                   ymin=c(-2) , ymax= as.numeric(teBk), alpha=0.2, color="lightsalmon3", fill="lightsalmon3")
      }
      
      p  +
        annotate(geom="text", x= 0, y=2, label="Darstellung der z-Werte",
                 color="black", size = 9) 
      
    })
    
    
    #plot C- Werte
    
    cWerte <- reactive({
      
      distType <- input$Regel
    
      
      #data
      Test_A <- c(1:9)
      Test_B <- c(1:9)
      dat <-as.data.frame(cbind(Test_A, Test_B))
      
      #base plot
      p <- ggplot(dat, aes(x = Test_A, y = Test_B)) +
        scale_y_continuous(breaks=c(1,2,3,4,5,6,7,8,9)) +
        scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9)) +
        annotate("rect", xmin=c(1), xmax=c(9),
                 ymin=c(1) , ymax=c(9), alpha=0.0, fill="blue") +
        annotate("pointrange", x = as.numeric(input$WertA), y = as.numeric(input$WertB), ymin = 1, ymax = 1,
                 colour = "springgreen4", size = 0.6)
        
      
      
      
      if(distType == "Kompensatorisch"){
        p <- p +
          annotate("segment", x = 1, xend = as.numeric(input$testA), y = as.numeric(input$testB), yend = 1, 
                   colour = "coral1", size=2, alpha=0.5)   
        
        
      }
      
      else if(distType == "Oder" ){
        p<- p +
          annotate("rect", xmin=c(1), xmax= as.numeric(input$testAo),
                   ymin=c(1) , ymax=as.numeric(input$testBo), alpha=0.2, color="cadetblue3", fill="cadetblue3") 
        
        
        
      }
      
      else{
        
        neuA <- input$testAk +3
        neuB <- input$testBk +3
        p<- p +
          annotate("rect", xmin=c(1), xmax= as.numeric(neuA),
                   ymin=c(1) , ymax=c(9), alpha=0.2, color="lightsalmon3", fill="lightsalmon3") +
          annotate("rect", xmin=c(1), xmax= c(9),
                   ymin=c(1) , ymax= as.numeric(neuB), alpha=0.2, color="lightsalmon3", fill="lightsalmon3")
      }
      
      p  +
        annotate(geom="text", x= 5, y=9, label="Darstellung der C-Werte",
                 color="black", size = 9)
    })
   
   output$Visualisierungbb <- renderPlot({
     ptlist <- list(cWerte(), zWerte())
   
     
     grid.arrange(grobs=ptlist)
   }) 
    
    
     
  }
)
