##Codes for various plots which explains the evolution of snap amount 
## and number households in FAIRFAX county over time (2005 - 2023)



###Average Snap amount in fairfax county
library(plotly)
library(readxl)

 
 # Load data from Excel file
 data <- read_excel('~/Desktop/Fairfax_SNAP_2005_2023_dataset.xlsx')
 data <- data.frame(data)
 # Convert month column to date format
 data$Month <- as.Date(data$Month, format='%m/%d/%Y')
 

 plot1 <- plot_ly(data, x = ~Month, y = ~All.SNAP.Avg.Per.Household, type = "scatter", mode = "lines",
                 line = list(color = "#1F77B4", width = 3),
                 hovertemplate = "<b>Month:</b> %{x|%Y-%m}<br><b>Snap Amount:</b> %{y:$,.2f}<extra></extra>") %>%
   layout(title = "<b>SNAP Amount in Fairfax County Over Time</b>",
          xaxis = list(title = "<b>Month</b>", tickformat = "%b %Y", showspikes = TRUE, spikemode = "across", spikethickness = 1),
          yaxis = list(title = "<b>Snap Amount</b>", tickprefix = "$", showspikes = TRUE, spikemode = "across", spikethickness = 1),
          hovermode = "x unified",
          hoverlabel = list(bgcolor = "#F7F7F7", font = list(size = 14)),
          showlegend = FALSE) %>%
   
   add_trace(name = "", x = c(data$Month[1], data$Month[1]), y = c(0, data$All.SNAP.Avg.Per.Household[1]),
             type = "scatter", mode = "lines", line = list(color = "black", dash = "dash"),
             hoverinfo = "skip") %>%
   add_trace(name = "", x = c(data$Month[1], data$Month[1]), y = c(data$All.SNAP.Avg.Per.Household[1], data$All.SNAP.Avg.Per.Household[1]),
             type = "scatter", mode = "lines", line = list(color = "black", dash = "dash"),
             hoverinfo = "skip")
 
 # Display the plot
 plot1

#######Households number
 library(plotly)
 library(readxl)
 
 # Load the dataset
 data <- read_excel('~/Desktop/Fairfax_SNAP_2005_2023_dataset.xlsx')
 data <- data.frame(data)
 # Aggregate the data by month/year and calculate the average households receiving snap
 data$Month <- as.Date(data$Month, format = "%Y-%m-%d")
 data <- aggregate(HOUSEHOLDS.TOTAL ~ format(Month, "%Y-%m"), data, mean)
 names(data) <- c("Month", "Avg.Households.Receiving.Snap")
 
 # Convert the Month column to a factor with the levels ordered by date
 data$Month <- factor(data$Month, levels = unique(sort(data$Month)))
 
 # Create an interactive Plotly plot
 plot2 <- plot_ly(data, x = ~Month, y = ~Avg.Households.Receiving.Snap, type = "scatter", mode = "lines",
                 line = list(color = "#1F77B4", width = 3),
                 hovertemplate = "<b>Month:</b> %{x|%Y-%m}<br><b>Avg. Households Receiving Snap:</b> %{y}<extra></extra>") %>%
   layout(title = "<b>Average Households Receiving SNAP in Fairfax County Over Time</b>",
          xaxis = list(title = "<b>Month</b>", tickformat = "%b %Y", showspikes = TRUE, spikemode = "across", spikethickness = 1),
          yaxis = list(title = "<b>Avg number of Households Receiving Snap</b>", showspikes = TRUE, spikemode = "across", spikethickness = 1),
          hovermode = "x unified",
          hoverlabel = list(bgcolor = "#F7F7F7", font = list(size = 14)),
          showlegend = FALSE)
 
 # Display the plot
 plot2
 
 
 subplot(plot1, plot2, nrows = 1)
 
 ###Combined plot of both snap amount and number of households
 
 
 library(plotly)
 library(tidyverse)
 
 data <- read_excel('~/Desktop/Fairfax_SNAP_2005_2023_dataset.xlsx')
 data <- data.frame(data)
 
 plot <- data %>%
   plot_ly(x = ~Month) %>%
   add_lines(y = ~HOUSEHOLDS.TOTAL, name = "Total Households") %>%
   add_lines(y = ~All.SNAP.Avg.Per.Household, name = "Avg. Households Receiving SNAP") %>%
   layout(title = "Number of Households and Dollar Amount Over Time",
          xaxis = list(title = "Month"),
          yaxis = list(title = "Number of Households / Dollar Amount",
                       range = c(0, 30000)))

plot



###subplot explaining the evolution 



library(plotly)
library(tidyverse)

data <- read_excel('~/Desktop/Fairfax_SNAP_2005_2023_dataset.xlsx')
data <- data.frame(data)


# plot for total households
plot1 <- data %>%
  plot_ly(x = ~Month, y = ~HOUSEHOLDS.TOTAL, type = "scatter", mode = "lines", name = "Total Households") %>%
  layout(yaxis = list(title = "Total Households"))

# plot for avg households receiving SNAP
plot2 <- data %>%
  plot_ly(x = ~Month, y = ~All.SNAP.Avg.Per.Household, type = "scatter", mode = "lines", name = "Avg SNAP amount received by Households") %>%
  layout(yaxis = list(title = "Avg. Households Receiving SNAP"))

# combine the plots into a single subplot
subplot(plot1, plot2, nrows = 1)



 
