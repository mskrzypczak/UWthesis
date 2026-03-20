\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uw-thesis}[2026/03/20 UW Thesis class aligned with the WMIM doctoral template]

% === Options ===
\newcommand\uw@degree{Doctor of Philosophy}
\newcommand\uw@worktype{Doctoral dissertation}
\newcommand\uw@lang{english}

\DeclareOption{phd}{%
  \renewcommand\uw@degree{Doctor of Philosophy}%
  \renewcommand\uw@worktype{Doctoral dissertation}%
}
\DeclareOption{msc}{%
  \renewcommand\uw@degree{Master of Science}%
  \renewcommand\uw@worktype{Master's thesis}%
}
\DeclareOption{english}{\renewcommand\uw@lang{english}}
\DeclareOption{polish}{\renewcommand\uw@lang{polish}}
\ExecuteOptions{phd,english}
\ProcessOptions\relax

\LoadClass[12pt,a4paper,twoside]{report}

% === Packages ===
\RequirePackage[\uw@lang]{babel}
\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}
\else
  \RequirePackage{fontspec}
  \setmainfont{Times New Roman}
\fi
\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{emptypage}
\RequirePackage{array}

% === Layout ===
\geometry{margin=3cm}
\onehalfspacing
\hypersetup{hidelinks}

% === Metadata defaults ===
\def\uw@faculty{Faculty of Mathematics, Informatics, and Mechanics}
\def\uw@field{Natural Sciences}
\def\uw@fieldpl{nauk ścisłych i przyrodniczych}
\def\uw@discipline{Computer and Information Sciences}
\def\uw@disciplinepl{informatyka}
\def\uw@supervisor{}
\def\uw@cosupervisor{}
\def\uw@keywords{}
\def\uw@polishtitle{}
\def\uw@polishabstract{}
\def\uw@englishabstract{}
\def\uw@logofile{../UW_logo.pdf}

