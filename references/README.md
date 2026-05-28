# `references/` — citations, one source of truth

One `references.bib` for the whole repo. Used by Quarto reports, the LaTeX manuscript, and anywhere else you cite.

## The Zotero workflow

1. Install [Better BibTeX](https://retorque.re/zotero-better-bibtex/) in Zotero.
2. In Zotero: right-click your collection → **Export Collection** → format **Better BibLaTeX** → **Keep updated**, export to `references/references.bib`.
3. Zotero now overwrites this file every time you add a reference. Commit the updates.

## Citation keys

Set Better BibTeX to `[auth:lower][year]` so keys look like `smith2020`. Then:

- **Quarto:** `[@smith2020]` produces "(Smith, 2020)".
- **LaTeX:** `\citep{smith2020}` does the same.

## Citation style

Drop a `.csl` file here (download from the [Zotero style repository](https://www.zotero.org/styles)) and reference it in each `.qmd`'s YAML:

```yaml
csl: ../references/apa.csl
```

LaTeX uses `\bibliographystyle{}` instead — see [`../manuscript/README.md`](../manuscript/README.md).

## Why one shared `.bib`?

So your paper, your website, and your slides all cite the same way. If you fix a reference in Zotero, every output updates the next time you render.
