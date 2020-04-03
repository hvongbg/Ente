shinyUI(
  fluidPage(
    titlePanel(h2("Entscheidungsregeln")),
    
    sidebarLayout(position = "left",
                  sidebarPanel(
                    selectInput("Regel", h3("Dargestellte Entscheidungsregel:"),
                                choices = c("Kompensatorisch", "Oder", "Konjunktiv")),
      br(),
      h6("Machen Sie alle  Angaben in C-Werten"),
      br(),
      
                    conditionalPanel(condition = "input.Regel == 'Kompensatorisch'", 
                                     textInput("testA", "Minimaler C-Wert Test A:", 1),
                                     textInput("testB", "Minimaler C-Wert Test B:", 1)),
                    
                    conditionalPanel(condition ="input.Regel == 'Oder'",
                                     textInput("testAo", "Minimaler C-Wert Test A:", 1),
                                     textInput("testBo", "Minimaler C-Wert Test B:", 1)),
                    
                    conditionalPanel(condition ="input.Regel == 'Konjunktiv'",
                                     textInput("testAk", "Minimaler C-Wert Test A:", 1),
                                     textInput("testBk", "Minimaler C-Wert Test B:", 1)),
      br(),
   
                    
                    br(),
                    h3("Erzielte Werte von Gertrude"),
                    textInput("WertA", "C-Wert von Gertrude in Test A:", 4),
                    textInput("WertB", "C-Wert von Gertrude in Test B:", 3),
                  ),
                  
                  mainPanel("Grafiken",
                            column(6,plotOutput(outputId="Visualisierungbb", width="600px",height="700px"))
     
                  ))
          )
    
)
  







