%
% TODO:
%
%
%
%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mathclprobook}[2017/08/15]

\LoadClass{ctexbook}

\RequirePackage{import}

\RequirePackage[showframe]{geometry}

\RequirePackage{fancyhdr}

\RequirePackage{setspace}
%\singlespacing
%\onehalfspacing
%\doublespacing

\RequirePackage{needspace}

\RequirePackage{versions}

\RequirePackage{verbatim}

\RequirePackage{xifthen}

\RequirePackage{graphicx}

\RequirePackage{color}

\RequirePackage{bclogo}

\RequirePackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
%\tcbuselibrary{documentation}

%\RequirePackage{wallpaper}
\RequirePackage{marginnote}

% -----------------------------------------------------------
% 解决 tikz (包括 tcolorbox) 中的 marginnote 在 xetex 编译下水平对齐位置不对的 bug. 解决方案来自于:
% https://tex.stackexchange.com/questions/269426/wrong-marginnote-positions-inside-a-tikzpicture-with-xelatex
% -----------------------------------------------------------
\def\pgfsys@hboxsynced#1{%
  {%
    \pgfsys@beginscope%
    \setbox\pgf@hbox=\hbox{%
      \hskip\pgf@pt@x%
      \raise\pgf@pt@y\hbox{%
        \pgf@pt@x=0pt%
        \pgf@pt@y=0pt%
        \special{pdf: content q}%
        \pgflowlevelsynccm% 
        \pgfsys@invoke{q -1 0 0 -1 0 0 cm}%
        \special{pdf: content -1 0 0 -1 0 0 cm q}% translate to original coordinate system
        \pgfsys@invoke{0 J [] 0 d}% reset line cap and dash
        \wd#1=0pt%
        \ht#1=0pt%
        \dp#1=0pt%
        \box#1%
        \pgfsys@invoke{n Q Q Q}%
      }%
      \hss%
    }%
    \wd\pgf@hbox=0pt%
    \ht\pgf@hbox=0pt%
    \dp\pgf@hbox=0pt%
    \pgfsys@hbox\pgf@hbox%
    \pgfsys@endscope%
  }%
}
% -----------------------------------------------------------

\RequirePackage{amsmath,amssymb}
\RequirePackage{mathabx}
\RequirePackage{bm}

\renewcommand\ge\geqslant
\renewcommand\le\leqslant




%% 所有文档类中通用的可能用到的各种宏

\newcommand\figurehere{{\color{red}\bf FIGURE HERE!}} % 图形的占位符

\newcommand\choice{(~~~~)} % 选择题的空

\newlength{\wid@cur}
\newlength{\wid@max}

\newlength{\wid@half}
\newlength{\wid@quat}

