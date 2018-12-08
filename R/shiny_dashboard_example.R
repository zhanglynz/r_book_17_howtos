library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "The title"),
  dashboardSidebar(sidebarMenu(id = "tabs",
                   menuItem("tab 1", tabName = "tab_1", icon = icon("dashboard")),
                   menuItem("tab 2", tabName = "tab_2", icon = icon("dashboard"))
                   )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "tab_1",
              fluidRow(
                column(width = 4, selectInput("tab1_ID1", label = "Step 1: make a choice",
                                              choices = c("Choice 1", "Choice 2"),
                                              selected = "Choice 1", multiple = FALSE)),
                column(width = 8, sliderInput("tab1_ID2", label = "Step 2: choose a value",
                                              min = 0, max = 1, value = 0.5))
              ),
              fluidRow(width =12, plotOutput("plot1"))
              ),
      tabItem(tabName = "tab_2",
              fluidRow(width =12, plotOutput("plot2"))
              )
    )
  )
)

server <- function(input, output)
{data_4_tab1 <- reactive({
  if(input$tab1_ID1 == "Choice 1") the_data <- data.frame(x = rnorm(30, mean = input$tab1_ID2),
                                                          y = rnorm(30, mean = input$tab1_ID2))
  if(input$tab1_ID1 == "Choice 2") the_data <- data.frame(x = rexp(30, rate = input$tab1_ID2),
                                                          y = rexp(30, rate = input$tab1_ID2))
  return(the_data)
})

output$plot1 <- renderPlot(plot(data_4_tab1()$x, data_4_tab1()$y, xlab = "x", ylab = "y"))

data_4tab2 <- reactive(return(rnorm(300)))

output$plot2 <- renderPlot(hist(data_4tab2(), xlab = "x", main = ""))
  
}

shinyApp(ui = ui, server = server)