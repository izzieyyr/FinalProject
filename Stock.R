#Need
#spnames= list of all S&P 500 company names
#sptickers=list of all S&P 500 company ticker

require(shiny)

spnames=c("a","b","c")
sptickers=c("A","B","C")

shinyApp(
  # Shiny UI
  ui = fluidPage(
    # Create title panel
    sidebarLayout(
      sidebarPanel (
        # allow users to choose from the list of S&P companies and tickers
        selectInput("company1name","Choose a Company",spnames),
        selectInput("company1ticker","Choose a ticker",sptickers),
        
        # allow users to input start and end date 
        textInput("start", "start date mm/dd/yyyy"),
        textInput("end", "end date mm/dd/yyyy"),
        
        # allow users to choose to compare with index
        selectInput("baseline","Compare with",c("S&P500","other S&P companies")),
        
        conditionalPanel("input.baseline=='other other S&P companies",
                         selectInput("company2name","Choose a Company",spnames),
                         selectInput("company2ticker","Choose a ticker",sptickers))
        ),
        # allow display of plot in mainPanel
     
      mainPanel(plotOutput("temp") )
    )),

  
  ## Shiny Server
  server = function(input, output,session) {
    
    output$temp <- renderPlot({
      y=1:10
      x=1:10
      plot(y=y,x=x)
      
    })
    
    })
