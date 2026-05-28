# `data/` — three buckets, one rule

| Subfolder | What goes here | Tracked in git? |
| --- | --- | --- |
| [`mock/`](mock/) | Small, synthetic, safe-to-share data with the same schema as the real thing. | **Yes** — always committed. |
| [`raw/`](raw/) | The original data, exactly as you received it. Never edit by hand. | **No** — content is gitignored. |
| [`processed/`](processed/) | Cleaned, joined, derived data produced by your scripts. | **No** — content is gitignored. |

## The rule

> **Raw data is read-only. Processed data is reproducible from raw data. Mock data is what the world sees.**

If a script crashes when you delete `data/processed/`, that's a feature — it forces the pipeline to stay reproducible.

## Switching between mock and real

Your scripts read from `data/mock/` by default. To use the real data, set `DATA_MODE=real` in your `.Renviron`:

```
DATA_MODE=real
```

Then `R/01_setup.R` resolves `data_path("consumer_data.csv")` to `data/raw/consumer_data.csv`. Everything else in the analysis stays identical.

## Why this split exists

- **Privacy:** real data never leaves your machine. The .gitignore enforces it.
- **Collaboration:** anyone who forks this repo can run the full pipeline against `mock/` without asking you for files.
- **LLM safety:** on Day 3, the assistant only ever sees `mock/` — it cannot read what it cannot see.

See the root [README](../README.md#working-with-an-llm-day-3) for the LLM workflow.
