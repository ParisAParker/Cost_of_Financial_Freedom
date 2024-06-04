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
    dashboardHeader(
      title = "Purchasing Power"
    ),
    dashboardSidebar(
      sidebarMenu(
        id = "pages",
        menuItem("Overview", tabName = "overview", icon = icon("tachometer-alt")),
        menuItem("Consumer Price Index", tabName = "totalCPI", icon = icon("money-bill-wave")),
        menuItem("Consumer Price Index by Region",tabName = "regionCPI", icon = icon("map")),
        menuItem("Median Income", tabName = "income", icon = icon("dollar-sign")),
        menuItem("Inflation Rate", tabName = "inflation", icon = icon("chart-line")),
        menuItem("Percent Change in Median Income", tabName = "incomeChange", icon = icon("percent")),
        menuItem("Purchasing Power", tabName = "realincomegrowth", icon = icon("chart-area")),
        menuItem("Key Findings", tabName = "results", icon = icon("check-circle"))
      )
    ),
    dashboardBody(
      tabItems(
        
        # Page tab giving an overview of the dashboard
        tabItem("overview",
                titlePanel("Purchasing Power: Income vs CPI"),
                
                # Content of the overview page
                h3("Project Overview"),
                p("In this dashboard, we will explore the relationship between median household income and the Consumer Price Index (CPI) over time. The goal is to provide insights into how the purchasing power of the households has evolved, especially in the context of rising concerns about affordability for the new generation."),
                h3("Motivation"),
                p("The motivation behind this project stems from widespread discussions about the increasing unaffordability of living costs for the new generation. By analyzing the relationship between income and cost of living, this project aims to shed light on this issue and provide a clearer understanding of economic trends affecting purchasing power."),
                h3("Data Questions"),
                p("1. At what rate has the cost of living increased?"),
                p("2. At what rate has income increased?"),
                p("3. Is the value of our money always decreasing. If so, at what rate?"),
                h3("Data Sources:"),
                p("1. Consumer Price Index (CPI): This data was obtained from the U.S Bureau of Labor Statistics."),
                p("2. Median Household Income: This data was obtained from the U.S Census Bureau."),
                h3("What is the Consumer Price Index"),
                p("The Consumer Price Index (CPI) measures the average change over time in the prices paid by urban consumers for a market basket of consumer goods and services. It is a critical indicator used to assess inflation and the cost of living, reflecting how much prices are rising or falling. This metric is representative for all urban consumers which is about 93% of the U.S. population."),
                h3("How is CPI Calculated?"),
                p("The CPI is calculated by taking price changes for each item in a predetermined basket of goods and averaging them. Prices are collected from thousands of establishments across the country. The goods and services in the CPI basket are divided into several major categories, such as housing, transportation, and food, etc. each weighted by its importance"),
                h3("How to Interpret the CPI Value"),
                p("A CPI value of 100 represents the base year. A CPI value of 150 indicates that prices have increased by 50% since the base year. Conversely, a CPI of 70 would mean that prices have decreased by 30% since the base year. The base year is 1982-1984."),
                h3("What is Median Household Income"),
                p("Median household income is the income level that divides the income distribution into two equal parts, with half of the households being above this income level and half being below this income level. It's considered a better measure of central tendency than mean income because it's less affected by extreme values/outliers, providing a more accurate representation of the typical income level in a population.")
                ),
        
        # Page tab dealing with the standard Consumer Price Index
        tabItem("totalCPI",
                titlePanel("Consumer Price Index Over Time"),
                fluidRow(
                  box(plotOutput("totalcpi", height = 500, width = 600)),
                  box(title = "Controls", sliderInput("ye","Year Range:",min = 1913,max = 2023,value = c(1913,2023))),
                  h3("Description"),
                  p("This line chart shows the Consumer Price Index back to 1913 with an interactive date slider.")
                  )),
        # Page tab dealing with the Consumer Price Index by region
        tabItem("regionCPI",
                titlePanel("Consumer Price Index Over Time (Regional Level)"),
                fluidRow(
                  box(plotOutput("distPlot", height = 500, width = 600)),
                  box(title = "Controls", sliderInput("years","Year Range:",min = 1974,max = 2023,value = c(1974,2023))),
                  h3("Description"),
                  p("This line chart shows the Consumer Price Index broken down by region. The region specific data is not available before 1974. There's an interactive slider to adjust the date.")
                        )
                ),
        # Page tab dealing with median income
        tabItem("income",
                titlePanel("Median Income Over Time"),
                fluidRow(
                  box(plotOutput("income", height = 500, width = 500)),
                  box(title = "Controls", sliderInput("year", "Year Range:", min = 1967, max = 2022, value = c(1967,2022))),
                  h3("Description"),
                  p("This line chart shows how median household income has changed over the years since 1967. There's an interactive slider to adjust the date.")
                        )
                ),
        # Page tab dealing with Inflation Rate
        tabItem("inflation",
                titlePanel("Inflation Rate Over Time"),
                fluidRow(
                  box(plotOutput("inflationrate", height = 500, width = 600)),
                  box(title = "Controls", sliderInput("yea","Year Range:", min = 1968, max = 2022, value = c(1968, 2022))),
                  h3("Description"),
                  p("This line chart shows how the inflation rate has changed since 1968. This chart has an interactive slider that resets the inflation rate to 0 every time a minimum year is picked. For example, if the minimum year selected on the slider is 2000, then 1999 serves as the base year with an inflation rate of 0."),
                  h3("How Was Inflation Rate Calculated?"),
                  p("This was calculated from the Consumer Price Index by taking the percentage change of the CPI. For example, if the CPI of year 2000 is 100 and the CPI of year 2001 is 110, then the inflation rate from 2000 to 2001 would be 10%.")
                        )
                ),
        # Page tab dealing with Percent Change of Median Income 
        tabItem("incomeChange",
              titlePanel("Percent Change in Median Income"),
              fluidRow(
                box(plotOutput("pctincome", height = 500, width = 600)),
                box(title = "Controls", sliderInput("y","Year Range:", min = 1968, max = 2022, value = c(1968, 2022))),
                h3("Description"),
                p("This line chart shows the rate (%) at which median income has grown since 1968. Similar to the inflation rate plot, there is an interactive slider that resets the rate to 0 every time a minimum year is picked.")
            )
    ),
        # Page tab dealing with Purchasing Power
        tabItem("realincomegrowth",
              titlePanel("Purchasing Power Over Time"),
              fluidRow(
                box(plotOutput("realgrowth", height = 500, width = 600)), 
                box(title = "Controls", sliderInput("growth","Year Range:", min = 1968, max = 2022, value = c(1968, 2022))),
                h3("Description"),
                p("This line chart shows how purchasing power has changed since 1968. For this purpose, purchasing power increases when the percentage at which median income increased outperformed the inflation rate."),
                h3("How Was Purchasing Power Calculated?"),
                p("Purchasing power was calculated by subtracting the inflation rate from the percent increase in median income. For example, if the inflation rate from 2000 to 2001 was 10% and the % increase in median income for those years was 6 %, then purchasing power for that timeframe would be -4%.")
            )
    ),
        # Page tab dealing with the Results/Findings
        tabItem("results",
                titlePanel("Key Findings"),
                p("After analyzing the data on changes in the cost of living and income, several important insights have emerged:"),
                p("1. Cost of Living Increase Rate: The analysis revealed a consistent upward trend in the cost of living over the years. There were certain time periods that had a steeper annual increase in cost of living than other."),
                p("2. Income Growth Rate: Income has also been growing a steady pace keeping up with inflation rates and even outperforming in some time periods."),
                p("3. Purchasing Power: The analysis did not confirm that the value of our money is always decreasing. Instead, the data showed there are times when purchasing power increases, times when it's steady, and times when it's decreasing."),
                h3("Conclusion"),
                p("So is living becoming unaffordable? Well, that would depend on when we're asking this question. If you asked this question in 2019, the answer would be no because purchasing power was on the peak of the uptrend. However, after 2019, there has been a clear decrease in the average American's purchasing power and there has not been a switch in trend. It's important to note that the data used to calculate purchasing power does not include the most recent years 2023 or 2024. Additionally, when drawing conclusions from this project, we should consider the limitations. The CPI's composition of goods and services may not accurately represent the spending habits of all individuals and median income is a great middle point but does not capture income distributions. These limitations among others must be taken into account when drawing conclusions from this project.")
                
                )
)
)
)