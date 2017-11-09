# 均值不等式

## `讲义`

### 均值不等式

1、均值定理：$a,b \in \mathbb R^+$, 那么 $\dfrac{a+b}2 \ge \sqrt{ab}$. 当且仅当 $a=b$ 时, 等号成立. 

此结论也通常称为均值不等式. 我们常把 $\dfrac{a+b}2$ 叫做正数 $a,b$ 的算术平均数, 把 $\sqrt{ab}$ 叫做正数 $a,b$ 的几何平均数. 

2、均值不等式的常用形式

 (1) $a,b$ 为正数, 则 $\sqrt{\dfrac{a^2+b^2}2} \ge \dfrac{a+b}2 \ge \sqrt{ab} \ge \dfrac2{\dfrac1a+\dfrac1b}$, 当且仅当 $a=b$ 时，等号成立. 其中, $\sqrt{\dfrac{a^2+b^2}2}$ 称为平方平均值, $\dfrac2{\dfrac1a+\dfrac1b}$ 称为调和平均值;

(2) $\dfrac{a}{b} + \dfrac{b}{a} \ge 2$ ($ab>0$), 当且仅当 $a=b$ 时，等号成立;

(3) $\dfrac{a}{b} + \dfrac{b}{a} \le -2$ ($ab<0$), 当且仅当 $a+b=0$ 时，等号成立;

(4) $\left| a + \dfrac1a \right| = |a| + \left| \dfrac1a \right| \ge 2$, 当且仅当 $a=\pm1$ 时，等号成立.

#### 例 1

求证:
$$
\sqrt{\dfrac{a^{2}+b^{2}}{2}}
\ge \dfrac{a+b}{2}
\ge \left( \dfrac{\sqrt{a}+\sqrt{b}}{2} \right)^{2}
\ge \sqrt{ab}
\ge \dfrac{2}{\dfrac{1}{a}+\dfrac{1}{b}}
$$

> $\dfrac{a^{2}+b^{2}}{2} - \left( \dfrac{a+b}{2} \right)^{2} = \dfrac{(a-b)^{2}}{4} \ge 0$, 所以 $\sqrt{\dfrac{a^{2}+b^{2}}{2}} \ge \dfrac{a+b}{2}$;
>
> $\left( \dfrac{(a+b)}{2} \right) - \left( \dfrac{\sqrt{a}+\sqrt{b}}{2} \right)^{2} = \dfrac{(\sqrt{a}-\sqrt{b})^{2}}{4}\ge0$, 所以 $\dfrac{a+b}{2} \ge \left( \dfrac{\sqrt{a}+\sqrt{b}}{2} \right)^{2}$;
>
> $\left( \dfrac{\sqrt{a}+\sqrt{b}}{2} \right)^{2} - \sqrt{ab} = \dfrac{(\sqrt{a}-\sqrt{b})^{2}}{4}\ge0$, 所以 $\left( \dfrac{\sqrt{a}+\sqrt{b}}{2} \right)^{2} \ge \sqrt{ab}$;
>
> $\sqrt{ab}-\dfrac{2}{\dfrac{1}{a}+\dfrac{1}{b}} = \dfrac{\sqrt{ab}(\sqrt{a}-\sqrt{b})^{2}}{a+b} \ge0$, 所以 $\sqrt{ab} \ge \dfrac{2}{\dfrac{1}{a}+\dfrac{1}{b}}$.


#### 例 2

