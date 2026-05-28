# `R/functions/` — reusable functions

Put any function you call more than once here. One file per topic (e.g., `data_loading.R`, `plot_helpers.R`). Source them from your numbered scripts:

```r
source(here::here("R", "functions", "data_loading.R"))
```

Keep functions pure where possible — take inputs, return outputs, don't reach into the global environment. That makes them easy to test and easy for the LLM to reason about on Day 3.
