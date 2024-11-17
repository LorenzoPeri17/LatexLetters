\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{responseletter}[2024/11/16 response letter style, lp586@cam.ac.uk]

%% Based on the eletter2 class
%% https://www.overleaf.com/latex/templates/ntu-eee-letterhead/qfxzzmxfpcnq

%%% Load the letter class
\DeclareOption*{\expandafter\PassOptionsToClass\expandafter{\CurrentOption}{letter}}
\ProcessOptions\relax
\LoadClass{letter}

%%% Load the required packages
\RequirePackage{graphicx}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumerate}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage[usenames]{xcolor}
\RequirePackage{xr}
\RequirePackage{nameref}
\RequirePackage{xr-hyper}
\RequirePackage{newfloat}
\RequirePackage{placeins}
\RequirePackage{caption}
\RequirePackage{cite}

%%% Define commands
\newif\ifCL@headerlogo\CL@headerlogofalse
\newcommand{\@headerlogo}{}
\newcommand{\headerlogo}[1]{\renewcommand{\@headerlogo}{#1}\CL@headerlogotrue}

\newcommand{\newref}[1]{\newpage{\Large\textbf{#1}}}
\newcommand{\referee}[1]{\textit{\color{blue}#1}\\*[1ex]}
\newcommand{\todo}[1]{\textbf{\color{magenta}#1}}

\newcommand*{\addFileDependency}[1]{
  \typeout{(#1)}
  \@addtofilelist{#1}
  \IfFileExists{#1}{}{\typeout{No file #1.}}
}
\newcommand*{\external}[2][]{
    \externaldocument[#1]{#2}
    \addFileDependency{#2.tex}
    \addFileDependency{#2.aux}
}

%%% Define environments
\DeclareFloatingEnvironment[fileext=lot]{table}
\DeclareFloatingEnvironment[fileext=lot]{figure}

\let\OGfigure\figure
\let\endOGfigure\endfigure
\renewenvironment{figure}
{\FloatBarrier\OGfigure[h!]\centering}
{\endOGfigure\FloatBarrier}

\let\OGtable\table
\let\endOGtable\endtable
\renewenvironment{table}
{\FloatBarrier\OGtable[h!]\centering}
{\endOGtable\FloatBarrier}

\newcommand{\refname}{References}
\newenvironment{thebibliography}[1]
     {\textbf{\Large\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}

%%% Style opening and closing
\renewcommand{\opening}[1]{\ifx\@empty\fromaddress
\thispagestyle{firstpage}%
{\raggedleft\@date\par}%
\else  % home address
\thispagestyle{empty}%
{\raggedleft%
\ifCL@headerlogo\@headerlogo\\*[1cm]%
\else%no header logo
\fi%
\begin{tabular}{l@{}}\ignorespaces%
\fromaddress\\*[1em]%
\@date \end{tabular}\par}%
\fi%
\vspace{-3\parskip}%
{\raggedright \toname \\ \toaddress \par}%
\vspace{1\parskip}%
#1\par\nobreak}

\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
 \stopbreaks
 \noindent
 \raggedright
 \ignorespaces #1\\[2\medskipamount]%
 \ifx\@empty\fromsig
 \fromname
 \else \fromsig \fi\strut%
\par}

%%% Style the geometry
\geometry{
    a4paper,
    total={210mm,297mm},
    headsep=0mm,
    textwidth=160mm,
    textheight=255mm,
    left=25mm,
    top=15mm,
    footskip=12mm
}

\setlength{\parindent}{0mm}
\setlength{\parskip}{5mm}

%% Set up hyperref
\hypersetup{
    colorlinks=true,
    urlcolor=blue,
    linkcolor=cyan,
    citecolor=cyan,
}

%% no labels for figures and tables
\captionsetup{labelformat=empty,font=footnotesize}