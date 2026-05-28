# `data/mock/` — synthetic, shareable

Small fake datasets that mirror the schema of your real data. These are **committed to git** and visible to anyone who forks the repo (including the LLM on Day 3).

## How to make mock data

1. Match column names, types, and ranges exactly.
2. Keep it small (a few hundred rows is plenty).
3. Use `set.seed()` so the mock is reproducible.

Example generator (drop into `R/functions/make_mock_data.R`):

```r
make_mock_consumer_data <- function(n = 200, seed = 42) {
  set.seed(seed)
  tibble::tibble(
    id     = seq_len(n),
    age    = sample(18:80, n, replace = TRUE),
    income = round(rlnorm(n, log(40000), 0.5)),
    score  = rnorm(n, mean = 3.5, sd = 0.9)
  )
}
```

## What NOT to put here

Anything derived from real respondents, even aggregated. If in doubt, generate fresh synthetic data instead.
