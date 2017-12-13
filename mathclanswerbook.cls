%
% TODO:
%
%
%
%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mathclanswerbook}[2017/11/15]

\LoadClass{ctexbook}

\RequirePackage{geometry}

\RequirePackage{fancyhdr}

\RequirePackage{setspace}
%\singlespacing
%\onehalfspacing
%\doublespacing

\RequirePackage{needspace}

\RequirePackage{import}

\RequirePackage{versions}

\RequirePackage{verbatim}

\RequirePackage{xifthen}

\RequirePackage{amsmath,amssymb}
\RequirePackage{mathabx}
\RequirePackage{bm}

\RequirePackage{graphicx}

\RequirePackage{wrapfig}

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
    outer = 3cm,
    top = 3cm,
    bottom = 3cm,
    marginparsep = 5mm,
    marginparwidth = 2cm,
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
        %nameformat = \chapternameformat,
        number = \arabic{chapter},
        %aftername = {},
        %titleformat = \chaptertitleformat,
        %aftertitle = {},
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

% 大于等于 和 小于等于
\renewcommand\ge\geqslant
\renewcommand\geq\geqslant
\renewcommand\le\leqslant
\renewcommand\leq\leqslant

% 平行于
\renewcommand\parallel{\mathrel{/\mkern-5mu/}}
% pxfonts/txfonts 中有 \varparallel, fourier 中有 \parallelslant,
% 但是这两个宏包都用不了 (详细原因待研究). 这里的解决方案来自于:
% https://tex.stackexchange.com/questions/254574/typesetting-a-pair-of-slash-symbols-to-indicate-parallel-lines

% 空集
\renewcommand\emptyset\varnothing

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

