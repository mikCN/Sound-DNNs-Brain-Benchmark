# Manuscript (Overleaf-ready)

All paper sources live in this folder only.

**Scope:** MEG sensor RSA (primary) + auditory **fMRI** ROI RSA (Maastricht betas; Glasser hierarchy; $R^2_{MC}$).

## Contents

```
manuscript/
├── main.tex              # Main document (MEG + fMRI)
├── main.pdf              # Compiled PDF
├── references.bib        # PLACEHOLDER — add verified BibTeX entries here
├── tables/model_zoo.tex  # Model table ([TBD] reference column)
├── figures/              # MEG + fMRI analysis PNGs
└── sync_figures.sh
```

## Bibliography

**Citations are not wired yet.** `references.bib` is a placeholder. The manuscript compiles without BibTeX.

When ready:
1. Add verified entries to `references.bib`
2. Uncomment `natbib` in `main.tex`
3. Replace `\bibliography{references}` block (see References section in `main.tex`)
4. Replace `[TBD]` in `tables/model_zoo.tex` with `\cite{key}`

## Compile

```bash
cd manuscript
bash sync_figures.sh    # optional: refresh figures
latexmk -pdf main.tex
```

## Overleaf

Zip this folder or sync with Overleaf root = `manuscript/`. Main document: **`main.tex`**.
