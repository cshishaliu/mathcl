%
% TODO:
%
%
%
%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mathcllecnote}[2017/08/15]

\LoadClass{ctexbook}

\RequirePackage{geometry}

\RequirePackage{fancyhdr}

\RequirePackage{setspace}
%\singlespacing
%\onehalfspacing
%\doublespacing

\RequirePackage{needspace}

\RequirePackage{versions}

\RequirePackage{verbatim}

\RequirePackage{xifthen}

\RequirePackage{amsmath,amssymb}
\RequirePackage{mathabx}
\RequirePackage{bm}

\RequirePackage{graphicx}

\RequirePackage{color}

\RequirePackage{bclogo}

\RequirePackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}

%\RequirePackage{wallpaper}
\RequirePackage{marginnote}

% =====================================================================
% 解决 tikz (包括 tcolorbox) 中的 marginnote 在 xetex 编译下水平对齐位置不对的 bug. 解决方案来自于:
% https://tex.stackexchange.com/questions/269426/wrong-marginnote-positions-inside-a-tikzpicture-with-xelatex
% =====================================================================
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

% =====================================================================
% 页面设置
% =====================================================================

% ---------------------------------------------------------
% 页面尺寸
% ---------------------------------------------------------
\geometry{
    bindingoffset = 1cm, % 装订线
    inner = 2cm,
    outer = 6cm,
    top = 3cm,
    bottom = 3cm,
    marginparsep = 1cm,
    marginparwidth = 4cm,
}

% ---------------------------------------------------------
% 页眉和页脚
% ---------------------------------------------------------
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
        \fill[blue!20] (current page.north west) -- (current page.north east) -- ++ (0, -2) -| cycle;
        \fill[blue!20] (current page.south west) -- (current page.south east) -- ++ (0, 2) -| cycle;
        \draw[anchor=base] (current page.north west) ++ (2,-1.5)
        node(pageno) {\bfseries\thepage};
        \draw[anchor=base west] (pageno.base east)
        node (chapmark) {\bfseries 高思数学/竞赛体系/\@mathcl@grade\@mathcl@subject\@mathcl@class/\@mathcl@year\@mathcl@term};
        \end{tikzpicture}
    }
    \fancyhead[RO]{%
        \begin{tikzpicture}[remember picture,overlay]
        \fill[blue!20] (current page.north west) -- (current page.north east) -- ++ (0, -2) -| cycle;
        \fill[blue!20] (current page.south west) -- (current page.south east) -- ++ (0, 2) -| cycle;
        \draw[anchor=base] (current page.north east) ++ (-2,-1.5) node
        (pageno) {\bfseries\thepage};
        \draw[anchor=base east] (pageno.base west)
        node (chapmark) {\bfseries\leftmark};
        \end{tikzpicture}
    }
    \pagestyle{fancy}
}

% ---------------------------------------------------------
% 定义目录样式
% ---------------------------------------------------------
\renewcommand\tableofcontents{%
    \begin{tcolorbox}[title=\contentsname,
        halign title=center,
        fonttitle=\bfseries\Huge]
        \large\@starttoc{toc}
    \end{tcolorbox}
    \cleardoublepage
}


% ---------------------------------------------------------
% 重新定义章节标题样式
% ---------------------------------------------------------
\ctexset{
    chapter={
        pagestyle = fancy,
        name = {第,讲},
        number = \arabic{chapter},
    },
}