(1) 设 $a,b \in \mathbb{R}$, 求证: $a^{2}+b^{2}\ge a+b+ab-1$;
(2) 设 $a,b,c \in \mathbb{R^{+}}$, 求证: $\lg \dfrac{a+b}{2} + \lg \dfrac{b+c}{2} + \lg \dfrac{c+a}{2} \ge \lg a+\lg b+\lg c$;
(3) 设 $a,b,c \in \mathbb{R^{+}}$, 求证: $(a+ac^{2}+c^{2}+1)(ab+b^{2}+a+b) \ge 16abc$;
(4) 设 $a,b,c \in \mathbb{R^{+}}$, 求证: $\sqrt{a^{2}+b^{2}} + \sqrt{b^{2}+c^{2}} + \sqrt{c^{2}+a^{2}} \ge \sqrt{2}(a+b+c)$;
(5) 设 $a,b,c \in \mathbb{R^{+}}$, 且 $abc=1$, 求证: $\sqrt{a}+\sqrt{b}+\sqrt{c} < \dfrac{1}{a}+\dfrac{1}{b}+\dfrac{1}{c}$.

> (1) $a^{2}+b^{2}-a-b-ab-1 = \dfrac{(a-1)^{2}+(b-1)^{2}+(a-b)^{2}}2 \ge 0$, 得证;
>
> (2) $\lg\dfrac{a+b}{2}+\lg\dfrac{b+c}{2}+\lg\dfrac{c+a}{2} = \lg\dfrac{(a+b)(b+c)(c+a)}{8}$ $\ge \lg\dfrac{2\sqrt{ab}\cdot2\sqrt{bc}\cdot2\sqrt{ac}}{8} = \lg a + \lg b + \lg c$;
>
> (3) $(a+ac^{2}+c^{2}+1)(ab+b^{2}+a+b) = (a+1)^2 (c^2+1) (b^2+1) \ge (2\sqrt{a})^2 \cdot 2c \cdot 2b = 16abc$;
>
> (4) $\sqrt{a^{2}+b^{2}}+\sqrt{b^{2}+c^{2}}+\sqrt{c^{2}+a^{2}}\ge\sqrt{2}ab+\sqrt{2}bc+\sqrt{2}ca=\sqrt{2}(a+b+c)$;
>
> (5) 因为 $abc=1$,
> $$
> \begin{aligned}
> \dfrac{1}{a}+\dfrac{1}{b}+\dfrac{1}{c}
> &=\dfrac{abc}{a}+\dfrac{abc}{b}+\dfrac{abc}{c}=ab+bc+ca \\
> &=\dfrac{ab+ac}{2}+\dfrac{ab+bc}{2}+\dfrac{ac+bc}{2} \\
> &\ge\sqrt{a^{2}bc}+\sqrt{ab^{2}c}+\sqrt{abc^{2}} \\
> &=\sqrt{a}+\sqrt{b}+\sqrt{c}
> \end{aligned}
> $$
>

### 一般形式的均值不等式


1、三个正数的均值不等式

 如果 $a,b,c$ 为正数, 则 $\dfrac{a+b+c}3 \ge \sqrt[3]{abc}$, 当且仅当 $a=b=c$ 时等号成立． 

2、一般形式的均值不等式 

如果 $a_1, a_2, \dots, a_n$ 为 $n$ 个正数, 则 $\dfrac{a_1 + a_2 + \dots + a_n}n \ge \sqrt[n]{a_1 a_2 \dots a_n}$, 当且仅当 $a_1 = a_2 = \dots = a_n$ 时等号成立．

均值不等式实际上是平方平均值、算数平均值、几何平均值、调和平均值之间递减关系．	

#### 例 3

(1) 设 $a,b,c \in \mathbb{R}$, 求证: $a^{3}+b^{3}+c^{3} \ge 3abc$;
(2) 设 $a,b,c \in \mathbb{R^{+}}$, 求证: $\dfrac{a+b+c}{3} \ge \sqrt[3]{abc}$.


> (1) 由排序不等式有 $a^{3}+b^{3} \ge a^{2}b+ab^{2}$, $a^{3}+c^{3} \ge a^{2}c+ac^{2}$, $c^{3}+b^{3} \ge c^{2}b+cb^{2}$, 所以
> $$
> \begin{aligned}
> 2(a^{3}+b^{3}+c^{3}) &\ge a^{2}b+ab^{2}+a^{2}c+ac^{2}+c^{2}b+cb^{2} \\
> &= b(a^{2}+c^{2})+a(b^{2}+c^{2})+c(a^{2}+b^{2}) \\
> &\ge b \cdot 2ac + a \cdot 2bc + c \cdot 2ab = 6abc
> \end{aligned}
> $$
>
> (2) 换元, 令 $l^{3}=a$,$m^{3}=b$,$n^{3}=c$ 即可得.

