# `manuscript/` — your LaTeX paper

The static, journal-ready version of your work. Lives in the same repo as the code so the paper, the analysis, and the data are versioned together.

## Files

- `main.tex` — the paper itself.
- `references.bib` — symlink or copy from [`../references/references.bib`](../references/references.bib). One source of truth.
- `output/` — rendered PDFs. Committed so reviewers can read without compiling.

## Render locally

**Option A — Texifier (paid, macOS, what we use in the workshop):**
Open `main.tex` in [Texifier](https://www.texifier.com/). Hit ⌘B. Output lands in `output/`.

**Option B — tinytex (free, works in R):**

```r
install.packages("tinytex")
tinytex::install_tinytex()   # one-time, installs a portable TeX
tinytex::pdflatex("manuscript/main.tex", clean = TRUE)
```

Both produce the same PDF. Texifier is nicer for writing; `tinytex` is nicer for "render this from a script."

## Collaborate via Overleaf

Overleaf has built-in git integration:

1. On Overleaf, create a project → **Menu** → **Git** → copy the URL.
2. Locally, in this `manuscript/` folder:
   ```bash
   git remote add overleaf <overleaf-url>
   git subtree push --prefix=manuscript overleaf master
   ```
3. Pull collaborator changes back with `git subtree pull --prefix=manuscript overleaf master`.

Treat Overleaf as a remote for the `manuscript/` subtree only. The rest of the repo stays on GitHub.

## Citations

The `.bib` and `.csl` files live in [`../references/`](../references/) and are shared with Quarto reports. In `main.tex`:

```latex
\bibliography{../references/references}
\bibliographystyle{apa}
```