\ctexset{
    chapter={
        pagestyle = fancy,
        name = {第,讲},
        nameformat = \chapternameformat,
        number = \arabic{chapter},
        aftername = {},
        titleformat = \chaptertitleformat,
        aftertitle = {},
    },
    subsection={
        format = \raggedright\normalsize\kaishu,
        %titleformat = \subsectitleformat,
    }
}
\newcommand\chapternameformat[1]{
    \rightline{%
        \tcbox[enhanced,
        rotate=-15,
        colframe = blue!50,
        coltext = blue!60,
        colback = white,
        squeezed title= \@mathcl@year~\@mathcl@term/\@mathcl@grade,
        fonttitle = \normalsize\fangsong,
        fontupper = \Large\kaishu,
        ]{#1}
    }
}
\newcommand\chaptertitleformat[1]{%
    \begin{tcolorbox}[beamer,
        halign = flush center,
        coltext = white,
        colback = blue!50,
        ]%
        #1
    \end{tcolorbox}
}




% =====================================================================
% 所有文档类中通用的可能用到的各种宏
% =====================================================================

% 重新定义使用的“大于等于”和“小于等于”符号
\renewcommand\ge\geqslant
\renewcommand\le\leqslant

% ---------------------------------------------------------
% 讲义信息
% ---------------------------------------------------------
\newcommand\@mathcl@grade{高一}   % 年级
\newcommand\@mathcl@subject{数学} % 科目
\newcommand\@mathcl@class{联赛班} % 班型
\newcommand\@mathcl@year{2017}    % 年份
\newcommand\@mathcl@term{暑假}    % 学期 (暑秋寒春)

\newcommand\setgrade[1]{\renewcommand\@mathcl@grade{#1}}
\newcommand\setsubject[1]{\renewcommand\@mathcl@subject{#1}}
\newcommand\setclass[1]{\renewcommand\@mathcl@class{#1}}
\newcommand\setyear[1]{\renewcommand\@mathcl@year{#1}}
\newcommand\setterm[1]{\renewcommand\@mathcl@term{#1}}
\newcommand\setinfo[5]{
    \renewcommand\@mathcl@grade{#1}
    \renewcommand\@mathcl@subject{#2}
    \renewcommand\@mathcl@class{#3}
    \renewcommand\@mathcl@year{#4}
    \renewcommand\@mathcl@term{#5}
}

% ---------------------------------------------------------
% 选择题的选项
% ---------------------------------------------------------
\newlength{\wid@cur}
\newlength{\wid@max}

\newlength{\wid@half}
\newlength{\wid@quat}

\newlength{\wid@chmark}\setlength{\wid@chmark}{2em}

\newcommand\ch@mark[1]{\makebox[\wid@chmark][l]{#1.~}}

\newlength{\wid@chtext}\setlength{\wid@chtext}{\wid@half}

\newcommand\ch@text[2]{\makebox[\wid@chtext][l]{\ch@mark{#1}#2}}

\newlength{\wid@chmargin}\setlength{\wid@chmargin}{1em}

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
\ifthenelse{ \lengthtest{\wid@max < \wid@quat}
}{ \setlength{\wid@chtext}{\wid@quat}
}{ \setlength{\wid@chtext}{\wid@half}
}
\addtolength{\wid@chtext}{-\wid@chmargin}
\ch@text{A}{#1}
\ch@text{B}{#2}
\ch@text{C}{#3}
\ch@text{D}{#4}
}
\end{flushleft}

}

% 选择题的空
\newcommand\choice{(~~~~)}

% 填空题的空
\newcommand\blank{\underline{\hspace{2cm}}}

% 图形的占位符
\newcommand\figurehere{{\color{red}\bfseries FIGURE HERE!}}


% ---------------------------------------------------------
% 题目信息
% ---------------------------------------------------------

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
\newcommand{\MathclFigFile}[2][]{\includegraphics[width=\marginparwidth]{#2}\label{fig:#1}}
\newcommand{\MathclFigTikz}[2][]{\input{#2}\label{fig:#1}}




% =====================================================================
% 处理文档选项
% =====================================================================
\newif\if@student \@studentfalse

\DeclareOption{teacher}{}
\DeclareOption{student}{\@studenttrue}
\ProcessOptions






\newcommand\@mathcl@visibility{visible}

\if@student
\renewcommand\@mathcl@visibility{invisible}
\fi


% =====================================================================
% 定义文档中的各种结构块的环境
% =====================================================================

\newenvironment{preamble}{}{\vfil}

% ---------------------------------------------------------
% 例题的环境和命令
% [env] lecturenote 讲义例题章节
% [env] knode       知识点
% [env] examplebox  例题盒子
% [cmd] \MathclExample
% [cmd] \MathclUseAsExample
% ---------------------------------------------------------

\newenvironment{lecturenote}{
%\begin{tcolorbox}
%知识精讲和例题解析
%\end{tcolorbox}
}{\vfill}

\newcommand{\knodetitle}[1]{
\needspace{0.3\textheight}
\tcbox[beamer, halign = flush center, coltext = white, colback = blue!50]{\bcetoile~\bfseries#1}
}

\newenvironment{knode}[1]{
\ifthenelse{\isempty{#1}}{}{\knodetitle{#1}}
}{\vfil}

\newcommand{\@mathcl@exampletitle}{}
\newcounter{cnt@example}[chapter]
\newtcolorbox[
    use counter = cnt@example,
]{examplebox}[2][]{%
    enhanced jigsaw,
    blanker,
    %colframe = blue!80!black,
    colbacktitle=blue!80!black,
    %colback=blue!10,
    opacityback = 0,
    coltitle = blue!80!black,
    fonttitle = \bfseries,
    title = {\bccrayon~例~\thetcbcounter:~#2},
    #1,
    before upper = \setlength{\parskip}{0.1\baselineskip},
    after upper = \singlespacing,
    lower separated=false,
    before lower = \small,
    lowerbox = \@mathcl@visibility,
    after = \vfil,
}


\newcommand{\MathclExample}{
\if@student
\renewcommand{\@mathcl@exampletitle}{\@mathcl@tag}
\else % 教师版要显示题目编号 (problem label)
\renewcommand{\@mathcl@exampletitle}{\@mathcl@tag \hfill {\texttt\@mathcl@label}}
\fi
\begin{examplebox}{\@mathcl@exampletitle}
\@mathcl@problem % 题干
\tcblower
\ifthenelse{\equal{}{\@mathcl@hint}    }{}{{\fangsong 【提示】}\@mathcl@hint  \\}
\ifthenelse{\equal{}{\@mathcl@answer}  }{}{{\fangsong 【答案】}\@mathcl@answer\\}
{\fangsong 【解析】}\@mathcl@solution
\ifthenelse{\equal{}{\@mathcl@note}    }{}{\\{\fangsong 【注记】}\@mathcl@note   }
\ifthenelse{\equal{}{\@mathcl@comment} }{}{\\{\fangsong 【评论】}\@mathcl@comment}
\ifthenelse{\equal{}{\@mathcl@info}    }{}{\\{\fangsong 【信息】}\@mathcl@info   }
\end{examplebox}


% 清空相关信息

\setlength{\@mathcl@fig@vshift}{0pt}

\MathclLabel{}
\MathclTag{}
\MathclProblem{\bfseries\color{red} 当前没有题干！！！！！}
\MathclTopics{}
\MathclAnswer{}
\MathclHint{}
\MathclSolution{}
\MathclNote{}
\MathclComment{}
\MathclInfo{}
}

\newcommand{\MathclUseAsExample}[1]{\import{\@mathcl@repodir}{#1} \MathclExample}


% ---------------------------------------------------------
% 作业题的环境和命令
% [env] homework    作业章节
% [env] exercisebox 作业题盒子
% [cmd] \MathclExercise
% [cmd] \MathclUseAsExercise
% ---------------------------------------------------------

\newenvironment{homework}{%
\clearpage%
\begin{tcolorbox}
作业
\end{tcolorbox}
}{\vfill}

\newcounter{cnt@exercise}[chapter]
\newtcolorbox[
    use counter = cnt@exercise,
]{exercisebox}[2][]{%
    enhanced jigsaw,
    colframe = white,
    opacityback = 0,
    lower separated = false,
    before upper = {\thetcbcounter.~\ifthenelse{\equal{}{#2}}{}{(#2)~}},
    #1,
    %before lower = \@answertag\\,
    lowerbox = \@mathcl@visibility,
    %after lower = \vspace{1cm},
    after = \vfil,
}

\newcommand{\MathclExercise}{
\begin{exercisebox}{\@mathcl@tag}
% 教师版要显示题目编号 (problem label)
\if@student
\else
\marginnote{\texttt\@mathcl@label}
\fi
\@mathcl@problem % 题干
\ifthenelse{\equal{}{\@mathcl@hint}    }{}{\\ {\fangsong 【提示】}\@mathcl@hint}
\tcblower
\ifthenelse{\equal{}{\@mathcl@answer}  }{}{{\fangsong 【答案】}\@mathcl@answer \\}
{\fangsong 【解析】}\@mathcl@solution
\end{exercisebox}

% 清空相关信息
\setlength{\@mathcl@fig@vshift}{0pt}

\MathclLabel{}
\MathclTag{}
\MathclProblem{\bfseries\color{red} 当前没有题干！！！！！}
\MathclTopics{}
\MathclAnswer{}
\MathclHint{}
\MathclSolution{}
\MathclNote{}
\MathclComment{}
\MathclInfo{}
}

\newcommand{\MathclUseAsExercise}[1]{\import{\@mathcl@repodir}{#1} \MathclExercise}




% ---------------------------------------------------------
% 测试题的环境和命令
% [env] classtest   测试题章节
% [env] questionbox 测试题盒子
% [cmd] \MathclQuestion
% [cmd] \MathclUseAsQuestion
% ---------------------------------------------------------

\newenvironment{classtest}{%
\clearpage%
\begin{tcolorbox}
\if@student
本节笔记
\else
测试
\fi
\end{tcolorbox}
}{\vfill}

\newcounter{cnt@question}[chapter]
\newtcolorbox[
    use counter = cnt@question,
]{questionbox}[3][]{%
    enhanced jigsaw,
    colframe = white,
    opacityback = 0,
    before upper = {\thetcbcounter.~({#2}~分\ifthenelse{\equal{}{#3}}{}{,~#3})},
    #1,
    upperbox = \@mathcl@visibility,
    lower separated=false,
    lowerbox = \@mathcl@visibility,
    after = \vfil,
}



\newcommand{\MathclQuestion}[1]{
\begin{questionbox}{#1}{\@mathcl@tag}
% 教师版要显示题目编号 (problem label)
\if@student
\else
\marginnote{\texttt\@mathcl@label}
\fi
\@mathcl@problem % 题干
\ifthenelse{\equal{}{\@mathcl@hint}    }{}{\\ {\fangsong 【提示】}\@mathcl@hint}
\tcblower
\ifthenelse{\equal{}{\@mathcl@answer}  }{}{{\fangsong 【答案】}\@mathcl@answer \\}
{\fangsong 【解析】}\@mathcl@solution
\end{questionbox}

% 清空相关信息
\setlength{\@mathcl@fig@vshift}{0pt}

\MathclLabel{}
\MathclTag{}
\MathclProblem{\bfseries\color{red} 当前没有题干！！！！！}
\MathclTopics{}
\MathclAnswer{}
\MathclHint{}
\MathclSolution{}
\MathclNote{}
\MathclComment{}
\MathclInfo{}
}

\newcommand{\MathclUseAsQuestion}[2]{\import{\@mathcl@repodir}{#2} \MathclQuestion{#1}}

% ---------------------------------------------------------
% 考试讲次的环境和命令
% [env] examination     考试讲次环境
% [env] sectionC        选择题部分
% [env] sectionB        填空题部分
% [env] sectionF        解答题部分
% [env] examquestionbox 考试题盒子
% [cmd] \MathclExamQuestion
% [cmd] \MathclUseAsExamQuestion
% ---------------------------------------------------------

\newenvironment{examination}{}{}

