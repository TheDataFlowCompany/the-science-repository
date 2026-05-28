# 01_setup.R
# Packages, paths, and the data-mode helper. Source this first.

if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")

library(here)

data_mode <- function() {
  mode <- Sys.getenv("DATA_MODE", unset = "mock")
  if (!mode %in% c("mock", "real")) {
    stop("DATA_MODE must be 'mock' or 'real' (got '", mode, "'). Edit your .Renviron.")
  }
  mode
}

data_path <- function(...) {
  subdir <- if (data_mode() == "mock") "mock" else "raw"
  base   <- Sys.getenv("RAW_DATA_DIR", unset = "")
  if (data_mode() == "real" && nzchar(base)) {
    file.path(base, ...)
  } else {
    here::here("data", subdir, ...)
  }
}

processed_path <- function(...) here::here("data", "processed", ...)
figure_path    <- function(...) here::here("figures", ...)

message("Setup complete. DATA_MODE = ", data_mode(), ".")
