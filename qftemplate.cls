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
%Color defination
%---------------------------

\RequirePackage[svgnames]{xcolor}

%\RequirePackage{color}

\definecolor{color1}{RGB}{0,0,90} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20} % Color of the boxes behind the abstract and headings


%---------------------------
%hyperlink
%---------------------------
%\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\RequirePackage[unicode]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,citecolor=color1,linkcolor=color1,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}
\RequirePackage[nameinlink]{cleveref}

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
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers
\fancyhead[RO,LE]{\color{color1!80}\thepage}
\fancyhead[LO,RE]{}
%% Headers
%\fancyheadoffset{1cm}
%\lhead{}%
%\chead{}%
%\rhead{\color{color1!80}\thepage}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{1pt}% % No header rule
\newcommand{\headrulecolor}[1]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
\headrulecolor{color1!30}
\renewcommand{\footrulewidth}{0pt}% % No footer rule

\renewcommand{\@maketitle}{%
    {\raggedright\color{color1}\heiti\fontspec{Arial}\fontsize{20}{25}\selectfont \@title\par}%
    \vskip10pt%
%{\raggedright\color{color1}\it\fontsize{12}{16}\selectfont  \@author\par}%
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
%\RequirePackage{mymath}
\RequirePackage{placeins}
\RequirePackage{amsmath, amsthm}

%---------------------------
%question and answer
%---------------------------

\newtheorem{question}{问题}

%\RequirePackage{listings}
%\definecolor{mygreen}{rgb}{0,0.6,0}
%\definecolor{mygray}{rgb}{0.5,0.5,0.5}
%\definecolor{mymauve}{rgb}{0.58,0,0.82}

%\lstset{ %    
    %basicstyle=\ttfamily\footnotesize,        % the size of the fonts that are used for the code
    %breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
    %breaklines=true,                 % sets automatic line breaking
    %captionpos=b,                    % sets the caption-position to bottom
    %commentstyle=\color{mygreen},    % comment style
    %deletekeywords={...},            % if you want to delete keywords from the given language
    %escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
    %extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
    %frame=single,                    % adds a frame around the code
    %keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
    %keywordstyle=\color{blue},       % keyword style
    %language=Matlab,                 % the language of the code
    %morekeywords={*,...},            % if you want to add more keywords to the set
    %numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
    %numbersep=5pt,                   % how far the line-numbers are from the code
    %numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
    %rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
    %showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
    %showstringspaces=false,          % underline spaces within strings only
    %showtabs=false,                  % show tabs within strings adding particular underscores
    %stringstyle=\color{mymauve},     % string literal style
    %tabsize=2,                       % sets default tabsize to 2 spaces
    %title=\lstname                  % show the filename of files included with \lstinputlisting; also try caption instead of title
%}

%Elegantpar
\RequirePackage{tikz}
\definecolor{tcolor}{RGB}{90, 73, 121}
\definecolor{lcolor}{RGB}{96, 113, 191}
\definecolor{pcolor}{RGB}{240, 230, 240}
 
\newif\ifstartedinmathmode
\newcommand{\elegantpar}[2]{%
 \relax\ifmmode\startedinmathmodetrue\else\startedinmathmodefalse\fi
  %{\color{tcolor}\ifstartedinmathmode \ensuremath{\bm\langle #1 \bm\rangle}\else $\bm\langle$#1$\bm\rangle$\fi}%
  {\color{tcolor}\ifstartedinmathmode \ensuremath{#1}\else #1\fi}%
  \begin{tikzpicture}[remember picture, baseline=-0.75ex]%
    \node[coordinate] (inText) {};%
  \end{tikzpicture}%
  \marginnote{%
    \renewcommand{\baselinestretch}{1.0}%
    \begin{tikzpicture}[remember picture]%
      %\draw node[fill= pcolor, rounded corners,text width=\marginparwidth] (inNote){\footnotesize #2};%
      \draw node[fill= pcolor, text width=\marginparwidth] (inNote){\footnotesize #2};%
    \end{tikzpicture}%
    }%
  \begin{tikzpicture}[remember picture, overlay]%
    \draw[draw = lcolor, thick]
      ([yshift=-0.55em] inText)
        -| ([xshift=-3.55em] inNote.west)
        -| (inNote.west);%
  \end{tikzpicture}%
}
