shinyUI(
  pageWithSidebar(
    headerPanel("Entscheidungsregeln"),
    
    sidebarPanel(
      selectInput("Regel", "Please select",
                  choices = c("Kompensatorisch", "Oder", "Konjunktiv")),

      conditionalPanel(condition = "input.Regel == 'Kompensatorisch'", 
                       textInput("testA", "Please select the miinimal Wert im Test A", 0),
                       textInput("testB", "Please select the miinimal Wert im Test B", 0)),
  
      conditionalPanel(condition ="input.Regel == 'Oder'",
                       textInput("testAo", "Please select the miinimal Wert im Test A", 0),
                       textInput("testBo", "Please select the miinimal Wert im Test B", 0)),
      
      conditionalPanel(condition ="input.Regel == 'Konjunktiv'",
                       textInput("testAk", "Please select the miinimal Wert im Test A", 0),
                       textInput("testBk", "Please select the miinimal Wert im Test B", 0)),
    ),
    
    mainPanel(
      plotOutput("Visualisierung")
    )
    
  )
  
)