# 柯西不等式

## `讲义`

### 柯西不等式

1. 简单柯西不等式

   设 $a,b,c,d$ 是实数, 则:
   $$
   (a^2 + b^2) (c^2 + d^2) \ge (ac + bd)^2
   $$
   当且仅当 $a:b = c:d$ 时等号成立. 上式称为柯西不等式．

2. 柯西不等式的一般形式

   设 $a_1, a_2, \dots, a_n$, $b_1, b_2,\dots,b_n$ 是实数, 那么:
   $$
   (a_1^2 + a_2^2 + \dots + a_n^2) (b_1^2 + b_2^2 + \dots + b_n^2)
   \ge (a_1 b_1 + a_2 b_2 + \dots + a_n b_n)^2
   $$
   当且仅当 $a_1:b_1 = a_2:b_2 = \dots = a_n:b_n$ 时等号成立. 


#### 例 1

已知 $a>0$, $b>0$,

(1) 若$a+2b=1$, 求$\dfrac{2}{a}+\dfrac{5}{b}$的最小值;
(2) 若$\dfrac{1}{a}+\dfrac{4}{b}=2$, 求$3a+b$的最小值.


> (1) $\dfrac{2}{a}+\dfrac{5}{b}=(a+2b) \left( \dfrac{2}{a}+\dfrac{5}{b} \right) = 12 + \dfrac{4b}a +\dfrac{5a}b \ge 12+4\sqrt{5}$;
>
> (2) $3a+b=\dfrac{1}{2}(3a+b) \left(\dfrac{1}{a}+\dfrac{4}{b} \right) \ge \dfrac{1}{2} \left( 7 +\dfrac{b}a + \dfrac{12a}b \right) = \dfrac{7}{2}+2\sqrt{3}$.


#### 例 2

(1) 已知 $2x+3y+4z=10$, 求 $x^{2}+y^{2}+z^{2}$ 的最小值.
(2) (2013湖北) 已知 $x,y\in R$, 且$x^{2}+y^{2}+z^{2}=1$, $x+2y+3z=\sqrt{14}$, 求 $x+y+z$ 的值.

> (1) $(x^{2}+y^{2}+z^{2})(2^{2}+3^{2}+4^{2})\ge(2x+3y+4z)^{2}=100$, 所以$x^{2}+y^{2}+z^{2}\ge\dfrac{100}{29}$
>
> (2) $14=(x^{2}+y^{2}+z^{2})(1^{2}+2^{2}+3^{2})\ge(x+2y+3z)^{2}=14$, 当且仅当$\dfrac{x}{1}=\dfrac{y}{2}=\dfrac{z}{3}=\dfrac{\sqrt{14}}{14}$ 时取等号, 所以 $x+y+z=\dfrac{6\sqrt{14}}{14}=\dfrac{3\sqrt{14}}{7}$.


#### 例 3

$a+b+c+d=3$, $a^{2}+2b^{2}+3c^{2}+6d^{2}=5$. 求证: $1\le a\le2$.


> $b+c+d=3-a$, $2b^{2}+3c^{2}+6d^{2}=5-a^{2}$, 由柯西不等式有
> $(2b^{2}+3c^{2}+6d^{2})=(2b^{2}+3c^{2}+6d^{2}) \left( \dfrac{1}{2}+\dfrac{1}{3}+\dfrac{1}{6} \right) \ge (b+c+d)^{2}$,
> 即 $5-a^{2}\ge(3-a)^{2}$ 所以 $1\le a\le2$.


#### 例 4

已知 $a,b,c>0$, 且$a+b+c=1$. 求证: $a^{3}b+b^{3}c+c^{3}a\ge abc$.

> $\dfrac{a^{3}b}{abc}+\dfrac{b^{3}c}{abc}+\dfrac{c^{3}a}{abc}+(a+b+c)=\dfrac{a^{2}}{c}+c+\dfrac{b^{2}}{a}+a+\dfrac{c^{2}}{b}+b\ge2a+2b+2c$
> 即 $\dfrac{a^{3}b+b^{3}c+c^{3}{a}}{abc} \ge a+b+c = 1$, 所以 $a^{3}b+b^{3}c+c^{3}a\ge abc$.


#### 例 5

设 a,b,c 均是正数, 且 $abc=1$, 求证: $\dfrac{1}{a^{3}(b+c)}+\dfrac{1}{b^{3}(c+a)}+\dfrac{1}{c^{3}(a+b)}\ge\dfrac{3}{2}$

