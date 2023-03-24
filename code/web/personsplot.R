library(plotly)
library(tidyverse)
library(readxl)



data1 <- read_excel("~/fairfax-snap-app/code/web/img/fairfax_SNAP_with_persons_avg.xlsx")
data1 <- data.frame(data1)



# plot for number of persons

plotp1 <- data1 %>%
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


# plot for avg amount by persons receiving SNAP
plotp2 <- data1 %>%
  plot_ly(x = ~Month,
          y = ~Snap_per_person, 
          type = "scatter", mode = "lines",
          name = "Avg SNAP amount received by persons",
          hovertemplate = paste("<b>Month:</b> %{x}<br>",
                                "<b>Average SNAP Amount:</b> %{y:.2f}<br>", "<extra></extra>")) %>%
  layout(
    yaxis = list(
      title = "Snap Amount ",
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
    title = " "
  )

subplot(
  plotp1,plotp2, margin = 0.1) %>%  layout(width = 1000) %>% layout(legend = list(orientation = "h", 
                                                                                  xanchor = "center",
                                                                                  x = 0.5,
                                                                                  y = -0.2) ) 