### 利用均值不等式求最值

对均值不等式观察分析可知：若两个正数的积为常数, 当且仅当它们相等时, 它们的和有最小值；若两个正数的和为常数, 当且仅当它们相等时, 它们的积有最大值．最值问题在此便略有体现．

归纳出 3 个用均值不等式求最值问题的适用条件： 
条件一：在所求最值的代数式中, 各项均为正数, 否则需要变号转换；
条件二：各项的和或积要为常数, 以确保不等式的一端为定值, 否则执行拆项或添项变形；
条件三：当含变数的各项均相等时才能取得最值．
一个题目同时满足上述三个条件, 或者可以变形成适合以上条件的, 便可用均值不等式求最值．

#### 例 4

已知$a>0,b>0$.

(1) 若 $a+b=1$, 求 $\dfrac{1}{a}+\dfrac{1}{b}$ 的最小值;
(2) 若 $\dfrac{1}{a} + \dfrac{4}{b} = 2$, 求 $3a+b$ 和 $ab$ 的最小值;
(3) 若 $a+2b=1$, 求 $\dfrac{2}{a}+\dfrac{5}{b}$ 和 $(1+\dfrac{1}{a})(1+\dfrac{1}{b})$ 的最小值;
(4) 若 $x^{2}+y^{2}+xy=1$, 求 $x+y$ 的最大值;
(5) 若 $ab>0$ 且 $a^{2}b=2$, 求 $ab+a^{2}$ 的最小值, 和此时 $a,b$ 的值;
(6) 若 $a>b>0$, 求 $a^{2}+\dfrac{16}{b(a-b)}$ 的最小值.


> (1) $\dfrac{1}{a}+\dfrac{1}{b}=(a+b)(\dfrac{1}{a}+\dfrac{1}{b})=2+\dfrac{b}{a}+\dfrac{a}{b}\ge2+2=4$;
>
> (2) $3a+2b=\dfrac{1}{2}(3a+b)(\dfrac{1}{a}+\dfrac{4}{b})=\dfrac{1}{2}(7+\dfrac{b}{a}+\dfrac{12a}{b})\ge\dfrac{7+4\sqrt{3}}{2}$;
>
> $2=\dfrac{1}{a}+\dfrac{4}{b}\ge2\sqrt{\dfrac{4}{ab}}$, 所以 $ab\ge4$;
>
> (3) $\dfrac{2}{a}+\dfrac{5}{b} = (a+2b)(\dfrac{2}{a}+\dfrac{5}{b}) = (12+\dfrac{4b}{a}+\dfrac{5a}{b}) \ge12+2\sqrt{20} =12+4\sqrt{5}$;
>
> $(1+\dfrac{1}{a})(1+\dfrac{1}{b}) = (1+\dfrac{a+2b}{a})(1+\dfrac{a+2b}{b}) = 8+\dfrac{2a}{b}+\dfrac{6b}{a} \ge 8+4\sqrt{3}$;
>
> (4) $x^{2}+y^{2}+2xy=1+xy\le1+(\dfrac{x+y}{2})^{2}$, 即 $(x+y)^{2}\le\dfrac{4}{3}$, 所以 $x+y \le \dfrac{2\sqrt{3}}{3}$;
>
> (5) $b=\dfrac{2}{a^{2}}$, 所以 $ab+a^{2}=\dfrac{2}{a}+a^{2}=\dfrac{1}{a}+\dfrac{1}{a}+a^{2}\ge3\sqrt[3]{\dfrac{1}{a}\cdot\dfrac{1}{a}\cdot a^{2}}=3$, 此时$a=1$,$b=2$;
>
> (6) $b(a-b)\le(\dfrac{a}{2})^{2}=\dfrac{a^{2}}{4}$, 所以$a^{2}+\dfrac{16}{b(a-b)} \ge a^{2}+\dfrac{64}{a^{2}} \ge 2\sqrt{64}=16$.