> $\dfrac{1}{a^{3}(b+c)}+\dfrac{1}{b^{3}(a+c)}+\dfrac{1}{c^{3}(a+b)}=\dfrac{b^{2}c^{2}}{a(b+c)}+\dfrac{a^{2}c^{2}}{b(a+c)}+\dfrac{a^{2}b^{2}}{c(a+b)}$
>
> $\left( \dfrac{b^{2}c^{2}}{a(b+c)}+\dfrac{a^{2}c^{2}}{b(a+c)}+\dfrac{a^{2}b^{2}}{c(a+b)} \right) [a(b+c)+b(a+c)+c(a+b)] \ge (ab+ac+bc)^{2}$
>
> 所以 $\dfrac{b^{2}c^{2}}{a(b+c)}+\dfrac{a^{2}c^{2}}{b(a+c)}+\dfrac{a^{2}b^{2}}{c(a+b)}\ge\dfrac{ab+ac+bc}{2}\ge\dfrac{3\sqrt[3]{(abc)^{2}}}{2}=\dfrac{3}{2}$


#### 例 6

设a,b,c是实数,满足$a^{2}+2b^{2}+3c^{2}=\dfrac{3}{2}$,求证:$3^{-a}+9^{-b}+27^{-c}>1$.

> 由柯西不等式 $(a+2b+3c)^{2}\le(a^{2}+2b^{2}+3c^{2})(1+2+3)=9$, 故 $a+2b+3c\le3$, 所以 $3^{-a}+9^{-b}+27^{-c}\ge3\sqrt[3]{3^{-a-2b-3c}}\ge3\sqrt[3]{3^{-3}}=1$. 又因为两个不等式取等号的条件不一样,所以$3^{-a}+9^{-b}+27^{-c}>1$.

#### 例 7

$n$ 是不小于 $2$ 的正整数, 求证: $\dfrac{4}{7}<1-\dfrac{1}{2}+\dfrac{1}{3}-\dfrac{1}{4}+\cdots+\dfrac{1}{2n-1}-\dfrac{1}{2n}<\dfrac{\sqrt{2}}{2}$.

> 记 
> $$
> \begin{aligned}
> f(n)
> &= 1-\dfrac{1}{2}+\dfrac{1}{3}-\dfrac{1}{4}+\cdots+\dfrac{1}{2n-1}-\dfrac{1}{2n} \\
> &= \dfrac{1}{n+1}+\dfrac{1}{n+2}+\dfrac{1}{n+3}+\cdots+\dfrac{1}{2n}
> \end{aligned}
> $$
> 有 $f(n)\cdot[(n+1)+(n+2)+(n+3)+\cdots+2n]\ge(1+1+1+\cdots+1)^{2}=n^{2}$, 即 $f(n)\cdot\dfrac{n(3n+1)}{2}\ge n^{2}$, 所以 $f(n)>\dfrac{2n^{2}}{n(3n+1)}=\dfrac{2n}{3n+1}\ge\dfrac{2\cdot2}{3\cdot2+1}=\dfrac{4}{7}$;
>
> $$
> \begin{aligned}{}
> [f(n)]^2
> &= \left( \dfrac{1}{n+1}\times1+\dfrac{1}{n+2}\times1+\dfrac{1}{n+3}\times1+\cdots\dfrac{1}{2n}\times1 \right)^{2} \\
> &\le \left[ \left(\dfrac{1}{n+1}\right)^{2} + \left(\dfrac{1}{n+2}\right)^{2} + \left(\dfrac{1}{n+3}\right)^{2}+\cdots + \left(\dfrac{1}{n+n}\right)^{2} \right] \cdot n \\
> &< [\dfrac{1}{n(n+1)}+\dfrac{1}{(n+1)(n+2)}+\cdots+\dfrac{1}{(2n-1)2n}]n \\
> &=n(\dfrac{1}{n}-\dfrac{1}{n+1}+\dfrac{1}{n+1}-\dfrac{1}{n+2}+\cdots+\dfrac{1}{2n-1}-\dfrac{1}{2n})=\dfrac{1}{2}
> \end{aligned}
> $$
>
> 所以 $f(n)<\dfrac{\sqrt{2}}{2}$.


#### 例 8

已知 $a_{1},a_{2},\cdots,a_{n}$, $b_{1},b_{2},\cdots,b_{n}$ 是正数, 求证:
$\dfrac{a_{1}^{2}}{b_{1}}+\dfrac{a_{2}^{2}}{b_{2}}+\cdots+\dfrac{a_{n}^{2}}{b_{n}}\ge\dfrac{(a_{1}+a_{2}+\cdots+a_{n})^{2}}{b_{1}+b_{2}+\cdots+b_{n}}$.

