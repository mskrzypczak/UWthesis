\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uw-thesis}[2026/03/20 UW Thesis class aligned with the WMIM doctoral template]

% === Options ===
\newcommand\uw@lang{english}

\DeclareOption{english}{\renewcommand\uw@lang{english}}
\DeclareOption{polish}{\renewcommand\uw@lang{polish}}
\ExecuteOptions{english}
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

\newcommand{\uw@ifEN}[1]{\ifthenelse{\equal{\uw@lang}{english}}{#1}{}}
\newcommand{\uw@ifPL}[1]{\ifthenelse{\equal{\uw@lang}{polish}}{#1}{}}

\newcommand{\uw@caseLang}[2]{%
  \ifthenelse{\equal{\uw@lang}{english}}{#1}{}%
  \ifthenelse{\equal{\uw@lang}{polish}}{#2}{}%
}

% === Metadata defaults ===
\def\uw@university{\uw@caseLang%
    {UNIVERSITY OF WARSAW}%
    {UNIWERSYTET WARSZAWSKI}%
}
\def\uw@faculty{\uw@caseLang%
    {Faculty of Mathematics, Informatics, and Mechanics}%
    {Wydział Matematyki, Informatyki i Mechaniki}%
}

\def\uw@fieldEN{Natural Sciences}
\def\uw@fieldPL{nauk ścisłych i przyrodniczych}

\def\uw@disciplineEN{Computer and Information Sciences}
\def\uw@disciplinepl{informatyka}

\def\uw@place{\uw@caseLang{Warsaw}{Warszawa}}

\def\uw@keywords{}
\def\uw@titlePL{}
\def\uw@titleEN{}
\def\uw@abstractPL{}
\def\uw@abstractEN{}
\def\uw@logo{%
  \uw@caseLang%
    {\includegraphics[width=32mm]{UW_logo_EN.pdf}}%
    {\includegraphics[width=32mm]{UW_logo_PL.pdf}}%
}

% === Supervisors ===

\ExplSyntaxOn

\seq_new:N \g_uw_supervisor_seq
\seq_new:N \g_uw_copervisor_seq

\NewDocumentCommand{\addSupervisor}{m}
  {
    \seq_gput_right:Nn \g_uw_supervisor_seq { #1 }
  }

\NewDocumentCommand{\addCosupervisor}{m}
  {
    \seq_gput_right:Nn \g_uw_copervisor_seq { #1 }
  }

\cs_new_protected:Npn \uw_print_sequence_bold:N #1
  {
    \group_begin:
      \seq_clear:N \l_tmpa_seq
      \seq_map_inline:Nn #1
        {
          \seq_put_right:Nn \l_tmpa_seq { \textbf{##1} }
        }
      \seq_use:Nnnn \l_tmpa_seq
        {\uw@caseLang{~and~}{~i~}}
        {,~}
        {\uw@caseLang{,~and~}{~i~}}
    \group_end:
  }

\NewDocumentCommand{\uw@printSupervisors}{}
  {
    \uw_print_sequence_bold:N \g_uw_supervisor_seq
  }

\NewDocumentCommand{\uw@printCopervisors}{}
  {
    \uw_print_sequence_bold:N \g_uw_copervisor_seq
  }
  
\NewDocumentCommand{\uw@ifCopervisors}{m}
  {
    \seq_if_empty:NF \g_uw_copervisor_seq
      { #1 }
  }

\ExplSyntaxOff

% === Public metadata commands ===
\newcommand{\faculty}[1]{\gdef\uw@faculty{#1}}
\newcommand{\titlePL}[1]{\gdef\uw@titlePL{#1}}
\newcommand{\titleEN}[1]{\gdef\uw@titleEN{#1}}
\newcommand{\fieldEN}[1]{\gdef\uw@fieldEN{#1}}
\newcommand{\fieldPL}[1]{\gdef\uw@fieldPL{#1}}
\newcommand{\disciplineEN}[1]{\gdef\uw@disciplineEN{#1}}
\newcommand{\disciplinePL}[1]{\gdef\uw@disciplinePL{#1}}
\newcommand{\keywords}[1]{\gdef\uw@keywords{#1}}
\newcommand{\abstractPL}[1]{\gdef\uw@abstractPL{#1}}
\newcommand{\abstractEN}[1]{\gdef\uw@abstractEN{#1}}
\newcommand{\place}[1]{\gdef\uw@place{#1}}

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
  \par\nobreak\vspace{1.1cm}\nobreak%
  \noindent
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    #1 &
    \begin{tabular}[t]{@{}r@{}}
      #2
    \end{tabular}
  \end{tabular*}%
  \par
}

\newcommand{\uw@supervisionline}{%
  \uw@caseLang{prepared under the supervision of}{przygotowana pod opieką} \uw@printSupervisors%
  \uw@ifCopervisors{\\ \uw@caseLang{and assistant supervision of}{oraz opieką pomocniczą} \uw@printCopervisors}%
}

\newcommand{\uw@titlepage}{%
  \begin{titlepage}
    \thispagestyle{empty}

    {\centering
      \vspace*{1.2cm}
      {\fontsize{18}{22}\selectfont \uw@university\par}
      \vspace{0.5cm}
      {\fontsize{18}{22}\selectfont \uw@faculty\par}
      \vspace{1.8cm}
      \uw@logo\par\vspace{1.8cm}{\vspace{2.8cm}}
      {\fontsize{16}{20}\selectfont\bfseries \uw@caseLang{\uw@titleEN}{\uw@titlePL}\par}
      \vspace{1.5cm}
      {\fontsize{14}{18}\selectfont \@author\par}
    }

    \vfill

    \uw@caseLang{
    \begin{flushright}
      {\normalsize \textbf{Doctoral dissertation}\par}
      \vspace{0.1cm}
      {\normalsize in the field of \textbf{\uw@fieldEN}\par}
      \vspace{0.1cm}
      {\normalsize in the discipline of \textbf{\uw@disciplineEN}\par}
      \vspace{0.1cm}
      {\normalsize \uw@supervisionline\par}
    \end{flushright}
    }{
    \begin{flushright}
      {\normalsize \textbf{Rozprawa doktorska}\par}
      \vspace{0.1cm}
      {\normalsize w dziedzinie \textbf{\uw@fieldPL}\par}
      \vspace{0.1cm}
      {\normalsize w dyscyplinie \textbf{\uw@disciplinePL}\par}
      \vspace{0.1cm}
      {\normalsize \uw@supervisionline\par}
    \end{flushright}
    }
    \vfill

    {\centering
      {\normalsize \uw@place, \@date\par}
    }
  \end{titlepage}%
}

\newcommand{\uw@superStatement}[1]{
  \uw@caseLang{
  \uw@frontheading{Oświadczenie promotora /\\Statement of the Supervisor on submission of the doctoral dissertation}
  Oświadczam, że niniejsza rozprawa doktorska została przygotowana pod moim kierunkiem. Stwierdzam, że praca spełnia wymagania określone dla rozpraw doktorskich i może zostać przedstawiona w postępowaniu o nadanie stopnia doktora w dziedzinie \uw@fieldPL, w dyscyplinie \uw@disciplinePL.\par
  \vspace{0.9cm}
  I hereby certify that the thesis submitted has been prepared under my supervision and I declare that it satisfies the requirements of submission in the proceedings for the award of a degree of Doctor in the field of \uw@fieldEN\ in the discipline of \uw@disciplineEN.\par
  \uw@signatureline{Data / Date}{Podpis promotora /\\ Signature of the Supervisor\\ #1}
  }{
  \uw@frontheading{Oświadczenie promotora}
  Oświadczam, że niniejsza rozprawa doktorska została przygotowana pod moim kierunkiem. Stwierdzam, że praca spełnia wymagania określone dla rozpraw doktorskich i może zostać przedstawiona w postępowaniu o nadanie stopnia doktora w dziedzinie \uw@fieldPL, w dyscyplinie \uw@disciplinePL.\par
  \uw@signatureline{Data}{Podpis promotora\\ #1}
  }
}

\newcommand{\uw@coperStatement}[1]{
  \uw@caseLang{
    \uw@frontheading{Oświadczenie promotora pomocniczego /\\Statement of the Assistant Supervisor}
    Oświadczam, że niniejsza rozprawa doktorska została przygotowana z moim udziałem w procesie planowania badań, ich realizacji i analizy wyników oraz stwierdzam, że spełnia ona warunki do przedstawienia jej w postępowaniu o nadanie stopnia doktora w dziedzinie \uw@fieldPL, w dyscyplinie \uw@disciplinePL.\par
    \vspace{0.9cm}
    I hereby declare that the present doctoral dissertation was prepared with my participation in the process of planning the research, conducting it, and analyzing the results. I confirm that it meets the requirements for submission in the proceedings for the award of a degree of Doctor in the field of \uw@fieldEN\ in the discipline of \uw@disciplineEN.\par
    \uw@signatureline{Data / Date}{Podpis promotora pomocniczego /\\ Signature of the Assistant Supervisor\\ #1}
  }{
    \uw@frontheading{Oświadczenie promotora pomocniczego}
    Oświadczam, że niniejsza rozprawa doktorska została przygotowana z moim udziałem w procesie planowania badań, ich realizacji i analizy wyników oraz stwierdzam, że spełnia ona warunki do przedstawienia jej w postępowaniu o nadanie stopnia doktora w dziedzinie \uw@fieldPL, w dyscyplinie \uw@disciplinePL.\par
    \uw@signatureline{Data}{Podpis promotora pomocniczego\\ #1}
  }
}

\ExplSyntaxOn

\NewDocumentCommand{\uw@printSuperStatements}{}
  {
    \seq_map_function:NN \g_uw_supervisor_seq \uw@superStatement
  }

\NewDocumentCommand{\uw@printCoperStatements}{}
  {
    \seq_map_function:NN \g_uw_copervisor_seq \uw@coperStatement
  }

\ExplSyntaxOff

\newcommand{\uw@statementspage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing

  \uw@printSuperStatements

  \uw@printCoperStatements
  \endgroup
}

\newcommand{\uw@authorpage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Oświadczenie autora pracy\uw@ifEN{ /\\Statement of the Author on submission of the doctoral dissertation}}
  Świadom(a) odpowiedzialności prawnej oświadczam, że niniejsza rozprawa doktorska została przygotowana przeze mnie samodzielnie i nie zawiera treści uzyskanych w sposób niezgodny z obowiązującymi przepisami prawa.\par
  \vspace{0.8cm}
  Oświadczam ponadto, że przedłożona praca nie była dotychczas przedmiotem postępowania w sprawie nadania stopnia doktora w żadnej innej jednostce naukowej.\par
  \vspace{0.8cm}
  Zapewniam również, że niniejsza wersja rozprawy jest tożsama z załączoną wersją elektroniczną.\par
  \uw@ifEN{
  \vspace{0.9cm}
  Aware of the legal responsibility, I declare that this doctoral dissertation was completed independently and does not include any material acquired unlawfully.\par
  \vspace{0.8cm}
  I further declare that this dissertation has not been previously submitted as part of any procedure for the award of a doctoral degree at any other academic institution.\par
  \vspace{0.8cm}
  I also confirm that this version of the dissertation is identical to the attached electronic version.\par
  }
  \uw@signatureline{Data\uw@ifEN{ / Date}}{Podpis autora pracy\uw@ifEN{ / Signature of the Author}}
  \endgroup
}

\newcommand{\uw@keywordspage}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Słowa kluczowe\uw@ifEN{ / Keywords}}
  \uw@keywords\par
  \vspace{2cm}
  \uw@caseLang{
    {\noindent\bfseries Tytuł pracy w języku polskim / Title of the doctoral dissertation in Polish\par}
    \vspace{1.0cm}
    \uw@titlePL\par
  }{
    {\noindent\bfseries Tytuł pracy w języku angielskim\par}
    \vspace{1.0cm}
    \uw@titleEN\par
  }
  \endgroup
}

\newcommand{\uw@abstractpagePL}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Streszczenie w języku polskim\uw@ifEN{ / Abstract in Polish}}
  \uw@abstractPL\par
  \endgroup
}

\newcommand{\uw@abstractpageEN}{%
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Streszczenie w języku angielskim\uw@ifEN{ / Abstract in English}}
  \uw@abstractEN\par
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
  \uw@abstractpagePL
  \uw@abstractpageEN
  \clearpage
  \thispagestyle{plain}
  \begingroup\singlespacing
  \uw@frontheading{Spis treści\uw@ifEN{ / Table of Contents}}
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
