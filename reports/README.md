# `reports/` — Quarto sources

Annotated code, prose, and results in one `.qmd` file each. This is where you write the story; [`docs/`](../docs/) is where the rendered website lands.

## Convention

- One `.qmd` per report or chapter: `01_overview.qmd`, `02_descriptives.qmd`, …
- Sources live here; **rendered HTML never lives here.** That's `docs/`.
- Reference data and functions through `here::here()` and the helpers in `R/01_setup.R`.

## Render

From the project root:

```bash
quarto render reports/
```

This writes the website to `docs/` (configured in `_quarto.yml`, which you'll add when you start your first report). GitHub Pages then serves `docs/` as your project site.

## Citations

Reference your `references/references.bib` from each `.qmd`'s YAML header:

```yaml
bibliography: ../references/references.bib
csl: ../references/apa.csl
```

Cite with `[@smith2020]`. See [`references/README.md`](../references/README.md) for the Zotero workflow.
