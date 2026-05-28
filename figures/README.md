# `figures/` — saved plots

Static images produced by your analysis scripts. Committed to git so anyone reading the repo on GitHub sees the plots without re-running the code.

## Convention

- Save with descriptive names: `fig_03_age_by_score.png`, not `Rplot01.png`.
- Both `.png` (for the web, slides) and `.pdf` (for the manuscript) is fine.
- Save from scripts, not interactively:

```r
ggplot2::ggsave(
  here::here("figures", "fig_03_age_by_score.png"),
  plot = p, width = 6, height = 4, dpi = 300
)
```

If a figure is part of the website, reference it from `reports/*.qmd`. If it's part of the paper, reference it from `manuscript/main.tex`. Same file, two outputs.
