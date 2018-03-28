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
   titlePanel("What's the square root?"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(tags$h3("SIDEBAR"),
                    numericInput("numbers", "Select a number:",
                          value=0,min=0,max=10,step=0.5),
                    checkboxGroupInput("checks","Select an item:",
                          c("item 1"="item 1","item 2"="item 2","item 3"="item 3")),
                    dateInput("dates", "Select a date:"),
                   ,
                   actionButton("click", "Click this button 1000 times for a secret message")
                   ),         
      mainPanel(tags$h2("MAIN"),
                tags$p("your number is:"),
                textOutput("number"),
                tags$p("your item is:"),
                textOutput("check"),
                tags$p("your date is:"),
                textOutput("date")
                

                
      )
   )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
  output$number <- renderPrint(
    input$numbers
  )
  output$check <- renderPrint(
    input$checks
  )
  output$date <- renderPrint(
    input$dates
  )
  clicks <- reactive(input$click)
  output$num <- renderText({
    if(clicks() > 999){
      "Why did you just waste your time clicking a button 1000 times?"
    }})
}

# Run the application 
shinyApp(ui = ui, server = server)