> $\left( \dfrac{a_{1}^{2}}{b_{1}}+\dfrac{a_{2}^{2}}{b_{2}}+\cdots+\dfrac{a_{n}^{2}}{b_{n}}\right) (b_{1}+b_{2}+\cdots+b_{n})\ge(a_{1}+a_{2}+\cdots+a_{n})^{2}$, 所以
> $\dfrac{a_{1}^{2}}{b_{1}}+\dfrac{a_{2}^{2}}{b_{2}}+\cdots+\dfrac{a_{n}^{2}}{b_{n}}\ge\dfrac{(a_{1}+a_{2}+\cdots+a_{n})^{2}}{b_{1}+b_{2}+\cdots+b_{n}}$.

#### 例 9

利用柯西不等式证明$\sqrt{\dfrac{a_{1}^{2}+a_{2}^{2}+\cdots+a_{n}^{2}}{n}} \ge \dfrac{a_{1}+a_{2}+\cdots+a_{n}}{n} \ge \dfrac{n}{\dfrac{1}{a_{1}}+\dfrac{1}{a_{2}}+\cdots+\dfrac{1}{a_{n}}}$.

> $$
> \begin{aligned}
> & \sqrt{\dfrac{a_{1}^{2}+a_{2}^{2}+\cdots+a_{n}^{2}}{n}} \\
> &= \sqrt{(a_{1}^{2}+a_{2}^{2}+\cdots+a_{n}^{2}) \left( \dfrac{1}{n^{2}}+\dfrac{1}{n^{2}}+\cdots+\dfrac{1}{n^{2}} \right)} \\
> & \ge\dfrac{a_{1}+a_{2}+\cdots+a_{n}}{n}
> \end{aligned}
> $$
>
> 又
> $$
> \begin{aligned}
> & ( a_{1}+a_{2}+\cdots+a_{n} ) \cdot \left( \dfrac{1}{a_{1}}+\dfrac{1}{a_{2}}+\cdots+\dfrac{1}{a_{n}} \right) \\
> &\ge \left( \sqrt{a_1} \cdot \sqrt{\dfrac1{a_1}} + \sqrt{a_2} \cdot \sqrt{\dfrac1{a_2}} + \dots + \sqrt{a_n} \cdot \sqrt{\dfrac1{a_n}} \right)^2 \\
> &= n^2
> \end{aligned}
> $$
> 所以 $\dfrac{a_{1}+a_{2}+\cdots+a_{n}}{n}\ge\dfrac{n}{\dfrac{1}{a_{1}}+\dfrac{1}{a_{2}}+\cdots+\dfrac{1}{a_{n}}}$.


#### 例 10

已知$x_{1},x_{2},\cdots,x_{n}$是正数,求证:$\dfrac{1}{x_{1}}+\dfrac{1}{x_{2}}+\cdots+\dfrac{1}{x_{n}}\ge\dfrac{n^{2}}{x_{1}+x_{2}+\cdots+x_{n}}$.

> $$
> \begin{aligned}
> & ( x_{1}+x_{2}+\cdots+x_{n} ) \cdot \left( \dfrac{1}{x_{1}}+\dfrac{1}{x_{2}}+\cdots+\dfrac{1}{x_{n}} \right) \\
> &\ge \left( \sqrt{x_1} \cdot \sqrt{\dfrac1{x_1}} + \sqrt{x_2} \cdot \sqrt{\dfrac1{x_2}} + \dots + \sqrt{x_n} \cdot \sqrt{\dfrac1{x_n}} \right)^2 \\
> &= n^2
> \end{aligned}
> $$
>
> 所以 $\dfrac{1}{x_{1}}+\dfrac{1}{x_{2}}+\cdots+\dfrac{1}{x_{n}}\ge\dfrac{n^{2}}{x_{1}+x_{2}+\cdots+x_{n}}$.


#### 例 11

已知 $a_{1},a_{2},\cdots,a_{n}$ 均为正数, 且 $a_{1}+a_{2}+\cdots+a_{n}=1$, 求证:

