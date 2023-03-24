library(plotly)
library(tidyverse)
library(readxl)


data <- read_excel("~/fairfax-snap-app/code/web/img/Fairfax_SNAP_2005_2023_dataset.xlsx")
data <- data.frame(data)


# plot for number of persons

plot1 <- data %>%
  plot_ly(
    x = ~Month,
    y = ~PERSONS.TOTAL,
    type = "scatter",
    mode = "lines",
    name = "Number of Persons",
    hovertemplate = paste(
      "<b>Month:</b> %{x}<br>",
      "<b>Number of Persons:</b> %{y:.f}<br>"
    )
  ) %>%
  layout(
    yaxis = list(
      title = "Number of Persons ",
      tickformat = ".0f"
    ),
    xaxis = list(
      rangeslider = list(
        autorange = TRUE,
        range = c(as.Date("2005-01-01"), as.Date("2023-12-01")),
        thickness = 0.1,
        bgcolor = "#F5F6F9"
      )
    ),
    title = "Number of Persons receiving SNAP"
  )


plot1