#### 例 5

试分析以下函数的性质（定义域, 值域, 单调性, 奇偶性, 对称轴, 对称中心等）

(1) $f(x)=x+\dfrac{1}{x}$
(2) $f(x)=ax+\dfrac{b}{x}$

> (1) $f(x)=x+\dfrac{1}{x}$ 定义域为 $(-\infty,0)\cup(0,+\infty)$, 值域为$(-\infty,-2]\cup[2,+\infty)$,单调递增区间为 $(-\infty,-1)$ 和 $(1,+\infty)$, 单调递减区间为 $(-1,0)$ 和 $(0,1)$, 在定义域内是奇函数, 无对称轴, 对称中心是$(0,0)$;
>
> (2) $f(x)=ax+\dfrac{b}{x}$定义域为 $(-\infty,0)\cup(0,+\infty)$, 在定义域内是奇函数, 无对称轴, 对称中心是$(0,0)$,
>
> 当 $a>0$, $b>0$ 时, 值域为 $(-\infty,-2\sqrt{ab}] \cup [2\sqrt{ab},+\infty)$, 单调递增区间为 $(-\infty,-\sqrt{\dfrac{b}{a}})$ 和 $(\sqrt{\dfrac{b}{a}},+\infty)$, 单调递减区间为 $(-\sqrt{\dfrac{b}{a}},0)$ 和 $(0,\sqrt{\dfrac{b}{a}})$,
>
> 当 $a<0$, $b<0$ 时, 值域为 $(-\infty,-2\sqrt{ab}] \cup [2\sqrt{ab},+\infty)$ ,单调递减区间为 $(-\infty,-\sqrt{\dfrac{b}{a}})$ 和 $(\sqrt{\dfrac{b}{a}},+\infty)$, 单调递增区间为 $(-\sqrt{\dfrac{b}{a}},0)$ 和 $(0,\sqrt{\dfrac{b}{a}})$,
>
> 当 $a>0$, $b<0$ 时, 值域为 $(-\infty,+\infty)$, 单调递增区间为 $(-\infty,0)$ 和 $(0,+\infty)$,
>
> 当 $a<0$, $b>0$ 时, 值域为 $(-\infty,+\infty)$, 单调递减区间为$(-\infty,0)$ 和 $(0,+\infty)$.


#### 例 6

求下列函数的最小值

(1) $y=x(2x-8),x\in(0,4)$
(2) $y=\dfrac{x^{2}-2x+6}{x+1},x\in(-1,+\infty)$
(3) $y=\dfrac{x^{2}+4}{\sqrt{x^{4}+3}}+1$
(4) $y=-\dfrac{x-1}{(x+5)(x+2)},x\in(1,+\infty)$

> (1) $y=\dfrac{2x(8-2x)}{-2}\ge\dfrac{4^{2}}{-2}=-8$;
>
> (2) $y=(x+1)+\dfrac{9}{x+1}-4\ge2\sqrt{9}-4=2$;
>
> (3) $y=\sqrt{x^{2}+3}+\dfrac{1}{\sqrt{(x^{2}+3)}}+1$, 又因为 $\sqrt{x^{2}+3}$ 的最小值为 $\sqrt{3}$, 所以 $y_{\min}=\dfrac{4\sqrt{3}}{3}+1$;
>
> (4) $-\dfrac{1}{y}=(x-1)+\dfrac{18}{x-1}+9\ge6\sqrt{3}+9$, 所以 $y\ge-\dfrac{1}{6\sqrt{3}+9}=\dfrac{3-2\sqrt{3}}{9}$.

#### 例 7

求下列函数的最值

