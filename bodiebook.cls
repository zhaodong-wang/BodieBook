%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX BOOK Template
%% Template by Wd, <wd20060220@gmail.com>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{bodiebook}[2014/11/16 v1.0 Tsinghua University Wd]

\LoadClass[10.5pt,fancyhdr,openany,a4paper]{book}
\RequirePackage{etex}

%=============================== Fonts ==========================================%
%=================================================================================%

\RequirePackage{amsfonts}
%\RequirePackage[utf8]{inputenc}
\RequirePackage{kpfonts}
\RequirePackage{fontspec,unicode-math}

\setmainfont[Ligatures=TeX]{Times New Roman}
\setmathfont[Ligatures=TeX]{xits-math.otf}

%Font size customize
\newcommand{\fontsizec}[1]{\fontsize{#1}{\baselineskip}\selectfont}

%\RequirePackage{times,txfonts}  %times new roman

%=============================== Math ============================================%
%=================================================================================%

\RequirePackage{amsmath,amsthm}
%\RequirePackage[mathstyleoff]{breqn}% a math package

%=============================== Page Layout =====================================%
%=================================================================================%

\RequirePackage{geometry}
\RequirePackage{multicol}
\RequirePackage[newparttoc]{titlesec}
\RequirePackage{titletoc,shorttoc} %style of titles and table of contents
\RequirePackage{fancyhdr} %header and footer
\RequirePackage{indentfirst}

%=============================== Floating Objects ================================%
%=================================================================================%

\RequirePackage{makecell,array} % tables
\RequirePackage{graphicx,multirow,bm,subfig,picinpar}% figures
\RequirePackage[figuresright]{rotating}
\RequirePackage{longtable,multirow}
\RequirePackage{supertabular}
\RequirePackage[online]{threeparttable}
\RequirePackage{booktabs,dcolumn,tabu}% three lines table
\RequirePackage{tikz}%drawing figures
\newcolumntype{,}{D{,}{}{-1}}
\newcolumntype{.}{D{.}{.}{-1}}
\def\hed#1{\multicolumn{1}{c}{#1}}
\def\mur#1{\multirow{1}{*}{#1}}
\let\tmp\newinsert
\let\newinsert\newbox
\RequirePackage{caption,floatrow,calc}
\let\newinsert\tmp

%=============================== Other Settings ==================================%
%=================================================================================%
\definecolor{darkblue}{HTML}{005C8E}

\RequirePackage{ifthen}%logitic judgements
\RequirePackage{enumitem}
\RequirePackage{indentfirst,lettrine}%indent first, lettrine effect
\RequirePackage{natbib}
\RequirePackage[nottoc]{tocbibind}%add references into toc
\RequirePackage[pdfstartview=FitH,
                CJKbookmarks=true,
                bookmarksdepth=3,
                bookmarksnumbered=true,
                bookmarksopen=true,
                colorlinks,
                pdfborder=001,   %color borders
                linkcolor=black,
                anchorcolor=black,
                citecolor=darkblue]{hyperref} %bookmarks

%============ Basic Layout Settings (themes and colors) ==========================%
%=================================================================================%

% loads a color scheme
\newcommand*{\wdtexbookcolor}[1]{
  \RequirePackage{wdtexbookcolor#1}}

% loads a style scheme
\newcommand*{\wdtexbooktheme}[1]{
  \RequirePackage{wdtexbooktheme#1}}


%=========================== Refernce Settings====================================%
%=================================================================================%

%\makeatletter
%\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa , #2\fi}]}}
%\makeatother

%======================= Table and Figure Settings================================%
%=================================================================================%

\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}}
\makeatletter
\newenvironment{tablehere}
  {\def\@captype{table}}
 {}

\newenvironment{figurehere}
 {\def\@captype{figure}}
 {}
\makeatother%tablehere environment

%Units in header
\def\tabunit#1{\llap{\lower \belowcaptionskip \hbox{#1} \hspace{.03\textwidth}}}


%=================== Enumerates Environment Settings==============================%
%=================================================================================%
\setenumerate{label={\rm \arabic*.},leftmargin=0pt,labelindent=\parindent,labelsep=*,itemindent=1.75\parindent}
\setitemize{leftmargin=0pt,labelindent=\parindent,labelsep=*,itemindent=1.5\parindent}


%====================== Other Predefinitions======================================%
%=================================================================================%
\def\Wd{\hbox{$\mathcal W\kern-.1em\lower.5ex\hbox{$\mathcal D$}$}}
\def\wv{\ensuremath{\scriptsize{\sim}}}
\newcommand{\grad}{\ensuremath{^{\circ}}}%degree
%Roman numbers
\makeatletter
\newcommand{\rmnum}[1]{\romannumeral #1}
\newcommand{\Rmnum}[1]{\expandafter\@slowromancap\romannumeral #1@}
\makeatother

\RequirePackage{lipsum}

\newcommand{\switchgeometry}{
  \newgeometry{left=1in,
             right=2.3346in,
             top=1in,
             bottom=1in,
             headsep=1cm,
             marginparwidth=85pt,
             marginparsep=11pt}

\fancypagestyle{plain}{%
    \fancyhf{} % clear all header and footer fields
    \fancyfootoffset[OR]{\dimexpr\marginparsep+\marginparwidth\relax}
    \fancyfootoffset[EL]{\dimexpr\marginparsep+\marginparwidth\relax}
    \fancyfoot[RO]{\small{\geofont\bfseries\color{black}\thepage}}
    \fancyfoot[LE]{\small{\geofont\bfseries\color{black}\thepage}}
}
}

\newcommand{\wdstartdoc}{
\addtocontents{toc}{\protect\begin{multicols}{2}}
\setcounter{page}{1}
\renewcommand{\thepage}{\arabic{page}}
}

\newcommand{\wdenddoc}{
\addtocontents{toc}{\protect\end{multicols}}
}

\endinput
