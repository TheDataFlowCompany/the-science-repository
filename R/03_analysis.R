# 03_analysis.R
# The actual analysis. Reads from data/processed/.

source(here::here("R", "01_setup.R"))

# Example:
# clean <- readRDS(processed_path("consumer_clean.rds"))
# fit <- lm(score_z ~ age + income, data = clean)
# summary(fit)
