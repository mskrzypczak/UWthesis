# UWthesis — UW Thesis LaTeX Class

A minimal LaTeX **class** for a PhD/MSc thesis at the **University of Warsaw (UW)** with
GitHub Actions that builds example PDFs on every push and publishes them to GitHub Pages.

> ⚠️ This is a starter. Please adapt typography and formal requirements to your faculty’s rules.

---

## Quick start

```bash
# build locally (requires latexmk)
latexmk -pdf examples/thesis-demo.tex
# or plain pdflatex/bibtex:
pdflatex examples/thesis-demo.tex && bibtex examples/thesis-demo && pdflatex examples/thesis-demo.tex && pdflatex examples/thesis-demo.tex
```

## Files

```
.
├── uw-thesis.cls                # the LaTeX class (black & white)
├── .latexmkrc                   # latexmk config for local builds
├── examples/
│   └── thesis-demo.tex          # minimal demo using the class
└── .github/workflows/latex.yml  # GitHub Actions: build & publish PDFs
```

## GitHub Actions

On every **push** and **pull request**:
- Builds PDFs from `examples/*.tex`
- Uploads PDFs as build artifacts
- Publishes PDFs to **GitHub Pages** under `dist/`

### Badges
[![Build LaTeX](https://github.com/mskrzypczak/UWthesis/actions/workflows/latex.yml/badge.svg)](https://github.com/mskrzypczak/UWthesis/actions/workflows/latex.yml)

### Links to compiled PDFs
- Demo PDF will be available as:
  - **Artifact** in the latest successful workflow run, and
  - **GitHub Pages** at: https://mskrzypczak.github.io/UWthesis/thesis-demo.pdf

> After you push to GitHub, go to **Settings → Pages** and ensure “Build and deployment” is set to **GitHub Actions**.

## Using the class

The class is black-and-white by default and exposes just two option groups:
- degree: `[phd|msc]`
- language: `[english|polish]`

In your `.tex`:

```latex
\documentclass[phd,english]{uw-thesis}
\title{Your Thesis Title}
\author{Your Name}
\faculty{Faculty of Mathematics, Informatics and Mechanics}
\supervisor{Prof. Jane Doe}
\date{October 2025}
\begin{document}
\maketitle
\chapter{Introduction}
Hello UW!

\end{document}
```

## License

MIT — see `LICENSE`.
