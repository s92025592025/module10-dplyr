# Exercise 4: DPLYR and flights data

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(nycflights13)
library(dplyr)


# The data.frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# use `??flights` to search for documentation on the data set (for what cols are)
print(paste("col: ", ncol(flights), ", row:", nrow(flights)))
print(paste('colnames:', paste(colnames(flights), collapse = ", ")))

# Use `dplyr` to give the data frame a new column that is the amount of time gained in the air
flights <- mutate(flights, time.gain = dep_delay + arr_delay)

# Use `dplyr` to sort your data.frame descending by the column you just created.
# Remember to save this as a variable (or in the same one!)
flights <- arrange(flights, time.gain)

# For practice, repeat the last 2 steps in a single statement using the pipe operator


# Make a histogram of the amount of gain using the `hist()` function
hist(flights$time.gain)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
summarise(flights , avg = mean(time.gain, na.rm = TRUE))

# Create a data.frame of flights headed to seatac ('SEA'), only including the
# origin, destination, and the "gain" column you just created
to.seatac <- flights %>%
			 filter(dest == 'SEA') %>%
			 select(origin, dest, time.gain)
to.seatac

# On average, did flights to seatac gain or loose time?
summarise(to.seatac, avg = mean(time.gain, na.rm = TRUE))

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement!
# (and don't show any other data)