(1) $\dfrac{a_{1}^{2}}{a_{1}+a_{2}}+\dfrac{a_{2}^{2}}{a_{2}+a_{3}}+\cdots+\dfrac{a_{n}^{2}}{a_{n}+a_{1}}\ge\dfrac{1}{2}$;
(2) $\dfrac{a_{1}^{2}}{1+a_{1}}+\dfrac{a_{2}^{2}}{1+a_{2}}+\cdots+\dfrac{a_{n}^{2}}{1+a_{n}}\ge\dfrac{1}{n+1}$.

> (1)
> $$
> \begin{aligned}
> & \dfrac{a_{1}^{2}}{a_{1}+a_{2}}+\dfrac{a_{2}^{2}}{a_{2}+a_{3}}+\cdots+\dfrac{a_{n}^{2}}{a_{n}+a_{1}} \\
> &= \left( \dfrac{a_{1}^{2}}{a_{1}+a_{2}}+\dfrac{a_{2}^{2}}{a_{2}+a_{3}}+\cdots+\dfrac{a_{n}^{2}}{a_{n}+a_{1}} \right) \cdot \dfrac{(a_{1}+a_{2})+(a_{2}+a_{3})+\cdots+(a_{n}+a_{1})}{2} \\
> &\ge\dfrac{(a_{1}+a_{2}+\cdots+a_{n})^{2}}{2}=\dfrac{1}{2}
> \end{aligned}
> $$
> (2)
> $$
> \begin{aligned}
> & \left( \dfrac{a_{1}^{2}}{1+a_{1}}+\dfrac{a_{2}^{2}}{1+a_{2}}+\cdots+\dfrac{a_{n}^{2}}{1+a_{n}} \right) \cdot (n+1) \\
> &= \left( \dfrac{a_{1}^{2}}{1+a_{1}}+\dfrac{a_{2}^{2}}{1+a_{2}}+\cdots+\dfrac{a_{n}^{2}}{1+a_{n}} \right) \cdot [(1+a_{1})+(1+a_{2})+\cdots+(1+a_{n})] \\
> &\ge (a_{1}+a_{2}+\cdots+a_{n})^{2}=1
> \end{aligned}
> $$
>  所以原不等式成立.

### `十面埋伏`

#### 例 12

已知 $x\in \mathbb R$, 求 $\sqrt{4x+3}+2\sqrt{1-2x}$ 的最大值.

> $$
> \begin{aligned}
> \sqrt{4x+3}+2\sqrt{1-2x}
> &= \sqrt{4x+3}+\sqrt{2}\sqrt{2-4x} \\
> & \le\sqrt{(1+2)(4x+3+2-4x)}=\sqrt{15}
> \end{aligned}
> $$
>

### `剑指八方`

#### 例 13

(1) 设三个正实数 $a,b,c$ 满足条件$(a^{2}+b^{2}+c^{2})^{2}>2(a^{4}+b^{4}+c^{4})$. 求证: $a,b,c$ 一定是某个三角形的三条边长;
(2) 设 $n$ 个正实数 $a_{1},a_{2},\cdots,a_{n}$ 满足不等式 $(a_{1}^{2}+a_{2}^{2}+\cdots+a_{n}^{2})^{2}>(n-1)(a_{1}^{4}+a_{2}^{4}+\cdots+a_{n}^{4})$, 其中 $n>3$, 求证: $\{a_{1},a_{2},\cdots,a_{n}\}$ 中任何三个数一定是某个三角形的三条边长.

> (1) $(a^{2}+b^{2}+c^{2})^{2}-2(a^{4}+b^{4}+c^{4}) = -(a^{2}+b^{2}-c^{2})^{2}+4a^{2}b^{2} \ge 0$, 
>
> 所以有 $4a^{2}b^{2}\ge(a^{2}+b^{2}-c^{2})^{2}$, 即 $2ab\ge a^{2}+b^{2}-c^{2}$ 且
> $2ab\ge c^{2}-a^{2}-b^{2}$, 整理得 $(a-b)^{2}\le c^{2}\le(a+b)^{2}$, 所以 $a,b,c$ 可以构成三角形.
>
> (2) 由柯西不等式
> $$
> \begin{aligned}
> & (a_{1}^{2}+a_{2}^{2}+\cdots+a_{n}^{2})^{2} \\
> &= \left( \dfrac{a_{1}^{2}+a_{2}^{2}+a_{3}^{2}}{2}+\dfrac{a_{1}^{2}+a_{2}^{2}+a_{3}^{2}}{2}+a_{4}^{2}+\cdots+a_{n}^{2} \right)^{2} \\
> &\le(n-1) \cdot \left[ \dfrac{(a_{1}^{2}+a_{2}^{2}+a_{3}^{2})^{2}}{4}+\dfrac{(a_{1}^{2}+a_{2}^{2}+a_{3}^{2})^{2}}{4}+a_{4}^{4}+\cdots+a_{n}^{4} \right]
> \end{aligned}
> $$
> 故 $a_{1}^{4}+a_{2}^{4}+\cdots+a_{n}^{4} < \dfrac{(a_{1}^{2}+a_{2}^{2}+a_{3}^{2})^{2}}{4}+\dfrac{(a_{1}^{2}+a_{2}^{2}+a_{3}^{2})^{2}}{4}+a_{4}^{4}+\cdots+a_{n}^{4}$,
>
> $2(a_{1}^{4}+a_{2}^{4}+a_{3}^{4})<(a_{1}^{2}+a_{2}^{2}+a_{3}^{2})^{2}$, 即为上一问的情形. 由 $a_{1},a_{2},\cdots,a_{n}$ 的对称性知任意三数可得到如上结论.

