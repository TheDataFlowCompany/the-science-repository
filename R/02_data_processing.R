# 02_data_processing.R
# Reads from data/mock/ or data/raw/ (controlled by DATA_MODE), writes to data/processed/.

source(here::here("R", "01_setup.R"))

# Example:
# raw <- readr::read_csv(data_path("consumer_data.csv"))
# clean <- raw |>
#   dplyr::filter(!is.na(id)) |>
#   dplyr::mutate(score_z = scale(score)[, 1])
# saveRDS(clean, processed_path("consumer_clean.rds"))
