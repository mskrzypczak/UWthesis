# UWthesis — UW Thesis LaTeX Class

A minimal LaTeX **class** for a doctoral dissertation at the **University of Warsaw (UW)** with
GitHub Actions that builds example PDFs on every push and publishes them to GitHub Pages.

- **Website:** https://mskrzypczak.github.io/UWthesis/
- **Manual:** https://mskrzypczak.github.io/UWthesis/manual.pdf
- **Download** (class, logos and examples in one folder): https://mskrzypczak.github.io/UWthesis/uw-thesis.zip

> ⚠️ This is a starter. Please adapt typography and formal requirements to your faculty’s rules.

---

## Quick start

```bash
# build locally (requires latexmk); the PDF lands in dist/
latexmk -pdf examples/thesis-demo_EN.tex
# or plain pdflatex/bibtex:
cd examples && pdflatex thesis-demo_EN && bibtex thesis-demo_EN && pdflatex thesis-demo_EN && pdflatex thesis-demo_EN
```

## Files

```
.
├── uw-thesis.cls                # the LaTeX class (black & white)
├── manual.tex                   # the manual of the class
├── UW_logo_EN.pdf, UW_logo_PL.pdf   # logos for the title page (.svg: their sources)
├── .latexmkrc                   # latexmk config for local builds
├── examples/
│   ├── thesis-demo_EN.tex       # demo of a dissertation in English
│   ├── thesis-demo_PL.tex       # demo of a dissertation in Polish
│   ├── test.bib                 # bibliography of the demos
│   └── uw-thesis.cls, UW_logo_*.pdf # links to the files above
├── site/index.html              # the website
└── .github/workflows/latex.yml  # GitHub Actions: build & publish PDFs
```

## GitHub Actions

On every **push** and **pull request**:
- Builds PDFs from `examples/*.tex` and `manual.tex`
- Bundles the class, the logos and the examples into `uw-thesis.zip`
- Uploads PDFs as build artifacts
- Publishes the website, the PDFs and the bundle to **GitHub Pages** (from `main` only)

### Badges
[![Build LaTeX](https://github.com/mskrzypczak/UWthesis/actions/workflows/latex.yml/badge.svg)](https://github.com/mskrzypczak/UWthesis/actions/workflows/latex.yml)

### Links to compiled PDFs
- Demo PDFs are available as:
  - **Artifact** in the latest successful workflow run, and
  - **GitHub Pages** at: https://mskrzypczak.github.io/UWthesis/thesis-demo_EN.pdf
    and https://mskrzypczak.github.io/UWthesis/thesis-demo_PL.pdf

> After you push to GitHub, go to **Settings → Pages** and ensure “Build and deployment” is set to **GitHub Actions**.

## Using the class

The class is black-and-white by default and exposes just one option group:
- language: `[english|polish]`

In your `.tex` (kept next to `uw-thesis.cls` and the logos, compiled with pdfLaTeX):

```latex
\documentclass[english]{uw-thesis}
\titleEN{Your Thesis Title}
\titlePL{Polski tytuł rozprawy}
\author{Your Name}
\faculty{Faculty of Mathematics, Informatics, and Mechanics}
\disciplineEN{Computer and Information Sciences}
\disciplinePL{informatyka}
\addSupervisor{Prof. Jane Doe}
\date{October 2025}
\keywords{keyword one; keyword two}
\abstractPL{Streszczenie po polsku.}
\abstractEN{Abstract in English.}
\begin{document}
\makefrontmatter
\chapter{Introduction}
Hello UW!

\end{document}
```

## License

MIT — see `LICENSE`.