### `课后阅读` 柯西的故事

他教书的方法独创一格，

总是由最基本的法则，

精确的、仔细的，切入重点。

只要他手上拿着粉笔，他就愈讲愈好，

只要教室有黑板，他对公式就愈解愈流畅。

每次，他进入教室，

他的精神抖擞，

他一站在讲台，就环视每一个同学，

他的眼睛炯炯明亮，

每一位学生似乎都感染到，

有趣的事情将要发生。

他开始讲解时，

学生就知道期待没有落空。

他经常愈教愈快乐，

因为他上课前，还不太懂的，

在教学生的时候，就明白了。

——柯西的学生对柯西的评价



教育的改革 

奥古斯丁·路易斯·柯西（1789--1857），法国数学家。柯西曾担任法国“科学协会天文数学学会”的主席，并参与教育部科学教材的编修，他大力修改教材与课程。他提出：“当我看到统治阶层视百姓为玩物，聪明的人轻看穷苦的人，我就认为过去不注重人性关怀的教育，实在有偏差。真正的教育必须是‘善良’的教育，否则教育的产物，将沦成社会不平的导火线，与犯罪者的工具。要让教育走向善良的方向，要教导人勒住自己贪得无餍的心。教育要不断提醒学生，使人行善”。他也与一些好友组成一个“大学教师教学联盟”，每星期二晚上，向人分享最新科学的发展。

1835年他写道：“科学教育的背后，要有伦理的支持。伦理的产生是源自对上帝的敬畏，学生才能有蒙福的一生，如同生长在溪水边的果树”。1842年，他还在学校开设圣经希伯来文的查经班。

 

典范的教育

柯西始终热爱教育，他写道：“学生若愿意走在正确的路上，必须开放自己的心胸去学习。要以学习为生活的常态，以真理与美善，作为内心的至爱。以免落入世界上经常令人心怀二意的波浪与试探中，以后的日子才能光辉照耀。而要成就这一切，必须要有人成为他们的典范，尽量地与年轻学子，分享他们学习与努力的过程，持续良善与关爱来鼓励学子。”他一生帮助许多学生，许多后来也成为著名的学者，例如投影几何学的朋斯欧，多次方程式微分解的埃尔米特，提出线性微分方程式解的布理欧，几何学的傅雷尔等。这些学者一起与柯西合作，使法国在十九世纪后期，成为普世的数学中心。

晚年，柯西投入贫民教育，他经常到孤儿院探访，教院童书写与基础的数学，他写道：“帮助穷苦家庭的孩子，让他们受到好的教育，是给他们对未来有盼望”。

1857 年 5 月 23日，他因为热病去世，去世前说的最后一句话是：

 “人总是要死的，但是，他们的功绩永存。” 

## `作业`

1. 设 $x,y,z \in \mathbb R$, 且 $\dfrac{(x-1)^{2}}{16}+\dfrac{(y+2)^{2}}{5}+\dfrac{(z-3)^{2}}{4}=1$, 求 $x+y+z$ 的最大值, 最小值.

    >$(x-1+y+2+z-3)^2 \le \left[ \dfrac{(x-1)^{2}}{16}+\dfrac{(y+2)^{2}}{5}+\dfrac{(z-3)^{2}}{4} \right] (16+5+4)$, 即 $(x+y+z)^2 \le 25$,
    >
    >$\dfrac{x-1}{16} = \dfrac{y+2}5 = \dfrac{z-3}4 = k$ 时取等号.
    >
    >根据已知条件 $25k^2 = 1$, 而 $x+y+z = 25k$. 故 $k = \dfrac15$ 时， $x+y+z$ 取得最大值 $5$; $k = -\dfrac15$ 时， $x+y+z$ 取得最大值 $-5$.