(1) $y=x+\dfrac{1}{3x^{2}}$, ($x>0$)
(2) $y=x^{3}+\dfrac{6}{x^{2}}$, ($x>0$)
(3) $y=x(1-x)^{2}$, ($0<x<1$)
(4) $y=x^{2}(1-3x)$, ($0<x<\dfrac{1}{3}$)

> (1) $y=\dfrac{x}{3}+\dfrac{x}{3}+\dfrac{x}{3}+\dfrac{1}{3x^{3}}\ge4\sqrt[4]{\dfrac{x}{3}\cdot\dfrac{x}{3}\cdot\dfrac{x}{3}\cdot\dfrac{1}{3x^{3}}}=\dfrac{4}{3}$;
>
> (2) $y=\dfrac{x^{3}}{2}+\dfrac{x^{3}}{2}+\dfrac{2}{x^{2}}+\dfrac{2}{x^{2}}+\dfrac{2}{x^{2}}\ge5\sqrt[5]{\dfrac{x^{3}}{2}\cdot\dfrac{x^{3}}{2}\cdot\dfrac{2}{x^{2}}\cdot\dfrac{2}{x^{2}}\cdot\dfrac{2}{x^{2}}}=5\sqrt[5]{2}$;
>
> (3) $y=4[x(\dfrac{1-x}{2})(\dfrac{1-x}{2})]\le4(\dfrac{1}{3})^{3}=\dfrac{4}{27}$;
>
> (4) $y=\dfrac{4}{9}(\dfrac{3x}{2})(\dfrac{3x}{2})(1-3x)\le\dfrac{4}{9}(\dfrac{1}{3})^{3}=\dfrac{4}{243}$.

#### 例 8

(1) 已知常数$a,b\in\mathbb{R^{+}}$,变量$x\in(0,1)$,求$f(x)=\dfrac{a^{2}}{x}+\dfrac{b^{2}}{1-x}$的最小值;
(2) 已知$x\in[0,\dfrac{\pi}{2}]$,求$f(x)=\sin^{2} x\cos x$的最大值.

> (1) 
> $$
> \begin{aligned}
> f(x) &= \dfrac{a^{2}}{x}+\dfrac{b^{2}}{1-x} = (\dfrac{a^{2}}{x}+\dfrac{b^{2}}{1-x})[x+(1-x)] \\
> &= \dfrac{a^{2}(1-x)}{x}+\dfrac{b^{2}x}{1-x}+a^{2}+b^{2}\ge a^{2}+b^{2}+2ab
> \end{aligned}
> $$
> (2) $\sqrt[3]{\dfrac{1}{\sqrt{2}}\sin x\cdot\dfrac{1}{\sqrt{2}}\sin x\cdot\cos x}\le\sqrt{\dfrac{\dfrac{1}{2}\sin^{2} x+\dfrac{1}{2}\sin^{2} x+\cos^{2} x}{3}}$,
>
> $f(x)=\sin^{2} x\cdot\cos x\le \dfrac{2\sqrt{3}}{9}$.

#### 例 9

已知 $a,b\in\mathbb{R^{+}}$, 且 $a+b=1$,

(1) 求 $ab+\dfrac{1}{ab}$ 的最小值；
​(2) 求证: $(a+\dfrac{1}{a})(b+\dfrac{1}{b})\ge\dfrac{25}{4}$.

> (1) $ab\le(\dfrac{a+b}{2})^{2}=\dfrac{1}{4}$, 所以$ab\in(0,\dfrac{1}{4}]$, 所以$\left( ab+\dfrac{1}{ab} \right)_{\min}=\dfrac{1}{4}+4=\dfrac{17}{4}$;
>
> (2) $(a+\dfrac{1}{a})(b+\dfrac{1}{b})=ab+\dfrac{1}{ab}+\dfrac{a}{b}+\dfrac{b}{a}\ge\dfrac{17}{4}+2=\dfrac{25}{4}$.

#### 例 10

