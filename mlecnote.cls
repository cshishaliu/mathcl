%
% TODO:
%
%
%
%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mlecnote}[2017/12/03]

\LoadClass{ctexbook}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{setspace}
\RequirePackage{needspace}

\RequirePackage{import}
\RequirePackage{versions}
%\RequirePackage{verbatim}
\RequirePackage{xifthen}
\RequirePackage{keycommand}

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
% 处理文档选项
% =====================================================================
\newif\if@teacher@    \@teacher@true
\newif\if@lecnote@    \@lecnote@true
\newif\if@homework@   \@homework@false
\newif\if@classtest@  \@classtest@false
\newif\if@answerbook@ \@answerbook@false

\DeclareOption{teacher}{% This is the DEFAULT option.
%\@teacher@true
%\@lecnote@true
%\@homework@false
%\@classtest@false
%\@answerbook@false
}

\DeclareOption{student}{
\@teacher@false
%\@lecnote@true
%\@homework@false
%\@classtest@false
%\@answerbook@false
}

\DeclareOption{homework}{
\@teacher@false
\@lecnote@false
\@homework@true
%\@classtest@false
%\@answerbook@false
}

\DeclareOption{classtest}{
\@teacher@false
\@lecnote@false
%\@homework@false
\@classtest@true
%\@answerbook@false
}

\DeclareOption{answerbook}{
%\@teacher@true
\@lecnote@false
%\@homework@false
%\@classtest@false
\@answerbook@true
}

\ProcessOptions



% =====================================================================
% 页面设置
% =====================================================================

% ---------------------------------------------------------
% 页面尺寸
% ---------------------------------------------------------
\if@lecnote@
\geometry{
    bindingoffset = 1cm, % 装订线
    inner = 2cm,
    outer = 3cm,
    top = 3cm,
    bottom = 3cm,
    marginparsep = 0.3cm,
    marginparwidth = 2cm,
}
\fi

\if@homework@
\geometry{
    bindingoffset = 0cm,
    inner = 3cm,
    outer = 3cm,
    top = 3cm,
    bottom = 3cm,
    marginparsep = 0.3cm,
    marginparwidth = 2cm,
}
\fi

\if@classtest@
\geometry{
    bindingoffset = 0cm,
    inner = 2cm,
    outer = 2cm,
    top = 2cm,
    bottom = 2cm,
    marginparsep = 0.5cm,
    marginparwidth = 1cm,
}
\fi

\if@answerbook@
\geometry{
    bindingoffset = 0cm,
    inner = 2cm,
    outer = 2cm,
    top = 2cm,
    bottom = 2cm,
    marginparsep = 0.5cm,
    marginparwidth = 1cm,
}
\fi

% ---------------------------------------------------------
% 页眉和页脚 TODO: 待完善
% ---------------------------------------------------------
\newcommand\@lhead@odd{}
\newcommand\@rhead@odd{}
\newcommand\@lfoot@odd{}
\newcommand\@rfoot@odd{}
\newcommand\@lhead@even{}
\newcommand\@rhead@even{}
\newcommand\@lfoot@even{}
\newcommand\@rfoot@even{}

\fancypagestyle{lecnote}{%
\fancyhf{}
\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{0pt}
\pagenumbering{arabic}
\fancyhead[LE]{%
    \begin{tikzpicture}[remember picture,overlay]
    \fill[blue!20] (current page.north west) -- (current page.north east) -- ++ (0, -2) -| cycle;
    \fill[blue!20] (current page.south west) -- (current page.south east) -- ++ (0, 2) -| cycle;
    \draw[anchor=base] (current page.north west) ++ (2,-1.5)
    node(pageno) {\bfseries\thepage};
    \draw[anchor=base west] (pageno.base east)
    node (chapmark) {\bfseries \@lninfo@brand/\@lninfo@catalog/\@lninfo@grade\@lninfo@subject\@lninfo@class/\@lninfo@year\@lninfo@term};
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
}

\fancypagestyle{homework}{}

\fancypagestyle{classtest}{}

\fancypagestyle{answerbook}{}

\renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \pagestyle{empty}
}
\renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \pagestyle{lecnote}
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
        name = {第,讲},
        number = \arabic{chapter},
    },
}

