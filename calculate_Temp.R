# This is a winning code for Homework 3 Problem 2
# Bit Battle Winner: Squad TBD
# Copyright (c) 2025 by David Vanderwall, Tavleen Bhatia, Sharon Caslin
# All rights reserved.

# Load required libraries. Make sure these are added to your renv.lock.
library(arrow)
library(dplyr)
library(data.table)
library(pryr)

# renv::restore()

# Record the start time
start_time <- Sys.time()

# Create read options that explicitly set the column names.
read_opts <- CsvReadOptions$create(
  column_names = c("station", "temperature"),
  autogenerate_column_names = FALSE  # This ensures the provided names are used.
)

# Create parse and convert options as needed.
parse_opts <- CsvParseOptions$create(delimiter = ";")
convert_opts <- CsvConvertOptions$create()

# Process the data directly using Arrow's streaming capabilities
# Create a dataset directly from the CSV file
ds <- open_dataset("measurements.txt", 
                  format = "csv", 
                  delimiter = ";",
                  col_names = c("station", "temperature"),
                  skip = 0)

# Use the dataset to compute aggregates using Arrow's lazy evaluation
result <- ds %>%
  group_by(station) %>%
  summarise(
    min_temp  = min(temperature),
    mean_temp = mean(temperature),
    max_temp  = max(temperature)
  ) %>%
  arrange(station) %>%
  collect()  # collect() loads only the final aggregated result into memory

# Format the output string as:
# {Abha=5.0/18.0/27.4, Abidjan=15.7/26.0/34.1, ..., İzmir=-33.5/17.9/69.1}
formatted_rows <- sprintf("%s=%.1f/%.1f/%.1f",
                          result$station,
                          result$min_temp,
                          result$mean_temp,
                          result$max_temp)
formatted_output <- paste0("{", paste(formatted_rows, collapse = ", "), "}")

# Write the formatted string to result_R.txt - ensuring it's on a single line
# Use writeLines instead of write to avoid automatic line wrapping
con <- file("result_R.txt", "w")
writeLines(formatted_output, con, sep = "")
close(con)

# Record end time and calculate runtime
end_time <- Sys.time()
runtime <- end_time - start_time
mem_used <- pryr::mem_used()
print(runtime)
print(mem_used)