(1) 已知一个矩形的面积为$100~\text{m}^{2}$, 问这个矩形的长、宽各为多少是, 矩形的周长最短？最短周长是多少？
(2) 已知一个矩形的周长为 $36~\text{m}$, 问这个矩形的长、宽各为多少时, 它的面积最大？最大面积是多少？

> (1) 设长 $x$, 宽 $y$, 周长为 $l$; 则 $x \cdot y=100$, 周长 $l=2(x+y)\ge 2 \cdot 2\sqrt{xy} = 40$, 当且仅当 $x=y=10$ 时, 周长最短;
>
> (2) 设长为 $x$, 宽为 $y$, 面积为 $S$; 则 $2x+2y=36$, 面积$S=xy\le(\dfrac{x+y}{2})^{2}=81$, 当且仅当 $x=y=9$ 时, 面积最大.

#### 例 11 `2011江苏启东模拟`

某森林出现火灾, 火势正以每分钟$100​$平方米的速度顺风蔓延, 消防站接到警报立即派消防队员前去灭火。在火灾发生$5​$分钟后到达救火现场, 已知消防队员在现场平均每人每分钟灭火$50​$平方米,所消耗的灭火材料、劳务津贴等费用为每人每分钟$125​$ 元,另附加每次救火所耗损的车辆、器材和装备等费用平均每人$100​$元, 而烧毁一平方米森林大约损失$60​$元.问应该派多少名消防队员前去救火, 才能使总损失最小？

> 设派$x$去救火, 火扑灭时间为$t$分钟, 总损失为$y$元;则$500+100t=50tx$,所以$t=\dfrac{10}{x-2}$,总损失$y=125tx+100x+(500+100t)\cdot60$ 整理得$y=31450+1000(x-2)+\dfrac{62500}{x-2}$当且仅当$x=27$时, 总损失最小为$36450$元.

### `十面埋伏`

#### 例 12

(1) (2008 江苏) 设$x,y,z\in\mathbb{R^{+}}$,且$x-2y+3z=0$,求$\dfrac{y^{2}}{xz}$的最小值；
(2) 设$x\in(0,\pi)$,求$f(x)=\sin x+\dfrac{4}{\sin x}$的最小值.


> (1) $y=\dfrac{x+3z}{2}$,所以$\dfrac{y^{2}}{xz}=\dfrac{x^{2}+6xz+9z^{2}}{4xz}=\dfrac{x}{4z}+\dfrac{9z}{4x}+\dfrac{3}{2}\ge2\sqrt{\dfrac{9}{16}}+\dfrac{3}{2}=3$ 当且仅当$x=3z$和$y=3z$.
>
> (2) $f(x)=\sin x+\dfrac{4}{\sin x}$当$\sin x=1$时$f(x)$最小为$5$.

### `剑指八方`

#### 例 13

已知$a,b,c\in\mathbb{R^{+}}$,证明$\dfrac{a^{2}}{b+c}+\dfrac{b^{2}}{c+a}+\dfrac{c^{2}}{a+b}\ge\dfrac{a+b+c}{2}$.

> $$
> \begin{aligned}
> &\dfrac{a^{2}}{b+c}+\dfrac{b^{2}}{a+c}+\dfrac{c^{2}}{a+b}+\dfrac{a+b+c}{2} \\
> &= \dfrac{a^{2}}{b+c}+\dfrac{b+c}{4}+\dfrac{b^{2}}{a+c}+\dfrac{a+c}{4}+\dfrac{c^{2}}{a+b}+\dfrac{a+b}{4}\\
> &\ge a+b+c
> \end{aligned}
> $$
>

### `课后阅读` 数量的测定

你知道自己头上有多少根头发吗？据说，人的头发有数十万根之多，当然不可能一根一根地去数．头发的排列也并非整整齐齐，不能数多少行，多少排，然后用乘法算．

一种切实可行的办法，是测量一下头发面积有多大，再数一数一个平方厘米头皮上有多少根头发，然后用单位面积上头发的根数去乘面积，就得头发的总根数了．

