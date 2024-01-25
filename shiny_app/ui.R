#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define UI for application that draws a histogram
dashboardPage(

    # Application title
    dashboardHeader(title = "CPI by Region"),
    dashboardSidebar(),
    dashboardBody(
      fluidRow(
        box(plotOutput("distPlot", height = 500, width = 500)),
        box(
        title = "Controls",
        sliderInput("years",
                        "Year Range:",
                        min = 1974,
                        max = 2023,
                        value = c(1990,1995)))),
      fluidRow(
        box(plotOutput("income", height = 500, width = 500)),
        box(
          title = "Controls",
          sliderInput("year",
                      "Year Range:",
                      min = 1947,
                      max = 2022,
                      value = c(1980,2000)))),
      
          
        ))
