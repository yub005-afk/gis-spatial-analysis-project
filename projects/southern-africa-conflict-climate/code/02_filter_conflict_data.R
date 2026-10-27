# GIS Assignment 2: Filter conflict events for the study area.
# Run from the RStudio project root so that relative paths resolve correctly.

# Load the required packages without installing or updating anything.
library(readr)
library(dplyr)

# Read only the five columns needed for this analysis; keep raw data unchanged.
conflict_data <- read_csv(
  "data/raw/GEDEvent_v26_1.csv",
  col_types = cols_only(
    country = col_character(),
    year = col_integer(),
    latitude = col_double(),
    longitude = col_double(),
    best = col_double()
  )
)

# Keep events recorded in the three study countries.
study_countries <- c("South Africa", "Botswana", "Namibia")
study_events <- conflict_data %>%
  filter(country %in% study_countries)

# Count events by country, including countries with no recorded events.
events_by_country <- study_events %>%
  mutate(country = factor(country, levels = study_countries)) %>%
  count(country, name = "event_count", .drop = FALSE)

# Count events by year across the study area.
events_by_year <- study_events %>%
  count(year, name = "event_count") %>%
  arrange(year)

# Count events for each observed combination of country and year.
events_by_country_year <- study_events %>%
  count(country, year, name = "event_count") %>%
  arrange(country, year)

# Check missing coordinates among the filtered study-area events.
missing_coordinates <- study_events %>%
  summarise(
    total_events = n(),
    missing_latitude = sum(is.na(latitude)),
    missing_longitude = sum(is.na(longitude)),
    missing_either_coordinate = sum(is.na(latitude) | is.na(longitude)),
    missing_both_coordinates = sum(is.na(latitude) & is.na(longitude))
  )

# Display the summaries; no raw files are modified or overwritten.
print(events_by_country, n = Inf)
print(events_by_year, n = Inf)
print(events_by_country_year, n = Inf)
print(missing_coordinates)