当然，头发密度不一定相同，有的地方长得密一些，有的地方稀一些．在选取“样本”时，要找有代表性的地方．

计算头发根数的实际意义不大，但这种方法却很有用处．一片大原始森林，共有多少棵树？要回答这个问题，就可以用类似的办法来解决．但是，森林中的树木也有疏有密，怎样选取“样本”呢？最好的办法是任意选若干块地方，分别计算，然后求出平均数来．

例如，要测定一批稻谷千粒重，当然不能把所有的稻谷都拿来秤．我们先从中取出千粒稻谷，秤得其重量为 $a_1$，再取另外的千粒稻谷 ，称得其重量为$a_1$；如此继续称下去，如果一直称到第 5 次，千粒重为 $a_5$，那么，这批稻谷的千粒重就可以用下面的平均数来估计：$\dfrac{a_1+a_2+a_3+a_4+a_5}5$．

为什么要取 $n$ 个测定值的平均数作为测定的值呢？这是因为，$x$ 这个数值是 $n$ 次观测所得数据 $a_1, a_2, \dots, a_n$ 的代表，它体现了所要观测的 $n$ 个量的整体性，与这 $n$ 个数据距离的和最小．

但是， $x-a_i$ ($i = 1, 2, \dots, n$) 有正有负，如果将它们相加作为测量得到的偏差，是不合理的，因为正偏差与负偏差的和相互抵消了．用这样偏差来衡量测量的准确性是不科学的．那么，用什么数来表示才好呢？如果将上面各偏差平方后再相加，这样，其中各项就不可能为负数了．

因此，令 $y = (x-a_1)^2 + (x-a_2)^2 + \dots + (x-a_n)^2$．

现在的任务就是要求 $x$ 为何值时，$y$ 取最小值，使偏差最小，从而使测量效果最佳． 

我们可以利用初三的知识，发现当 $x = \dfrac{a_1+a_2+\dots+a_n}n$ 时，$y$ 取最小值．

因此在科学实验中，取 $n$ 次观测的数据的算术平均值作为观测的重量是正确的． 

## `作业`

1. 下列函数中, $y$ 的最小值为 $4$ 的是 \choice.

   A. $y=x+\dfrac{4}{x}$
   B. $y=\dfrac{2(x^{2}+3)}{\sqrt{x^{2}+2}}$
   C. $y=e^{x}+4e^{-x}$
   D. $y=\sin x+\dfrac{4}{\sin x}$ ($0< x<\pi$)

   > C.
   >
   > A 选项中 $x$ 可以去负值, 于是 $y$ 可以取负值; $B$ 选项中 $\sqrt{x^2+2} \ge 2$, $y$ 能取到的最小值是 $6$; D 选项中 $\sin x$ 取值范围是 $(0,1]$, $y$ 能取到的最小值是 $5$.

2. 设实数 $x,y$ 满足 $\dfrac{1}{x^{2}}+\dfrac{1}{y^{2}}=1$, 则 $x^{2}+2y^{2}$ 有 \choice.

   A. 最大值 $3+2\sqrt{2}$
   B. 最小值 $3+2\sqrt{2}$
   C. 最大值 $6$
   D. 最小值 $6$

   >  B.
   >
   >  $x^{2}+2y^{2} = (x^{2}+2y^{2}) \left( \dfrac{1}{x^{2}}+\dfrac{1}{y^{2}} \right) = 3 + \dfrac{2y^2}{x^2} + \dfrac{x^2}{y^2} \ge 3+2\sqrt2$, 当且仅当 $x^2 = \sqrt2 y^2$ 时取等号.

3. 若 $a,b,c>0$ 且 $a(a+b+c)+bc=4-2\sqrt{3}$, 则 $2a+b+c$ 的最小值为 \choice.

   A. $\sqrt{3}-1$
   B. $\sqrt{3}+1$
   C. $2\sqrt{3}+2$
   D. $2\sqrt{3}-2$

   > D.
   >
   > $2a+b+c = (a+b)+(a+c) \ge 2\sqrt{(a+b)(a+c)} = 2\sqrt{a(a+b+c)+bc} = 2\sqrt3-2$.

