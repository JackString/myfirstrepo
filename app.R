#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("CLICK"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
                   actionButton("click", "Click this button 1000 times for a secret message")
                   ),         
      mainPanel(
                textOutput("num")    
      )
   )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
  clicks <- reactive(input$click)
  output$num <- renderText({
    if(clicks() > 999){
      "Why did you just waste your time clicking a button 1000 times?"
    }})
}

# Run the application 
shinyApp(ui = ui, server = server)