2. 设 $a,b,c$ 均为正数, 且 $a+2b+3c=2$, 求 $\dfrac{1}{a}+\dfrac{2}{b}+\dfrac{3}{c}$ 的最小值.

    >$\dfrac{1}{a}+\dfrac{2}{b}+\dfrac{3}{c} = \dfrac12 \left( \dfrac{1}{a}+\dfrac{2}{b}+\dfrac{3}{c} \right) (a+2b+3c) \ge \dfrac12 (1+2+3)^2 = 18$, 当且仅当 $a = b = c = \dfrac13$ 时取等号. 故所求的最小值为 $18$.
    >

3. 已知$a>b>c>d$,求证:$\dfrac{1}{a-b}+\dfrac{1}{b-c}+\dfrac{1}{c-d}\ge\dfrac{9}{a-d}$.

    >设 $x = a-b$, $y = b-c$, $z = c-d$, 则 $x,y,z$ 均为正数, 且 $x+y+z = a-d$. 又由柯西不等式 $\left( \dfrac1x + \dfrac1y + \dfrac1z \right) (x+y+z) \ge 9$, $\dfrac1x + \dfrac1y + \dfrac1z \ge \dfrac9{x+y+z}$, 此即为待证不等式.
    >

4. 已知实数 $a,b,c,d,e$ 满足 $a+b+c+d+e=8$, $a^{2}+b^{2}+c^{2}+d^{2}+e^{2}=16$, 求 $e$ 的取值范围.

    >$8-e= a+b+c+d$, $16-e^2 = a^2 + b^2 + c^2 + d^2$. 
    >由柯西不等式 $(a^2 + b^2 + c^2 + d^2)(1+1+1+1) \ge (a+b+c+d)^2$, 即 $4(16-e^2) \ge (8-e)^2$, 解得 $0 \le e \le \dfrac{16}5$.

## `测试`

1. 用柯西不等式证明: $(ab+cd)(ac+bd) \ge 4abcd$. (6分)

    >$(ab+cd)(ac+bd) \ge (\sqrt{a^2bc} + \sqrt{bcd^2})^2 = bc(a+d)^2 \ge 4abcd$.
    >

2. 已知 $a,b\in \mathbb R$, 且 $a+b=1$, 求 $\sqrt{2a+1}+\sqrt{4b+1}$ 的最大值. (6分)

    >$\left( \sqrt{2a+1}+\sqrt{4b+1} \right)^2 \le [ 2(2a+1) + (4b+1) ] \left( \dfrac12 + 1\right) = \dfrac{21}2$, 当且仅当 $4(2a+1) = 4b+1$ 时取等号, 此时 $a = \dfrac1{12}$, $b = \dfrac{11}{12}$, $\sqrt{2a+1}+\sqrt{4b+1} = \dfrac{\sqrt{42}}2$.
    >

3. 已知 $a,b,c\in \mathbb R^{+}$, 且 $a+b+c=1$, 证明不等式: $\left( a+\dfrac{1}{a} \right)^{2} + \left( b+\dfrac{1}{b} \right)^{2} + \left( c+\dfrac{1}{c} \right)^{2} \ge \dfrac{100}{3}$. (8分)

    >由柯西不等式, $\dfrac1a + \dfrac1b + \dfrac1c = \left( \dfrac1a + \dfrac1b + \dfrac1c \right) (a+b+c) \ge 9$, 故 $\dfrac1{a^2} + \dfrac1{b^2} + \dfrac1{c^2} \ge \dfrac13 \left( \dfrac1a + \dfrac1b + \dfrac1c \right)^2 \ge 27$; 另外 $a^2 + b^2 + c^2 \ge \dfrac13 (a+b+c)^2 = \dfrac13$. 于是
    >$$
    >\begin{aligned}
    >& \left( a+\dfrac{1}{a} \right)^{2} + \left( b+\dfrac{1}{b} \right)^{2} + \left( c+\dfrac{1}{c} \right)^{2} \\
    >&= (a^2 + b^2 + c^2) + 6 + \left( \dfrac1{a^2} + \dfrac1{b^2} + \dfrac1{c^2} \right) \\
    >&\ge \dfrac13 + 6 + 27 = \dfrac{100}3
    >\end{aligned}
    >$$
    >