% label
\newcommand\@mathcl@label{}
\newcommand{\MathclLabel}[1]{
    \renewcommand\@mathcl@label{#1}
}

% tag
\newcommand\@mathcl@tag{}
\newcommand{\MathclTag}[1]{
    \renewcommand\@mathcl@tag{#1}
}

% problem (with fig)
\newcommand\@mathcl@problem{}
\newcommand{\MathclProblem}[1]{
    \renewcommand\@mathcl@problem{#1}
}
\newcommand\@mathcl@problem@fig{}
\newcommand\@mathcl@problem@fig@width{}
\newcommand\@mathcl@problem@fig@height{}
\newcommand{\MathclProblemFig}[3]{
    \renewcommand\@mathcl@problem@fig{#1}
    \renewcommand\@mathcl@problem@fig@width{#2}
    \renewcommand\@mathcl@problem@fig@height{#3}
}
\newcommand\@mathcl@problem@fig@place{}
\newcommand{\MathclProblemFigPlace}[1]{
    \renewcommand\@mathcl@problem@fig@place{#1}
}

% topics
\newcommand\@mathcl@topics{}
\newcommand{\MathclTopics}[1]{
    \renewcommand\@mathcl@topics{#1}
}

% answer
\newcommand\@mathcl@answer{}
\newcommand{\MathclAnswer}[1]{
    \renewcommand\@mathcl@answer{#1}
}

% hint
\newcommand\@mathcl@hint{}
\newcommand{\MathclHint}[1]{
    \renewcommand\@mathcl@hint{#1}
}

% solution (with fig)
\newcommand\@mathcl@solution{}
\newcommand{\MathclSolution}[1]{
    \renewcommand\@mathcl@solution{#1}
}
\newcommand\@mathcl@solution@fig{}
\newcommand\@mathcl@solution@fig@width{}
\newcommand\@mathcl@solution@fig@height{}
\newcommand{\MathclSolutionFig}[3]{
    \renewcommand\@mathcl@solution@fig{#1}
    \renewcommand\@mathcl@solution@fig@width{#2}
    \renewcommand\@mathcl@solution@fig@height{#3}
}
\newcommand\@mathcl@solution@fig@place{}
\newcommand{\MathclSolutionFigPlace}[1]{
    \renewcommand\@mathcl@solution@fig@place{#1}
}

% note
\newcommand\@mathcl@note{}
\newcommand{\MathclNote}[1]{
    \renewcommand\@mathcl@note{#1}
}

% comment
\newcommand\@mathcl@comment{}
\newcommand{\MathclComment}[1]{
    \renewcommand\@mathcl@comment{#1}
}

% info
\newcommand\@mathcl@info{}
\newcommand{\MathclInfo}[1]{
    \renewcommand\@mathcl@info{#1}
}





% =====================================================================
% 处理文档选项
% =====================================================================


\newcommand\@mathcl@visibility{invisible}


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

\newcommand\@mathcltag@hint{\fangsong 【提示】}
\newcommand{\MathclTagHint}[1]{
    \renewcommand\@mathcltag@hint{#1}
}

\newcommand\@mathcltag@answer{\fangsong 【答案】}
\newcommand{\MathclTagAnswer}[1]{
    \renewcommand\@mathcltag@answer{#1}
}

\newcommand\@mathcltag@solution{\fangsong 【详解】}
\newcommand{\MathclTagSolution}[1]{
    \renewcommand\@mathcltag@solution{#1}
}

\newcommand\@mathcltag@note{\fangsong 【注记】}
\newcommand{\MathclTagNote}[1]{
    \renewcommand\@mathcltag@note{#1}
}

\newcommand\@mathcltag@comment{\fangsong 【评论】}
\newcommand{\MathclTagComment}[1]{
    \renewcommand\@mathcltag@comment{#1}
}

\newcommand\@mathcltag@info{\fangsong 【备注】}
\newcommand{\MathclTagInfo}[1]{
    \renewcommand\@mathcltag@info{#1}
}


\newenvironment{lecturenote}{
%\begin{tcolorbox}
%知识精讲和例题解析
%\end{tcolorbox}
}{\vfil}

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
\renewcommand{\@mathcl@exampletitle}{\@mathcl@tag}
\begin{examplebox}{\@mathcl@exampletitle}
% 题干
\ifthenelse{
    \equal{}{\@mathcl@problem@fig}
}{% THEN part, if there is no fig
    \@mathcl@problem
}{% ELSE part, if there is a fig
    \ifthenelse{
        \equal{center}{\@mathcl@problem@fig@place}
    }{% THEN part, if \@mathcl@problem@fig@place == center
        \@mathcl@problem
        \begin{center}
        \includegraphics[width=\@mathcl@problem@fig@width]{\@mathcl@problem@fig}
        \end{center}
    }{% ELSE part, if \@mathcl@problem@fig@place != center
        \begin{wrapfigure}{r}{\@mathcl@problem@fig@width}
        \includegraphics[width=\@mathcl@problem@fig@width]{\@mathcl@problem@fig}
        \end{wrapfigure}
        \@mathcl@problem
    }
}
%%%%%%%%%
\tcblower
%%%%%%%%%
% 提示 
\ifthenelse{\equal{}{\@mathcl@hint}   }{}{\@mathcltag@hint    \@mathcl@hint    \\}
% 答案
\ifthenelse{\equal{}{\@mathcl@answer} }{}{\@mathcltag@answer  \@mathcl@answer  \\}
% 详解
\ifthenelse{
    \equal{}{\@mathcl@solution@fig}
}{% THEN part, if there is no fig
    \@mathcltag@solution \@mathcl@solution
}{% ELSE part, if there is a fig
    \ifthenelse{
        \equal{center}{\@mathcl@solution@fig@place}
    }{% THEN part, if \@mathcl@solution@fig@place == center
        \@mathcltag@solution \@mathcl@solution
        \begin{center}
        \includegraphics[width=\@mathcl@solution@fig@width]{\@mathcl@solution@fig}
        \end{center}
    }{% ELSE part, if \@mathcl@solution@fig@place != center
        \begin{wrapfigure}{r}{\@mathcl@solution@fig@width}
        \includegraphics[width=\@mathcl@solution@fig@width]{\@mathcl@solution@fig}
        \end{wrapfigure}
        \@mathcltag@solution \@mathcl@solution
    }
}
% 注记
\ifthenelse{\equal{}{\@mathcl@note}   }{}{\\ \@mathcltag@note    \@mathcl@note   }
% 评论
\ifthenelse{\equal{}{\@mathcl@comment}}{}{\\ \@mathcltag@comment \@mathcl@comment}
% 备注
\ifthenelse{\equal{}{\@mathcl@info}   }{}{\\ \@mathcltag@info    \@mathcl@info   }
\end{examplebox}


% 清空相关信息
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
\begin{tcolorbox}
作业答案
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
% 答案
\ifthenelse{\equal{}{\@mathcl@answer}  }{}{\@mathcltag@answer \@mathcl@answer \\}
% 详解
\ifthenelse{
    \equal{}{\@mathcl@solution@fig}
}{% THEN part, if there is no fig
    \@mathcltag@solution \@mathcl@solution
}{% ELSE part, if there is a fig
    \ifthenelse{
        \equal{center}{\@mathcl@solution@fig@place}
    }{% THEN part, if \@mathcl@solution@fig@place == center
        \@mathcltag@solution \@mathcl@solution
        \begin{center}
        \includegraphics[width=\@mathcl@solution@fig@width]{\@mathcl@solution@fig}
        \end{center}
    }{% ELSE part, if \@mathcl@solution@fig@place != center
        \begin{wrapfigure}{r}{\@mathcl@solution@fig@width}
        \includegraphics[width=\@mathcl@solution@fig@width]{\@mathcl@solution@fig}
        \end{wrapfigure}
        \@mathcltag@solution \@mathcl@solution
    }
}
\end{exercisebox}

% 清空相关信息
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
测试答案
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
    %upperbox = \@mathcl@visibility,
    lower separated=false,
    lowerbox = \@mathcl@visibility,
    after = \vfil,
}



\newcommand{\MathclQuestion}[1]{
\begin{questionbox}{#1}{\@mathcl@tag}
% 答案
\ifthenelse{\equal{}{\@mathcl@answer}  }{}{\@mathcltag@answer \@mathcl@answer \\}
% 详解
\ifthenelse{
    \equal{}{\@mathcl@solution@fig}
}{% THEN part, if there is no fig
    \@mathcltag@solution \@mathcl@solution
}{% ELSE part, if there is a fig
    \ifthenelse{
        \equal{center}{\@mathcl@solution@fig@place}
    }{% THEN part, if \@mathcl@solution@fig@place == center
        \@mathcltag@solution \@mathcl@solution
        \begin{center}
        \includegraphics[width=\@mathcl@solution@fig@width]{\@mathcl@solution@fig}
        \end{center}
    }{% ELSE part, if \@mathcl@solution@fig@place != center
        \begin{wrapfigure}{r}{\@mathcl@solution@fig@width}
        \includegraphics[width=\@mathcl@solution@fig@width]{\@mathcl@solution@fig}
        \end{wrapfigure}
        \@mathcltag@solution \@mathcl@solution
    }
}
\end{questionbox}

% 清空相关信息
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







% =====================================================================
% 处理需要忽略的环境
% =====================================================================

\excludeversion{preamble}
\excludeversion{lecturenote}