% === Public metadata commands ===
\newcommand{\faculty}[1]{\gdef\uw@faculty{#1}}
\newcommand{\field}[1]{\gdef\uw@field{#1}}
\newcommand{\fieldpl}[1]{\gdef\uw@fieldpl{#1}}
\newcommand{\discipline}[1]{\gdef\uw@discipline{#1}}
\newcommand{\disciplinepl}[1]{\gdef\uw@disciplinepl{#1}}
\newcommand{\supervisor}[1]{\gdef\uw@supervisor{#1}}
\newcommand{\cosupervisor}[1]{\gdef\uw@cosupervisor{#1}}
\newcommand{\keywords}[1]{\gdef\uw@keywords{#1}}
\newcommand{\polishtitle}[1]{\gdef\uw@polishtitle{#1}}
\newcommand{\polishabstract}[1]{\gdef\uw@polishabstract{#1}}
\newcommand{\englishabstract}[1]{\gdef\uw@englishabstract{#1}}
\newcommand{\titlepagelogo}[1]{\gdef\uw@logofile{#1}}

% === Title formatting for the main matter ===
\titleformat{\chapter}[display]
  {\normalfont\bfseries}
  {\filright\Large\MakeUppercase{\chaptername}~\thechapter}
  {1ex}
  {\titlerule[1pt]\vspace{1ex}\filright\Huge}
  [\vspace{1ex}\titlerule]

% === Helpers ===
\makeatletter
\newcommand{\uw@ifempty}[3]{%
  \edef\uw@temp{#1}%
  \ifx\uw@temp\@empty #2\else #3\fi
}

\newcommand{\uw@frontheading}[1]{%
  \vspace*{1.5cm}%
  {\noindent\bfseries #1\par}%
  \vspace{1.2cm}%
}

\newcommand{\uw@signatureline}[2]{%
  \par\vspace{1.1cm}%
  \noindent\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}p{0.28\textwidth}p{0.55\textwidth}@{}}
  #1 & #2
  \end{tabular*}\par
}

\newcommand{\uw@supervisionline}{%
  prepared under the supervision of \textbf{\uw@supervisor}%
  \uw@ifempty{\uw@cosupervisor}{}{\\ and assistant supervision of \textbf{\uw@cosupervisor}}%
}
\newcommand{\uw@titlepage}{%
  \begin{titlepage}
    \thispagestyle{empty}

    {\centering
      \vspace*{1.2cm}
      {\fontsize{18}{22}\selectfont UNIVERSITY OF WARSAW\par}
      \vspace{0.5cm}
      {\fontsize{18}{22}\selectfont \uw@faculty\par}
      \vspace{1.8cm}
      \IfFileExists{\uw@logofile}{\includegraphics[width=32mm]{\uw@logofile}\par\vspace{1.8cm}}{\vspace{2.8cm}}
      {\fontsize{16}{20}\selectfont\bfseries \@title\par}
      \vspace{1.5cm}
      {\fontsize{14}{18}\selectfont \@author\par}
    }

    \vfill

    \begin{flushright}
      {\normalsize \textbf{\uw@worktype}\par}
      \vspace{0.1cm}
      {\normalsize in the field of \textbf{\uw@field}\par}
      \vspace{0.1cm}
      {\normalsize in the discipline of \textbf{\uw@discipline}\par}
      \vspace{0.1cm}
      {\normalsize \uw@supervisionline\par}
    \end{flushright}

    \vfill

    {\centering
      {\normalsize Warsaw, \@date\par}
    }
  \end{titlepage}%
}

\newcommand{\uw@statementspage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Oświadczenie promotora /\\Statement of the Supervisor on submission of the doctoral dissertation}
  Oświadczam, że niniejsza rozprawa doktorska została przygotowana pod moim kierunkiem. Stwierdzam, że praca spełnia wymagania określone dla rozpraw doktorskich i może zostać przedstawiona w postępowaniu o nadanie stopnia doktora w dziedzinie \uw@fieldpl, w dyscyplinie \uw@disciplinepl.\par
  \vspace{0.9cm}
  I hereby certify that the thesis submitted has been prepared under my supervision and I declare that it satisfies the requirements of submission in the proceedings for the award of a degree of Doctor in the field of \uw@field\ in the discipline of \uw@discipline.\par
  \uw@signatureline{Data / Date}{Podpis promotora / Signature of the Supervisor}

  \uw@ifempty{\uw@cosupervisor}{}{%
    \vspace{1.2cm}
    {\noindent\bfseries Oświadczenie promotora pomocniczego /\\Statement of the Assistant Supervisor\par}
    \vspace{1.0cm}
    Oświadczam, że niniejsza rozprawa doktorska została przygotowana z moim udziałem w procesie planowania badań, ich realizacji i analizy wyników oraz stwierdzam, że spełnia ona warunki do przedstawienia jej w postępowaniu o nadanie stopnia doktora w dziedzinie \uw@fieldpl, w dyscyplinie \uw@disciplinepl.\par
    \vspace{0.9cm}
    I hereby declare that the present doctoral dissertation was prepared with my participation in the process of planning the research, conducting it, and analyzing the results. I confirm that it meets the requirements for submission in the proceedings for the award of a degree of Doctor in the field of \uw@field\ in the discipline of \uw@discipline.\par
    \uw@signatureline{Data / Date}{Podpis promotora pomocniczego / Signature of the Assistant Supervisor}
  }%
  \endgroup
}

\newcommand{\uw@authorpage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Oświadczenie autora pracy /\\Statement of the Author on submission of the doctoral dissertation}
  Świadom(a) odpowiedzialności prawnej oświadczam, że niniejsza rozprawa doktorska została przygotowana przeze mnie samodzielnie i nie zawiera treści uzyskanych w sposób niezgodny z obowiązującymi przepisami prawa.\par
  \vspace{0.8cm}
  Oświadczam ponadto, że przedłożona praca nie była dotychczas przedmiotem postępowania w sprawie nadania stopnia doktora w żadnej innej jednostce naukowej.\par
  \vspace{0.8cm}
  Zapewniam również, że niniejsza wersja rozprawy jest tożsama z załączoną wersją elektroniczną.\par
  \vspace{0.9cm}
  Aware of the legal responsibility, I declare that this doctoral dissertation was completed independently and does not include any material acquired unlawfully.\par
  \vspace{0.8cm}
  I further declare that this dissertation has not been previously submitted as part of any procedure for the award of a doctoral degree at any other academic institution.\par
  \vspace{0.8cm}
  I also confirm that this version of the dissertation is identical to the attached electronic version.\par
  \uw@signatureline{Data / Date}{Podpis autora pracy / Signature of the Author of the thesis}
  \endgroup
}

\newcommand{\uw@keywordspage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Słowa kluczowe / Keywords}
  \uw@keywords\par
  \vspace{2cm}
  {\noindent\bfseries Tytuł pracy w języku polskim / Title of the doctoral dissertation in Polish\par}
  \vspace{1.0cm}
  \uw@polishtitle\par
  \endgroup
}

\newcommand{\uw@polishabstractpage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Streszczenie w języku polskim / Abstract in Polish}
  \uw@polishabstract\par
  \endgroup
}

\newcommand{\uw@englishabstractpage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Streszczenie w języku angielskim / Abstract in English}
  \uw@englishabstract\par
  \endgroup
}

\renewcommand{\maketitle}{\uw@titlepage}

\newcommand{\makefrontmatter}{%
  \pagestyle{plain}%
  \maketitle
  \setcounter{page}{2}% title page is counted but not printed
  \uw@statementspage
  \uw@authorpage
  \uw@keywordspage
  \uw@polishabstractpage
  \uw@englishabstractpage
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Spis treści / Table of Contents}
  \@starttoc{toc}
  \endgroup
  \clearpage
  \pagestyle{headings}%
}

\newcommand{\mainmatter}{%
  \clearpage
  \pagestyle{headings}%
}
\makeatother

% Default page style outside front matter
\pagestyle{headings}