\newlength{\wid@chmark}\setlength{\wid@chmark}{2em}
\newcommand\ch@mark[1]{\makebox[\wid@chmark][l]{#1.~}}

\newlength{\wid@chtext}\setlength{\wid@chtext}{\wid@half}
\newcommand\ch@text[2]{
\makebox[\wid@chtext][l]{\ch@mark{#1}#2}
}

\newlength{\wid@chmargin}\setlength{\wid@chmargin}{1em}

%\newcommand\candidates[4]{\\A. #1\\B. #2\\C. #3\\D. #4\\} % 选择题的选项
\newcommand\candidates[4]{
\setlength{\wid@half}{0.5\textwidth}
\setlength{\wid@quat}{0.25\textwidth}

\settowidth{\wid@max}{#1}
\settowidth{\wid@cur}{#2}
\ifthenelse{\lengthtest{\wid@max < \wid@cur}}{\setlength{\wid@max}{\wid@cur}}{}
\settowidth{\wid@cur}{#3}
\ifthenelse{\lengthtest{\wid@max < \wid@cur}}{\setlength{\wid@max}{\wid@cur}}{}
\settowidth{\wid@cur}{#4}
\ifthenelse{\lengthtest{\wid@max < \wid@cur}}{\setlength{\wid@max}{\wid@cur}}{}

\addtolength{\wid@max}{\wid@chmark}
\addtolength{\wid@max}{\wid@chmargin}

\begin{flushleft}
\ifthenelse{\lengthtest{\wid@max > \wid@half}}{
\hangafter 1
\hangindent\wid@chmark
\ch@mark{A}#1\\
\ch@mark{B}#2\\
\ch@mark{C}#3\\
\ch@mark{D}#4
}{
\ifthenelse{
    \lengthtest{\wid@max < \wid@quat}
}{
    \setlength{\wid@chtext}{\wid@quat}
}{
    \setlength{\wid@chtext}{\wid@half}
}
\addtolength{\wid@chtext}{-\wid@chmargin}
\ch@text{A}{#1}
\ch@text{B}{#2}
\ch@text{C}{#3}
\ch@text{D}{#4}
}
\end{flushleft}

} % 选择题的选项

\newcommand\blank{\underline{\hspace{2cm}}} % 填空题的空





%% 文档选项
%\newif\if@probook   \@probookfalse   % problem book
%\DeclareOption{probook}{\@probooktrue}
%\ProcessOptions

%% 页面几何设置
\geometry{
    bindingoffset = 10mm, % 装订线
    inner = 10mm,
    outer = 62mm,
    top    = 17mm,
    bottom = 17mm,
    headheight = 10mm,
    headsep  = 2mm,
    footskip = 2mm,
    marginparsep   = 2mm,
    marginparwidth = 50mm,
}

%% 页眉和页脚设置
\renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \pagestyle{empty}
}
\renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \pagenumbering{arabic}
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \fancyhead[LE]{%
        \begin{tikzpicture}[remember picture,overlay]
        \fill[blue!20] (current page.north west) -- (current page.north east) -- ++ (0, -1.5) -| cycle;
        \fill[blue!20] (current page.south west) -- (current page.south east) -- ++ (0,  1.5) -| cycle;
        \draw[anchor=base] (current page.north west) ++ (1.5,-1)
        node(pageno) {\bfseries\thepage};
        \draw[anchor=base west] (pageno.base east)
        node (chapmark) {\bfseries 高思数学/竞赛体系/题库};
        \end{tikzpicture}
    }
    \fancyhead[RO]{%
        \begin{tikzpicture}[remember picture,overlay]
        \fill[blue!20] (current page.north west) -- (current page.north east) -- ++ (0, -1.5) -| cycle;
        \fill[blue!20] (current page.south west) -- (current page.south east) -- ++ (0,  1.5) -| cycle;
        \draw[anchor=base] (current page.north east) ++ (-1.5,-1) node
        (pageno) {\bfseries\thepage};
        \draw[anchor=base east] (pageno.base west)
        node (chapmark) {\bfseries\leftmark};
        \end{tikzpicture}
    }
    \pagestyle{fancy}
}

%% 重新定义目录样式
\renewcommand\tableofcontents{%
    \begin{tcolorbox}[title=\contentsname,
        halign title=center,
        fonttitle=\bfseries\Huge]
        \large\@starttoc{toc}
    \end{tcolorbox}
    \cleardoublepage
}


%% 设置行距
\singlespacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 定义文档中的各种结构块的环境 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\newcommand\@answertag{\small\fangsong 【答案和解析】}

\begin{comment}
% [examplebox] 例题盒子
\newtcolorbox{problembox}{%
    enhanced jigsaw,
    %blanker,
    colframe=blue!80!black,
    %colbacktitle=blue!80!black,
    %colback=blue!10,
    opacityback=0,
    fonttitle=\bfseries,
    %before upper = \setlength{\parskip}{0.5\baselineskip},
    %after upper = \singlespacing,
    %lower separated=false,
    %before lower = \@answertag\\,
    %after lower = \vspace{1cm},
    %after = \vfil,
}
\end{comment}



\newcommand\@mathcl@repodir{/Users/cl/Documents/xyz/problems/}
\newcommand{\MathclRepoDir}[1]{\renewcommand\@mathcl@repodir{#1}}
\graphicspath{{\@mathcl@repodir}}

\newcommand\@mathcl@label{}
\newcommand\@mathcl@tag{}
\newcommand\@mathcl@problem{}
\newcommand\@mathcl@topics{}
\newcommand\@mathcl@answer{}
\newcommand\@mathcl@hint{}
\newcommand\@mathcl@solution{}
\newcommand\@mathcl@note{}
\newcommand\@mathcl@comment{}
\newcommand\@mathcl@info{}

\newcommand{\MathclLabel}[1]{    \renewcommand\@mathcl@label{#1}    }
\newcommand{\MathclTag}[1]{      \renewcommand\@mathcl@tag{#1}      }
\newcommand{\MathclProblem}[1]{  \renewcommand\@mathcl@problem{#1}  }
\newcommand{\MathclTopics}[1]{   \renewcommand\@mathcl@topics{#1}   }
\newcommand{\MathclAnswer}[1]{   \renewcommand\@mathcl@answer{#1}   }
\newcommand{\MathclHint}[1]{     \renewcommand\@mathcl@hint{#1}     }
\newcommand{\MathclSolution}[1]{ \renewcommand\@mathcl@solution{#1} }
\newcommand{\MathclNote}[1]{     \renewcommand\@mathcl@note{#1}     }
\newcommand{\MathclComment}[1]{  \renewcommand\@mathcl@comment{#1}  }
\newcommand{\MathclInfo}[1]{     \renewcommand\@mathcl@info{#1}     }


\newlength\@mathcl@fig@vshift
\setlength{\@mathcl@fig@vshift}{0pt}

\newcommand{\MathclFigVshift}[1]{\setlength{\@mathcl@fig@vshift}{#1}}
\newcommand{\MathclFigVshiftReset}{\setlength{\@mathcl@fig@vshift}{0pt}}
\newcommand{\MathclFigPlace}[1]{\marginnote{#1}[\@mathcl@fig@vshift]}
%\let\MathclFigPlace\marginnote
\newcommand{\MathclFigFile}[2][]{\includegraphics[width=\marginparwidth]{#2}\label{fig:#1}}
\newcommand{\MathclFigTikz}[2][]{\input{#2}\label{fig:#1}}


\newcommand{\MathclUseProblem}[1]{
\import{\@mathcl@repodir}{#1}
\begin{tcolorbox}[
    title = {\fbox{\texttt\@mathcl@label} \hfill {\small\textsf\@mathcl@topics}},
    %lowerbox = invisible,
]
{\fangsong 【\@mathcl@tag】} \\
\@mathcl@problem \par
\tcblower
{\fangsong 【提示】} \@mathcl@hint \\
{\fangsong 【答案】} \@mathcl@answer \\
{\fangsong 【解析】} \@mathcl@solution
\end{tcolorbox}
\@mathcl@note
\@mathcl@comment
\@mathcl@info
\setlength{\@mathcl@fig@vshift}{0pt}
}








