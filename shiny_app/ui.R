#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define User Interface for the App
dashboardPage(

    # Application title
    dashboardHeader(),
    dashboardSidebar(
      sidebarMenu(
        id = "pages",
        menuItem("Consumer Price Index", tabName = "totalCPI"),
        menuItem("Consumer Price Index by Region",tabName = "regionCPI"),
        menuItem("Median Income", tabName = "income"),
        menuItem("Inflation Rate", tabName = "inflation")
      )
    ),
    dashboardBody(
      tabItems(
        # Page tab dealing with the standard Consumer Price Index
        tabItem("totalCPI",
                titlePanel("Consumer Price Index Over Time"),
                fluidRow(
                  box(plotOutput("totalcpi", height = 500, width = 600)),
                  box(title = "Controls", sliderInput("ye","Year Range:",min = 1913,max = 2023,value = c(1913,2022)))
                  )),
        # Page tab dealing with the Consumer Price Index by region
        tabItem("regionCPI",
                titlePanel("Consumer Price Index Over Time (Regional Level)"),
                fluidRow(
                  box(plotOutput("distPlot", height = 500, width = 600)),
                  box(title = "Controls", sliderInput("years","Year Range:",min = 1974,max = 2023,value = c(1974,2022)))
                        )
                ),
        # Page tab dealing with median income
        tabItem("income",
                titlePanel("Median Income Over Time"),
                fluidRow(
                  box(plotOutput("income", height = 500, width = 500)),
                  box(title = "Controls", sliderInput("year", "Year Range:", min = 1967, max = 2022, value = c(1967,2022)))
                        )
                ),
        # Page tab dealing with Inflation Rate
        tabItem("inflation",
                titlePanel("Inflation Rate Over Time"),
                fluidRow(
                  box(plotOutput("inflationrate", height = 500, width = 600)),
                  box(title = "Controls", sliderInput("yea","Year Range:", min = 1968, max = 2022, value = c(1968, 2022)))
                        )
                )
              )
                )
)
