%vim: set ft=latex
%Author: Shen Zhou
%Date: 2015-09-18

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qftemplate}[25/01/2012, v1.0]
\LoadClass[a4paper,twoside]{article}
%\LoadClass[a4paper]{ctexart}

%\RequirePackage[T1]{fontenc}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=NOTECLASS, prefix=NOTECLASS@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{NOTECLASS}{#1}}

%---------------------------
%Math package
%---------------------------
\RequirePackage{amsmath, amsthm}

%---------------------------
%Color defination
%---------------------------

\RequirePackage[svgnames]{xcolor}

%\RequirePackage{color}

\definecolor{color1}{RGB}{0,0,90} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20} % Color of the boxes behind the abstract and headings


%---------------------------
%hyperlink
%---------------------------
\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,citecolor=color1,linkcolor=color1,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}
\RequirePackage[nameinlink]{cleveref}

%fix the problem about wrong process in psdextra
\appto{\psdmapshortnames}{\let\mu\textmugreek}

%---------------------------
%Declare Options
%---------------------------

\DeclareStringOption[zh]{lang}[zh]
\DeclareVoidOption{eng}{\ekv{lang = eng}}
\DeclareVoidOption{zh}{\ekv{lang = zh}}

\DeclareStringOption[margin]{mgn}[margin]
\DeclareVoidOption{margin}{\ekv{mgn = margin}}
\DeclareVoidOption{nomargin}{\ekv{mgn = nomargin}}

\ProcessKeyvalOptions*\relax
%---------------------------
%margin note and page style
%---------------------------

\ifdefstring{\NOTECLASS@mgn}{margin}{
\RequirePackage{marginnote}
%\RequirePackage[top=1.5cm, bottom=1.5cm, outer=5cm, inner=2cm, heightrounded, marginparwidth=2.5cm, marginparsep=2cm]{geometry}
\RequirePackage[top=3.5cm, bottom=3.5cm, outer=7cm, inner=2.5cm, heightrounded, marginparwidth=4.5cm, marginparsep=1.5cm]{geometry}
}{
\RequirePackage[top=3.5cm, bottom=3.5cm,outer=3cm, inner=4.5cm, heightrounded]{geometry}
}

% ------ Language --


\ifdefstring{\NOTECLASS@lang}{zh}{
%----------------------------------------------------------------------
%	Unicode
%----------------------------------------------------------------------
    \RequirePackage{ctex}
    \renewcommand{\contentsname}{目\hspace{1em}录}
    \renewcommand{\figurename}{图}
    \renewcommand{\abstractname}{摘\hspace{1em}要}
    \renewcommand{\tablename}{表}
    \renewcommand{\partname}{部分}
    \renewcommand{\listfigurename}{\bfseries 插图目录}
    \renewcommand{\listtablename}{\bfseries 表格目录}
%\renewcommand{\bibname}{\bfseries 参考文献}
    \renewcommand{\appendixname}{\bfseries 附\hspace{2em}录}
    \renewcommand{\indexname}{\bfseries 索\hspace{2em}引}
    \setlength{\parindent}{2em} 

    \renewcommand{\figureautorefname}{图}

    \crefformat{equation}{#2式(#1)#3}
    \crefformat{figure}{#2图#1#3}
    \crefformat{table}{#2表#1#3}
    \crefformat{section}{#2第#1章#3}
    \crefformat{subsection}{#2第#1节#3}
}{\relax}



%---------------------------
%section style
%---------------------------

\RequirePackage[center,pagestyles]{titlesec}
\ifdefstring{\NOTECLASS@lang}{zh}{
    \titleformat{\section}[hang]{\bfseries}
    {\hspace{-80pt}\makebox[70pt][r]{\bfseries\Large{\color{color1}\thesection}}}{10pt}{\bfseries\Large\filright}
    }{
    \titleformat{\section}[hang]{\bfseries}
    {\hspace{-80pt}\makebox[70pt][r]{\Large{\color{color1}\thesection}}}{10pt}{\Large\filright}
}
\titleformat{\subsection}[hang]{\bfseries}
{\hspace{-80pt}\makebox[70pt][r]{\large\color{color1}\thesubsection}}{10pt}{\large\filright}
\titleformat{\subsubsection}[hang]{\bfseries}
{\thesubsubsection}{7pt}{}


%----------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
\fancyhead[RO,LE]{\color{color1!80}\thepage}
\fancyhead[LO,RE]{}
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{1pt}% % No header rule
\newcommand{\headrulecolor}[1]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
\headrulecolor{color1!30}
\renewcommand{\footrulewidth}{0pt}% % No footer rule

\renewcommand{\@maketitle}{%
    {\raggedright\color{color1}\sffamily\fontsize{20}{25}\selectfont \@title\par}%
    \vskip10pt%
    {\raggedright\itshape\fontsize{12}{16}\selectfont  \@author\par}%
    \noindent\rule{\textwidth}{0.4mm}
}%

%---------------------------
%caption font
%---------------------------
\RequirePackage[labelfont={bf,sf,small},%
    labelsep=period,%
justification=raggedright]{caption}

%---------------------------
%useful package
%---------------------------
\RequirePackage{graphicx}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}
\RequirePackage{placeins}

%---------------------------
%question and answer
%---------------------------

\newtheorem{question}{问题}
\newtheorem{lemma}{引理}

\crefformat{question}{#2问题#1#3}
\crefname{lemma}{引理}{引理}
