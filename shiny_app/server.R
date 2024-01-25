#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define server logic required to draw a histogram
server <- function(input, output, session) {

    output$distPlot <- renderPlot({

      min_year = input$years[1]
      max_year = input$years[2]
      
      cpi_by_region |>
        filter(Period >= min_year, Period <= max_year) |>
        ggplot(aes(x = date, y = CPI, group = Region, color = Region,linetype = Region)) +
        geom_line() +
        scale_color_manual(values = c('Red','Dark Green', 'Purple', 'Black', 'Blue')) +
        scale_linetype_manual(values = c("solid","solid", "solid", "dashed","solid"))
    })
    output$income <- renderPlot({
      min_year = input$year[1]
      max_year = input$year[2]
      
      accurate_income |>
        filter(year >= min_year, year <= max_year) |>
        ggplot(aes(x = year, y= median_income))+
        geom_line()
      
    })
    
    output$adjustableincome <- renderPlot({
      min_year = input$yea[1]
      max_year = input$yea[2]
      
      adjustable_cpi_income <- cpi_income |>
        filter(year >= min_year, year <= max_year)
      
      adjustable_cpi_income <- adjustable_cpi_income |>
        mutate(cum_yearly_change_c = cumsum(yearly_change_c))
      
      adjustable_cpi_income |>
        ggplot(aes(x = year, y = cum_yearly_change_c)) +
        geom_line()
      
    })

}
