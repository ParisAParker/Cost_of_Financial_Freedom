# Import necessary libraries for app
library(tidyverse)
library(shiny)
library(shinydashboard)
library(dplyr)

# Read necessary csvs for app
cpi_by_region <- read_csv("data/cpi_by_region.csv")
family_income <- read_csv("data/income_updated.csv")
accurate_income <- read_csv("data/accurate_income.csv")
cpi_total <- read_csv("data/all_cpi_updated.csv")
cpi_income <- read_csv("data/cpi_income.csv")

# Format date for cpi by region data
cpi_by_region <- cpi_by_region |>
  mutate(date = mdy(paste(Month, "01", Period)))