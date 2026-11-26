# UWthesis — UW Thesis LaTeX Class

A LaTeX **class** for a doctoral dissertation at the **[University of Warsaw](https://en.uw.edu.pl/) (UW)**. It typesets
the formal front matter (the title page, the statements of the supervisors and of the author, the
keywords, and the abstracts in Polish and in English) from a few commands in the preamble, and
otherwise behaves like the standard class `report`.

- **Website:** https://mskrzypczak.github.io/UWthesis/
- **Manual:** https://mskrzypczak.github.io/UWthesis/manual.pdf
- **Download** (class, logos and examples in one folder): https://mskrzypczak.github.io/UWthesis/uw-thesis.zip

> The layout is aligned with the doctoral dissertation template of the Faculty of Mathematics,
> Informatics, and Mechanics. Formal requirements differ between the units of the University and
> change over time, so please check the result against the rules that apply to you.

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

> In a fork, go to **Settings → Pages** and ensure “Build and deployment” is set to **GitHub Actions**.

## Using the class

The class is black-and-white by default and exposes just one option group:
- language: `[english|polish]`

In your `.tex` (kept next to `uw-thesis.cls` and the logos, compiled with pdfLaTeX):

```latex
\documentclass[english]{uw-thesis}

\titleEN{Title of the doctoral dissertation}
\titlePL{Polski tytuł rozprawy doktorskiej}
\author{Your Full Name}
\date{June 2026}

\faculty{Doctoral School of Exact and Natural Sciences}
\disciplineEN{Computer and Information Sciences}
\disciplinePL{informatyka}

\addSupervisor{Prof.~Main Supervisor}
\addCosupervisor{Dr~Assistant Supervisor}

\keywords{keyword one; keyword two; keyword three}
\abstractPL{Tutaj wstaw streszczenie po polsku.}
\abstractEN{Put the English abstract here.}

\begin{document}
\makefrontmatter

\chapter{Introduction}
Start the thesis here.
\end{document}
```

## License

MIT — see `LICENSE`.
