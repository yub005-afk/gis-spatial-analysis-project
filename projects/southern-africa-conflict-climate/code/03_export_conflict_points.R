# GIS Assignment 2: Export individual conflict events for QGIS.
# Run this script from the current RStudio project root.
library(readr)
library(dplyr)

# Use project-relative paths and leave the original raw CSV unchanged.
input_path <- "data/raw/GEDEvent_v26_1.csv"
output_path <- "data/processed/conflict_points_3countries.csv"
if (!file.exists(input_path)) stop("Input file not found: ", input_path)

# Read the QGIS fields using the same column types as script 02.
column_types <- cols_only(
  country = col_character(),
  year = col_integer(),
  latitude = col_double(),
  longitude = col_double(),
  best = col_double()
)
conflict_data <- read_csv(input_path, col_types = column_types)
if (nrow(problems(conflict_data)) > 0L) stop("Input parsing errors detected.")

# Reuse the validated country filter from 02_filter_conflict_data.R.
# Preserve individual event rows and all observed years without aggregation.
study_countries <- c("South Africa", "Botswana", "Namibia")
study_events <- conflict_data %>%
  filter(country %in% study_countries) %>%
  select(country, year, latitude, longitude, best)

# Check the expected event count and complete coordinates before export.
stopifnot(nrow(study_events) == 2928L)
stopifnot(!anyNA(study_events$latitude), !anyNA(study_events$longitude))

# Create the processed-data directory and export the individual events.
dir.create(dirname(output_path), recursive = TRUE, showWarnings = FALSE)
write_csv(study_events, output_path)

# Read the saved CSV back to verify its contents, not just its existence.
exported_events <- read_csv(output_path, col_types = column_types)
required_columns <- c("country", "year", "latitude", "longitude", "best")
stopifnot(
  file.exists(output_path),
  nrow(problems(exported_events)) == 0L,
  nrow(exported_events) == 2928L,
  all(required_columns %in% names(exported_events)),
  !anyNA(exported_events$latitude),
  !anyNA(exported_events$longitude),
  isTRUE(all.equal(study_events, exported_events))
)

# Report the verified output and coordinate completeness.
cat("Export verified:", output_path, "\n")
cat("Rows:", nrow(exported_events), "\n")
cat("Required columns:", paste(required_columns, collapse = ", "), "\n")
cat("Missing latitude:", sum(is.na(exported_events$latitude)), "\n")
cat("Missing longitude:", sum(is.na(exported_events$longitude)), "\n")
