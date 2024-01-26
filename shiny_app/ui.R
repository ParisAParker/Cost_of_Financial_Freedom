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
    dashboardHeader(),
    dashboardSidebar(
      sidebarMenu(
        id = "pages",
        menuItem("Total CPI", tabName = "totalCPI"),
        menuItem("CPI by Region",tabName = "regionCPI"),
        menuItem("Median Income", tabName = "income"),
        menuItem("Inflation Rate", tabName = "adjustable")
      )
    ),
    dashboardBody(
      tabItems(
        tabItem("totalCPI", fluidRow(box(plotOutput("totalcpi", height = 500, width = 600)),box(title = "Controls", sliderInput("ye","Year Range:",min = 1913,max = 2023,value = c(1950,1975))))),
        tabItem("regionCPI",fluidRow(box(plotOutput("distPlot", height = 500, width = 600)),box(title = "Controls", sliderInput("years","Year Range:",min = 1974,max = 2023,value = c(1990,1995))))),
        tabItem("income",fluidRow(box(plotOutput("income", height = 500, width = 500)),box(title = "Controls", sliderInput("year", "Year Range:", min = 1967, max = 2022, value = c(1980,2000))))),
        tabItem("adjustable",fluidRow(box(plotOutput("adjustableincome", height = 500, width = 600)), box(title = "Controls", sliderInput("yea","Year Range:", min = 1968, max = 2022, value = c(1980, 2000))))
        ))))