\ctexset{
    chapter={
        %pagestyle = lecnote,
        nameformat = \chapternameformat,
        aftername = {},
        titleformat = \chaptertitleformat,
        aftertitle = {},
    },
}
\newcommand\chapternameformat[1]{
    \rightline{%
        \tcbox[enhanced,
        rotate=-15,
        colframe = blue!50,
        coltext = blue!60,
        colback = white,
        squeezed title= \@lninfo@year~\@lninfo@term/\@lninfo@grade,
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

% 大于等于 (“≥”) 和 小于等于 (“≤”)
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
\newcommand\@lninfo@brand{高思数学} % 品牌
\newcommand\@lninfo@catalog{竞赛体系} % 体系类别
\newcommand\@lninfo@grade{高一} % 年级
\newcommand\@lninfo@subject{数学} % 科目
\newcommand\@lninfo@class{联赛班} % 班型
\newcommand\@lninfo@year{2017} % 年份
\newcommand\@lninfo@term{暑假} % 学期 (暑/秋/寒/春)

\newcommand\setgrade[1]{\renewcommand\@lninfo@grade{#1}}
\newcommand\setsubject[1]{\renewcommand\@lninfo@subject{#1}}
\newcommand\setclass[1]{\renewcommand\@lninfo@class{#1}}
\newcommand\setyear[1]{\renewcommand\@lninfo@year{#1}}
\newcommand\setterm[1]{\renewcommand\@lninfo@term{#1}}
\newcommand\setlecnoteinfo[5]{
    \renewcommand\@lninfo@grade{#1}
    \renewcommand\@lninfo@subject{#2}
    \renewcommand\@lninfo@class{#3}
    \renewcommand\@lninfo@year{#4}
    \renewcommand\@lninfo@term{#5}
}

% ---------------------------------------------------------
% 选择题的选项
% ---------------------------------------------------------
\newlength{\cur@candidate@width}
\newlength{\max@candidate@width}

\newlength{\linewidth@quat}
\newlength{\linewidth@half}

\newlength{\candidate@mark@width}
\setlength{\candidate@mark@width}{2em}

\newlength{\candidate@postmargin}
\setlength{\candidate@postmargin}{2em}

\newcommand\candidate@mark[1]{\makebox[\candidate@mark@width][l]{#1.}}

% cmd: \candidates
\newcommand\candidates[4]{%
\setlength{\wid@half}{0.50*(\linewidth-\parindent)-\candidate@mark@width-\candidate@postmargin}%
\setlength{\wid@quat}{0.25*(\linewidth-\parindent)-\candidate@mark@width-\candidate@postmargin}%
%
\settowidth{\max@candidate@width}{#1}%
\settowidth{\cur@candidate@width}{#2}%
\ifthenelse{\lengthtest{\max@candidate@width < \cur@candidate@width}}{\setlength{\max@candidate@width}{\cur@candidate@width}}{}%
\settowidth{\cur@candidate@width}{#3}%
\ifthenelse{\lengthtest{\max@candidate@width < \cur@candidate@width}}{\setlength{\max@candidate@width}{\cur@candidate@width}}{}%
\settowidth{\cur@candidate@width}{#4}%
\ifthenelse{\lengthtest{\max@candidate@width < \cur@candidate@width}}{\setlength{\max@candidate@width}{\cur@candidate@width}}{}%
%

\ifthenelse{ \lengthtest{\max@candidate@width > \linewidthhalf} }{%
\hsapce{\candidate@mark@width}%
\begin{minipage}[t]{\linewidth-\parindent-\candidate@postmargin}%
\makebox[0pt][r]{\candidate@mark{A}}#1\\
\makebox[0pt][r]{\candidate@mark{B}}#2\\
\makebox[0pt][r]{\candidate@mark{C}}#3\\
\makebox[0pt][r]{\candidate@mark{D}}#4%
\end{minipage}%
}{%
    \ifthenelse{ \lengthtest{\max@candidate@width > \linewidth@quat} }{%
\candidate@mark{A}\makebox[\linewidth@half+\candidate@postmargin][l]{#1}%
\candidate@mark{B}\makebox[\linewidth@half+\candidate@postmargin][l]{#2}\\
\candidate@mark{C}\makebox[\linewidth@half+\candidate@postmargin][l]{#3}%
\candidate@mark{D}\makebox[\linewidth@half+\candidate@postmargin][l]{#4}%
    }{%
\candidate@mark{A}\makebox[\linewidth@quat+\candidate@postmargin][l]{#1}%
\candidate@mark{B}\makebox[\linewidth@quat+\candidate@postmargin][l]{#2}%
\candidate@mark{C}\makebox[\linewidth@quat+\candidate@postmargin][l]{#3}%
\candidate@mark{D}\makebox[\linewidth@quat+\candidate@postmargin][l]{#4}%
    }%
}%
%
}

% ---------------------------------------------------------
% 选择题的空
% ---------------------------------------------------------
\newlength{\choicewidth}
\setlength{\choicewidth}{1.5cm}
% cmd: \choice
\newcommand\choice{\makebox[\choicewidth][s]{(\hfill)}}

% ---------------------------------------------------------
% 填空题的空
% ---------------------------------------------------------
\newlength{\blankwidth}
\setlength{\blankwidth}{2cm}
% cmd: \blank
\newcommand\blank{\underline{\hspace{\blankwidth}}}


% ---------------------------------------------------------
% 图片插入命令
% ---------------------------------------------------------
\newcommand\ln@put@figure
\newlength\ln@figure@width
% cmd: \lnfigure
\newkeycommand\lnfigure[enum place={wrapright,wrapleft,right,center,left,inline}][OtherKeys][2]{%
\renewcommand\ln@put@figure{\ifthenelse{\equal{#1}{}}{}{\graphicspath{{#1}}}\includegraphics[OtherKeys]{#2}}%
\settowidth\ln@figure@width{\ln@put@figure}%
\ifthenelse{
  \equal{\commandkey}{wrapright}
}{\begin{wrapfigure}{r}{\ln@figure@width}\ln@put@figure\end{wrapfigure}}{}%
\ifthenelse{
  \equal{\commandkey}{wrapleft}
}{\begin{wrapfigure}{l}{\ln@figure@width}\ln@put@figure\end{wrapfigure}}{}%
\ifthenelse{
  \equal{\commandkey}{right}
}{\begin{flushright}\ln@put@figure\end{flushright}}{}%
\ifthenelse{
  \equal{\commandkey}{center}
}{\begin{center}\ln@put@figure\end{center}}{}%
\ifthenelse{
  \equal{\commandkey}{left}
}{\begin{flushleft}\ln@put@figure\end{flushleft}}{}%
\ifthenelse{
  \equal{\commandkey}{inline}
}{\ln@put@figure}{}%
}

% ---------------------------------------------------------
% 图片的占位符
% ---------------------------------------------------------
% cmd: \figurehere
\newcommand\figurehere{%
\begin{center}%
\fbox{\color{red}\Huge \bfseries FIGURE HERE!}%
\end{center}%
}


% ---------------------------------------------------------
% 题目信息
% ---------------------------------------------------------

% label
\newcommand\@lnpro@label{}
\newcommand{\MathclLabel}[1]{\renewcommand\@lnpro@label{#1}}

% tag
\newcommand\@lnpro@tag{}
\newcommand{\MathclTag}[1]{\renewcommand\@lnpro@tag{#1}}

% problem
\newcommand\@lnpro@problem{}
\newcommand{\MathclProblem}[1]{\renewcommand\@lnpro@problem{#1}}
\newcommand{\@lnpro@print@problem}{%
\ifthenelse{
  \equal{}{\@lnpro@problem}
}{\bfseries\Huge\color{red} 当前没有题干！}{\@lnpro@problem\\}
}

% topics
\newcommand\@lnpro@topics{}
\newcommand{\MathclTopics}[1]{\renewcommand\@lnpro@topics{#1}}

% answer
\newcommand\@lnpro@answer{}
\newcommand{\MathclAnswer}[1]{\renewcommand\@lnpro@answer{#1}}
\newcommand\@lnpro@answer@prefix{\fangsong 【答案】}
\newcommand{\@lnpro@print@answer}{%
\ifthenelse{
  \equal{}{\@lnpro@answer}
}{}{\@lnpro@answer@prefix\@lnpro@answer\\}
}

% hint
\newcommand\@lnpro@hint{}
\newcommand{\MathclHint}[1]{\renewcommand\@lnpro@hint{#1}}
\newcommand\@lnpro@hint@prefix{\fangsong 【提示】}
\newcommand{\@lnpro@print@hint}{%
\ifthenelse{
  \equal{}{\@lnpro@hint}
}{}{\@lnpro@hint@prefix\@lnpro@hint\\}
}

% solution
\newcommand\@lnpro@solution{}
\newcommand{\MathclSolution}[1]{\renewcommand\@lnpro@solution{#1}}
\newcommand\@lnpro@solution{\fangsong 【详解】}
\newcommand{\@lnpro@print@solution}{%
\ifthenelse{
  \equal{}{\@lnpro@solution}
}{\bfseries\Huge\color{red} 当前没有解答！}{\@lnpro@solution@prefix\@lnpro@solution\\}
}

% note
\newcommand\@lnpro@note{}
\newcommand{\MathclNote}[1]{\renewcommand\@lnpro@note{#1}}
\newcommand\@lnpro@note@prefix{\fangsong 【注记】}
\newcommand{\@lnpro@print@note}{%
\ifthenelse{
  \equal{}{\@lnpro@note}
}{}{\@lnpro@note@prefix\@lnpro@note\\}
}

% comment
\newcommand\@lnpro@comment{}
\newcommand{\MathclComment}[1]{\renewcommand\@lnpro@comment{#1}}
\newcommand\@lnpro@comment@prefix{\fangsong 【评论】}
\newcommand{\@lnpro@print@comment}{%
\ifthenelse{
  \equal{}{\@lnpro@comment}
}{}{\@lnpro@comment@prefix\@lnpro@comment\\}
}

% info
\newcommand\@lnpro@info{}
\newcommand{\MathclInfo}[1]{\renewcommand\@lnpro@info{#1}}
\newcommand\@lnpro@info@prefix{\fangsong 【备注】}
\newcommand{\@lnpro@print@info}{%
\ifthenelse{
  \equal{}{\@lnpro@info}
}{}{\@lnpro@info@prefix\@lnpro@info\\}
}

% clear all problem information
\newcommand\@lnpro@clear{
\renewcommand\@lnpro@label{}
\renewcommand\@lnpro@tag{}
\renewcommand\@lnpro@problem{}
\renewcommand\@lnpro@topics{}
\renewcommand\@lnpro@answer{}
\renewcommand\@lnpro@hint{}
\renewcommand\@lnpro@solution{}
\renewcommand\@lnpro@note{}
\renewcommand\@lnpro@comment{}
\renewcommand\@lnpro@info{}
}

% answer visibility
\newcommand\@lnpro@ans@visibility{visible}
\if@teacher@
%\renewcommand\@lnpro@ans@visibility{visible}
\else
\renewcommand\@lnpro@ans@visibility{invisible}
\fi

\newcommand\@lnpro@box@title{}

\newlength\@lnpro@box@upper@vspace
\newlength\@lnpro@box@lower@vspace

\newcommand{\MathclVspace}[2]{%
\setlength\@lnpro@box@upper@vspace{#1}
\setlength\@lnpro@box@lower@vspace{#2}
}


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
}{}

\newcommand{\knodetitle}[1]{
\needspace{3\baselineskip}
\tcbox[beamer,
    halign = flush center,
    coltext = white,
    colback = blue!50]{\bcetoile~\bfseries #1}
}

\newenvironment{knode}[1]{
\ifthenelse{\isempty{#1}}{}{\knodetitle{#1}}
}{\vfil}



\newcounter{cnt@example}[chapter]
\newtcolorbox[
    use counter = cnt@example,
]{examplebox}[2][]{%
    enhanced jigsaw,
    blanker,
    %colframe = blue!80!black,
    %colback=blue!10,
    opacityback = 0,
    #1,
    coltitle = blue!80!black,
    colbacktitle=blue!80!black,
    fonttitle = \bfseries,
    title = {\bccrayon~例~\thetcbcounter:~#2},
    before upper = \setlength{\parskip}{0.1\baselineskip},
    %upperbox = ,
    after upper = \vspace{\@lnpro@box@upper@vspace},
    lower separated=false,
    before lower = \small,
    lowerbox = \@lnpro@ans@visibility,
    after lower = \vspace{\@lnpro@box@lower@vspace},
    after = \vfil,
}



\newcommand{\MathclExample}{
\if@teacher@ % 教师版要显示题目编号 (problem label)
\renewcommand{\@lnpro@box@title}{\@lnpro@tag \hfill \fbox{\texttt\@lnpro@label}}
\else
\renewcommand{\@lnpro@box@title}{\@lnpro@tag}
\fi

\begin{examplebox}{\@lnpro@box@title}
\@lnpro@print@problem
\@lnpro@print@hint
%%%%%%%%%%
\tcblower%
%%%%%%%%%%
\@lnpro@print@answer
\@lnpro@print@solution
\@lnpro@print@note
\@lnpro@print@comment
\@lnpro@print@info
\end{examplebox}

% 清空相关信息
\@lnpro@clear
\MathclVspace{0pt}{0pt}
}

\newcommand{\MathclUseAsExample}[2]{%
\graphicspath{#1}
\import{#1}{#2}
\MathclExample
}


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
    #1,
    fonttitle = \normalfont,
    title = {\thetcbcounter.~\ifthenelse{\equal{}{#2}}{}{#2}},
    %before upper = ,
    %upperbox = ,
    after upper = \vspace{\@lnpro@box@upper@vspace},
    lower separated = false,
    before lower = \small,
    lowerbox = \@lnpro@ans@visibility,
    after lower = \vspace{\@lnpro@box@lower@vspace},
    after = \vfil,
}

\newcommand{\MathclExercise}{
\if@teacher@ % 教师版要显示题目编号 (problem label)
\renewcommand{\@lnpro@box@title}{\@lnpro@tag \hfill \fbox{\texttt\@lnpro@label}}
\else
\renewcommand{\@lnpro@box@title}{\@lnpro@tag}
\fi

\begin{exercisebox}{\@lnpro@box@title}
\@lnpro@print@problem
\@lnpro@print@hint
%%%%%%%%%%
\tcblower%
%%%%%%%%%%
\@lnpro@print@answer
\@lnpro@print@solution
\end{exercisebox}

% 清空相关信息
\@lnpro@clear
\MathclVspace{0pt}{0pt}
}

\newcommand{\MathclUseAsExercise}[2]{%
\graphicspath{#1}
\import{#1}{#2}
\MathclExercise
}




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
\if@teacher@
测试
\else
本节笔记
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
    #1,
    fonttitle = \normalfont,
    title = {\thetcbcounter.~({#2}~分)~\ifthenelse{\equal{}{#3}}{}{#3}},
    %before upper = ,
    upperbox = \@lnpro@ans@visibility,
    after upper = \vspace{\@lnpro@box@upper@vspace},
    lower separated = false,
    before lower = \small,
    lowerbox = \@lnpro@ans@visibility,
    after lower = \vspace{\@lnpro@box@lower@vspace},
    after = \vfil,
}



\newcommand{\MathclQuestion}[1]{
\if@teacher@ % 教师版要显示题目编号 (problem label)
\renewcommand{\@lnpro@box@title}{\@lnpro@tag \hfill \fbox{\texttt\@lnpro@label}}
\else
\renewcommand{\@lnpro@box@title}{\@lnpro@tag}
\fi


\begin{questionbox}{#1}{\@lnpro@box@title}
\@lnpro@print@problem
\@lnpro@print@hint
%%%%%%%%%%
\tcblower%
%%%%%%%%%%
\@lnpro@print@answer
\@lnpro@print@solution
\end{questionbox}

% 清空相关信息
\@lnpro@clear
\MathclVspace{0pt}{0pt}
}

\newcommand{\MathclUseAsQuestion}[2]{%
\graphicspath{#1}
\import{#1}{#2}
\MathclQuestion{#1}
}

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
