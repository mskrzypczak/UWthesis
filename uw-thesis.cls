\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uw-thesis}[2025/10/27 UW Thesis class (black-and-white starter)]

% === Options: degree and language only ===
\newcommand\uw@degree{Doctor of Philosophy}
\newcommand\uw@lang{english}

\DeclareOption{phd}{\renewcommand\uw@degree{Doctor of Philosophy}}
\DeclareOption{msc}{\renewcommand\uw@degree{Master of Science}}
\DeclareOption{english}{\renewcommand\uw@lang{english}}
\DeclareOption{polish}{\renewcommand\uw@lang{polish}}
\ExecuteOptions{phd,english}
\ProcessOptions\relax

\LoadClass[12pt,a4paper,twoside]{report}

% === Packages ===
\RequirePackage[\uw@lang]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{emptypage}

% Geometry & line spacing
\geometry{margin=3cm}
\onehalfspacing

% === Black & White setup ===
% Avoid colored links; keep output monochrome
\hypersetup{hidelinks}

% Metadata commands
\newcommand{\faculty}[1]{\def\uw@faculty{#1}}
\newcommand{\supervisor}[1]{\def\uw@supervisor{#1}}

% Title formatting (black text)
\titleformat{\chapter}[display]
  {\normalfont\bfseries}
  {\filright\Large\MakeUppercase{\chaptername}~\thechapter}
  {1ex}
  {\titlerule[1pt]\vspace{1ex}\filright\Huge}
  [\vspace{1ex}\titlerule]

% Auto TOC/LOF/LOT after title page
\AtBeginDocument{%
  \begingroup
  \let\clearpage\relax
  \tableofcontents
  \listoffigures
  \listoftables
  \endgroup
  \clearpage
}

% Title page
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \centering
    {\Large University of Warsaw \par}
    \vspace{0.5cm}
    {\large \uw@faculty\par}
    \vfill
    {\LARGE\bfseries \@title \par}
    \vspace{1.2cm}
    {\large \@author \par}
    \vspace{0.2cm}
    {\large \uw@degree\par}
    \vspace{1.2cm}
    {\large Supervisor: \uw@supervisor\par}
    \vfill
    {\large \@date\par}
  \end{titlepage}
  \setcounter{page}{1}
}

% Page style
\pagestyle{headings}
