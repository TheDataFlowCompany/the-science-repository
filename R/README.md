# `R/` — your code

All R scripts live here. Nothing else.

## Convention

- Number scripts by stage so the order is obvious: `01_setup.R`, `02_data_processing.R`, `03_analysis.R`, …
- Put reusable functions in [`functions/`](functions/) and `source()` them from your numbered scripts.
- Never call `setwd()`. Use `here::here("data", "mock", "consumer_data.csv")` so paths work for anyone who forks this.
- Read data through the helper in `01_setup.R` — it respects `DATA_MODE` and points to `data/mock/` or `data/raw/` automatically.

## Naming

- Scripts: `snake_case.R`, prefixed with a two-digit stage number.
- Functions: `snake_case`, verb-first (`load_consumer_data()`, not `consumer_data_loader()`).
- One function per file in `functions/` once a file gets longer than ~100 lines.

## Run order

```r
source("R/01_setup.R")          # packages, paths, helpers
source("R/02_data_processing.R") # raw → processed
source("R/03_analysis.R")        # the actual analysis
```

If a script depends on another, say so in a one-line comment at the top. That's the only comment most scripts need.
