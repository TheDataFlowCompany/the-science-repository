# `shiny/data/` — data the app ships with

Synthetic only. Whatever lives here gets deployed with the app.

The simplest pattern: at the top of `app.R`, copy the same mock dataset your analysis uses:

```r
mock_data <- readr::read_csv(here::here("data", "mock", "consumer_data.csv"))
```

That keeps one source of truth in [`../../data/mock/`](../../data/mock/) and avoids drift.