4. 已知 $x<\dfrac{5}{4}$, 求函数 $y=4x-2+\dfrac{1}{4x-5}$ 最大值.

   > $4x-5<0$, $y = -|4x-5| - \dfrac1{|4x-5|} + 3 \le 1$, 当且仅当 $4x-5=-1$ 即 $x=1$ 时取等号. $y$ 的最大值为 $1$.

5. 求函数 $y=\dfrac{x^{2}+5}{\sqrt{x^{2}+4}}$ 的值域.

   > $y = \sqrt{x^2+4} + \dfrac1{\sqrt{x^2+4}}$, 由于 $\sqrt{x^2+4} \in [2, +\infty)$, 故 $y \in [\dfrac52, +\infty)$.

6. 已知 $x>0$, 求证$\colon$ $x+\dfrac{1}{x}+\dfrac{1}{x+\dfrac{1}{x}}\ge\dfrac{5}{2}$.

   > 由于 $t = x+\dfrac1x \ge 2$, 故 $x+\dfrac{1}{x}+\dfrac{1}{x+\dfrac{1}{x}} = t + \dfrac1t \ge \dfrac{5}{2}$.



## `测试`

1. 已知 $a,b,c\in\mathbb{R^{+}}$, 求证$(a+b+c)(\dfrac{1}{a}+\dfrac{1}{b}+\dfrac{1}{c})\ge9$. (6 分)

   > $a+b+c \ge 3\sqrt[3]{abc}$, 而 $\dfrac1a + \dfrac1b + \dfrac1c \ge 3 \dfrac1{\sqrt[3]{abc}}$, 两式相乘即得.

2. 已知 $a>2$, $b>3$, 则 $a+b+\dfrac{1}{(a-2)(b-3)}\ge$ \blank; (4分)

   > $8$.
   >
   > 设 $t = (a-2)(b-3)$, 有 $a+b = (a-2)+(b-3)+5 \ge 2\sqrt{t}+5$,
   > $$
   > \begin{aligned}
   > a+b+\dfrac{1}{(a-2)(b-3)} &\ge \sqrt{t} + \sqrt{t} + \dfrac{1}{t} + 5 \\
   > &\ge 3\sqrt[3]{\sqrt{t} \cdot \sqrt{t} \cdot \dfrac{1}{t}} +5 =8
   > \end{aligned}
   > $$
   >
   > ​当且仅当 $a-2=b-3$ 且 $\sqrt{t} = \dfrac1t$ 时取等号, 此时 $a=3$, $b=4$, $t=1$.

3. 已知 $a>b>0$, 则 $a+\dfrac{1}{(a-b)b}\ge$ \blank. (4分)

   > $3$.
   >
   > 设 $t = (a-b)b$, 有 $a = (a-b) + b \ge 2\sqrt{(a-b)b} = 2\sqrt{t}$. 故 $a + \dfrac{1}{(a-b)b} \ge 2\sqrt{t} + \dfrac{1}{t} \ge 3\sqrt[3]{\sqrt{t} \cdot \sqrt{t}} = 3$, 当且仅当 $a-b=b$ 且 $\sqrt{t} = \dfrac1t$ 时取等号, 此时 $a=2$, $b=1$, $t=1$.

4. 当 $x\in(0,1)$ 时, 求函数 $y=x(1-x^{2})$ 的最大值. (6分)

   > $y=\sqrt{\dfrac12 \cdot 2x^2(1-x^{2})^2} \le \sqrt{\dfrac12 \cdot \left( \dfrac{2x^2 + (1-x^2) + (1-x^2)}3 \right)^3} = \dfrac{2\sqrt3}9$, 当且仅当 $2x^2 = 1-x^2$ 即 $x = \dfrac{\sqrt3}3$ 时取等号. 故函数最大值为 $\dfrac{2\sqrt3}9$.

