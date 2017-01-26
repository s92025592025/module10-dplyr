# Exercise 5: DPLYR Grouped Operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(nycflights13)
library(dplyr)

# What was the average department delay in each month?
# Save this as a data frame `dep.delay.by.month`
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.by.month <- flights %>%
					 	group_by(month) %>%
					 	summarize(avg = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
filter(dep.delay.by.month, avg == max(avg)) %>% select(month)

# If your above data frame contains the columns "month", and "delay", you can create
# a scatterplot by passing that data frame to the 'plot()' function
plot(dep.delay.by.month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.by.dest <- flights %>%
						group_by(dest) %>%
						summarize(avg = mean(arr_delay, na.rm = TRUE))

filter(dep.delay.by.dest, avg == max(avg)) %>% select(dest)

# You can look up these airports in the `airports` data frame!


### Bonus ###
# Which city was flown to with the highest average speed?