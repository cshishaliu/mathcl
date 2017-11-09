# 不等式证明的基本方法 (1)

## `讲义`

证明的基本思路是化归，化繁为简，将式子化成我们熟悉的形式或是已知的基本不等式，从而证得结论．过程中运用分析法和综合法剖析已知和待证不等式之间的关系，根据题目灵活运用反证法与数学归纳法，常会有意想不到的效果．

### 比较法 

不等式证明的基本思路即是比较不等号两边的大小，分为：
(1) 差值比较：欲证 $a \ge b$，只需证 $a - b \ge 0$；
(2) 商值比较：若 $b>0$，欲证 $a \ge b$，只需证 $\dfrac{a}b \ge 1$．

用比较法时，常常需要对式子进行适当变形，如因式分解、拆项、合并项等．

例如，证明简单柯西不等式 $(a^2 + b^2) (c^2 + d^2) \ge (ac + bd)^2$．

作差可得
$$
\begin{aligned}
& (a^2 + b^2) (c^2 + d^2) \ge (ac + bd)^2\\
&= (a^2 c^2 + a^2 d^2 + b^2 c^2 + b^2 d^2) - (a^2 c^2 + 2abcd + b^2 d^2) \\
&= (ad-bc)^2 \ge 0
\end{aligned}
$$
等号成立的条件是 $ad=bc$． 

等号成立条件

当我们要求 $A$ 的最小值（或最大值）时，通常证明 $A \ge m$，这就说明 $A$ 的最小值不会小于 $m$；那么如果我们验证了等号成立，即可说明 $A$ 的最小值是 $m$；否则，也许 $m$ 就只是我们放缩过大所得到的一个值了．

#### 例 1

用作差比较法证明不等式

(1) 已知 $ a,b \in \mathbb{R}^+ $, 并且$ a \neq b $, 求证: $ a^3 + b^3 \ge ab^2 + a^2b $;
(2) 已知 $ a,b \in \mathbb{R}^+ $,求证: $ \dfrac{a}{\sqrt{b}} + \dfrac{b}{\sqrt{a}} \ge \sqrt{a} + \sqrt{b}$.

> (1) $ a^3 +b^3 -ab^2 -a^2b = a^2 (a-b) + b^2 (b-a) = (a+b)(a-b)^2 > 0 $,
> 所以 $ a^3 + b^3 \ge ab^2 + a^2b $;
> (2) $ \dfrac{a}{\sqrt b} + \dfrac{b}{\sqrt a} - \sqrt a - \sqrt b = \dfrac{a-b}{\sqrt b} + \dfrac{b-a}{\sqrt a} = \dfrac{( \sqrt a - \sqrt b )^2(\sqrt a + \sqrt b)}{\sqrt{ab}} \ge 0 $,
> 所以 $ \dfrac{a}{\sqrt{b}} + \dfrac{b}{\sqrt{a}} \ge \sqrt{a} + \sqrt{b}$.


#### 例 2

用作商比较法证明不等式

(1) 已知 $ a,b \in \mathbb{R}^+ $, 并且 $ a \neq b $, 求证: $ a^3 + b^3 > ab^2 +a^2b $;
(2) 已知 $ a,b \in \mathbb{R}^+ $, 求证: $ a^a b^b \ge a^b b^a $;
(3) 已知 $ a,b,c \in \mathbb{R}^+ $, 并且互不相等, 求证: $ a^a b^b c^c > (abc)^\frac{a+b+c}{3} $.

> (1) $ \dfrac{a^3+b^3}{ab^2+a^2b} = \dfrac{a^2+b^2}{ab} - 1  > 1 $,  所以$ a^3 + b^3 > ab^2 +a^2b $;
>
> (2) $ \dfrac{a^a b^b}{b^a a^b} = \left( \dfrac{a}{b} \right)^{a-b} $, 若 $ a>b $ 则 $ \left( \dfrac{a}{b} \right)^{a-b} > 1 $; 若 $ a<b $ 则 $ \left( \dfrac{a}{b} \right)^{a-b} > 1 $, 所以$ a^a b^b \ge a^b b^a $;
>
> (3) 不妨设 $ a>b>c $, 则有 $  \ln a> \ln b> \ln c $, 所以 $ a \ln a+b \ln b+c \ln c > b \ln a+c \ln b+a \ln c $. 同理有 $ a \ln a+b \ln b+c \ln c > c \ln a+a \ln b+b \ln c $ 和 $ a \ln a+b \ln b+c \ln c = a \ln a+b \ln b+c \ln c $.
>
> 所以三式相加有: $ 3(a \ln a+b \ln b+c \ln c)>(a+b+c)( \ln a+ \ln b+ \ln c) $, 即 $  \ln (a^ab^bc^c) >  \ln (abc)^\frac{a+b+c}{3} $.所以原不等式成立.

#### 例 3

(1) 已知 $ a,b,x,y \in \mathbb{R}^+ $, 且$ \dfrac 1 a > \dfrac 1 b $, $ x>y $, 求证:$ \dfrac{x}{x+a} > \dfrac{y}{y+b} $;
(2) 已知$ a,b \in \mathbb{R}^+ $, $ x,y \in \mathbb{R} $, 且 $ a+b = 1 $, 求证: $ ax^2+by^2 \ge (ax+by)^2 $;
(3) 已知$ a,b,c \in \mathbb{R}^+ $, $ x,y,z \in \mathbb{R} $, 求证: $ \dfrac{b+c}{2a}x^2 + \dfrac{c+a}{2b}y^2 + \dfrac{a+b}{2c}z^2 \ge xy+yz+zx $.

> (1) 由题意$a<b$, $y<x$, 所以 $ \dfrac{x}{x+a} - \dfrac{y}{y+b} = \dfrac{xb-ay}{(a+x)(y+b)} > 0 $;
>
> (2) $ (ax^2+by^2)(a+b) - (ax+by)^2 = ab(x-y)^2 \ge 0 $;
>
> (3)
> $$
> \begin{aligned}
> & \dfrac{b+c}{2a}x^2 + \dfrac{c+a}{2b}y^2 + \dfrac{a+b}{2c}z^2 \\
> &=  \left( \dfrac{b}{2a}x^2 + \dfrac{a}{2b}y^2 \right) + \left( \dfrac{c}{2a}x^2 + \dfrac{a}{2c}y^2 \right) + \left( \dfrac{c}{2b}x^2 + \dfrac{b}{2c}y^2 \right) \\
> &\ge  xy+yz+zx 
>  \end{aligned}
> $$
>

### 构造法

我们可以通过构造函数、恒等变形、图形、数列、反例等证明不等式．

不等式在高中数学中是综合模块，和方程、函数、图形有密切的联系．如对三角函数线的应用：
$$
0 < \sin x < x < \tan x, \qquad x \in (0, \dfrac\pi2)
$$
一个好的图像可以加深我们对不等式的理解．

例如，证明简单柯西不等式 $(a^2 + b^2) (c^2 + d^2) \ge (ac + bd)^2$．对于 $AC \ge B^2$ 形式的不等式，我们可以通过移项进行观察：$(a^2 + b^2) (c^2 + d^2) - (ac + bd)^2 \ge 0$，通过与一元二次方程的判别式 $\Delta = B^2 - 4AC$ 类比，构造二次式：
$$
(ax-c)^2 + (bx-d)^2 = (a^2 + b^2) x^2 - 2(ac + bd)x + (c^2 + d^2)
$$
此式显然恒为非负, 故 $\Delta =  (ac + bd)^2 - (a^2 + b^2) (c^2 + d^2) \le 0$, 这样就完成了证明. 

又如，对于 $a^2 + b^2$, $c^2 + d^2$ 和 $ac + bd$, 我们应适当的将其与向量做类比．设向量 $\vec m = (a,b)$, $\vec n = (c,d)$, 则不难得到 $|\vec m| = \sqrt{a^2 + b^2}$, $|\vec n| = \sqrt{c^2 + d^2}$, 而 $\vec m \cdot \vec n = ac+bd$, 从而柯西不等式就等价于 $|\vec m| \cdot |\vec n| \ge |\vec m \cdot \vec n|$, 当且仅当 $\vec m$, $\vec n$ 共线时取等号. 

#### 例 4

构造函数证明不等式

(1) 已知 $ a>2,b>2 $, 求证:$ a+b<ab $;
(2) 已知 $ a,b,c \in \mathbb{R} $, 且绝对值均大于 $1$, 求证: $ ab+bc+ca+1 \ge 0 $;
(3) 已知$ a>b>c $, 且$ a+b+c=1, a^2+b^2+c^2=1 $, 求证:$ 1<a+b<\dfrac{4}{3} $.

> (1) 由题意 $ \dfrac 1 a < \dfrac 1 2 $, $ \dfrac 1 b < \dfrac 1 2 $, 所以$ \dfrac{a+b}{ab} = \dfrac{1}{a} + \dfrac{1}{b} < 1 $, 原不等式成立; 
>
> (2) 当 $a,b,c$ 同号时, 可得 $ ab+bc+ca+1 \ge 0 $成立; 当 $a,b,c$ 异号时, 有一正两负和一负两正两种情况, 不妨设:
> (i) $ a>0,b<0,c<0 $, 此时 $ bc+ab+ac+1 > ab+b+c+1 = (b+1)(c+1) > 0 $,
> (ii) $ a>0,b>0,c<0 $, 此时 $ ab+bc+ac+1 > ab-b-a+1 = (b-1)(a-1) > 0 $,
>
> 所以原不等式成立;
>
> (3) $ a^2+b^2>\dfrac{(a+b)^2}{2} $, 即 $ 1-c^2 > \dfrac{(1-c)^2}{2}$, 所以 $c\in \left( -\dfrac{1}{3},1 \right) $. 若$b \le 0 $, 则 $c < b \le 0 $, 所以 $ a > 1 $, 则$a^2 > 1$, 舍. 所以 $b>0$, $ab>0$, $a^2+b^2<(a+b)^2$, 即 $ 1-c^2<(1-c)^2 $. 综上 $c\in \left(  -\dfrac{1}{3},0 \right) $, $a+b=1-c\in \left( 1,\dfrac{4}{3} \right) $.

#### 例 5

(1) 已知 $ a \ge 3 $, 求证: $ \sqrt{a}-\sqrt{a-1}< \sqrt{a-2}-\sqrt{a-3} $;
(2) 已知 $ a,b,c $ 为 $\triangle ABC$ 的三边长, 且 $ m $ 为正数, 求证:$ \dfrac{a}{a+m} + \dfrac{b}{b+m} > \dfrac{c}{c+m} $;
(3) 已知 $ a,b,c\in \mathbb{R} $, 求证: $ \dfrac{|a+b+c|}{1+|a+b+c|} \le \dfrac{|a|}{1+|a|} + \dfrac{|b|}{1+|b|} + \dfrac{|c|}{1+|c|}$.

> (1) $ (\sqrt{a}+\sqrt{a-3})^2 - (\sqrt{a-1}+\sqrt{a-2})^2 = 2 \sqrt{a^2-3a} - 2 \sqrt{a^2-3a+2} < 0 $, 所以$ \sqrt{a}-\sqrt{a-1}< \sqrt{a-2}-\sqrt{a-3} $;
>
> (2) $ \dfrac{a}{a+m} + \dfrac{b}{b+m} - \dfrac{c}{c+m} = \dfrac{abc+2abm+m^2(a+b-c)}{(a+m)(b+m)(c+m)} >0$.
>
> (3)
> $$
> \begin{aligned}
> & \dfrac{|a|}{1+|a|} + \dfrac{|b|}{1+|b|} + \dfrac{|c|}{1+|c|} \\
> &\ge \dfrac{|a|}{1+|a|+|b|+|c|} + \dfrac{|b|}{1+|a|+|b|+|c|} + \dfrac{|c|}{1+|a|+|b|+|c|} \\
> &= \dfrac{|a|+|b|+|c|}{1+|a|+|b|+|c|} \ge \dfrac{|a+b+c|}{1+|a|+|b|+|c|}
> \end{aligned}
> $$
>

#### 例 6

(1) 已知$ a_1,a_2,\dots,a_n,b_1,b_2,\dots,b_n \in \mathbb{R}$, 求证: $\sqrt{a_1^2 + b_1^2}+\sqrt{a_2^2+b_2^2}+\dots+\sqrt{a_n^2+b_n^2} \ge \sqrt{(a_1+a_2+\dots+a_n)^2+(b_1+b_2+\dots+b_n)^2} $.
(2) 已知 $ x,y,z\in \mathbb{R}^+ $, 求证:$ \sqrt{x^2+xy+y^2}+\sqrt{y^2+yz+z^2}+\sqrt{z^2+zx+x^2} \le 2(x+y+z) $;
(3) 已知 $ 0<a_i\le 1 (i=1,2,3,4)$, 求证: $ a_1+a_2+a_3+a_4 - a_1a_2-a_2a_3-a_3a_4-a_4a_1 \le 1$.

> (1) 令 $ \vec{x_i}=(a_i,b_i),i\in (0,n),i\in \mathbb{Z} $, 则
> $$
> \begin{aligned}
> & \sqrt{a_1^2+b_1^2} + \sqrt{a_2^2+b_2^2}+\dots+\sqrt{a_n^2+b_n^2} \\
> &=  |\vec{x_1}|+|\vec{x_2}|+\dots+|\vec{x_n}| \ge  |\vec{x_1}+\vec{x_2}+\dots+\vec{x_n}| \\
> &= \sqrt{(a_1+a_2+\dots+a_n)^2+(b_1+b_2+\dots+b_n)^2}
> \end{aligned}
> $$
> (2)
> $$
> \begin{aligned}
> & \sqrt{x^2+xy+y^2}+\sqrt{y^2+yz+z^2}+\sqrt{z^2+zx+x^2} \\
> &\le  \sqrt{x^2+2xy+y^2}+\sqrt{y^2+2yz+z^2}+\sqrt{z^2+2zx+x^2} \\
> &= 2(x+y+z)
> \end{aligned}
> $$
> (3) 
> $$
> \begin{aligned}
> &a_1+a_2+a_3+a_4-a_1a_2-a_2a_3-a_3a_4-a_4a_1\\
> &= (a_1+a_3)+(a_2+a_4)-[(a_1+a_3)(a_2+a_4)] 
> \end{aligned}
> $$
> 令 $ u=a_1+a_3$, $v=a_2+a_4 $, 则 $ u,v\in (0,2] $, 此式等于 $ (1-v)u+v $, 可以看成关于$u$的一次函数.
> $v=1$时, $ (1-v)u+v=1<2$; $v\in (0,1) $时, $ (1-v)u+v<2(1-v)+v<2$; $v\in (1,2] $时, $ (1-v)u+v<v<2 $. 所以原不等式成立.

### 放缩法

有时我们直接证明不等式 $A \le B$ 较难，可以试着去找一个中间量 $C$，如果有 $A \le C$ 且 $C \le B$，自然就有 $A \le B$ 成立. 所谓“放缩”即把 $A$ 放大至 $C$，再把 $C$ 放大到 $B$．不等式证明的技巧常常体现在对放缩尺度的把握上． 

我们通常运用已知的常用不等式或不等关系来进行放缩． 

#### 例 7

(1) 已知$a>2$, 求证: $\log_a(a-1)\log_a(a+1)<1$;
(2) 已知 $ a,b\in \mathbb{R}^+ $, 且$a \neq b$, 满足 $a^3-b^3=a^2-b^2 $, 求证: $ 1<a+b<\dfrac{4}{3} $;
(3) 已知 $ a,b,c$ 不全为 $0$, 求证: $ \sqrt{a^2+ab+b^2}+\sqrt{b^2+bc+c^2}+\sqrt{c^2+ca+a^2}> \dfrac 3 2 (a+b+c) $.

> (1)
> $$
> \begin{aligned}
> \log_a(a-1)\log_a(a+1) 
> &\le  \left( \dfrac{\log_a(a-1)+\log_a(a+1)}{2} \right)^2 \\
> &= \left( \dfrac{\log_a(a^2-1)}{2} \right)^2 < \left( \dfrac{\log_a a^2}{2} \right)^2 =1 
> \end{aligned}
> $$
> (2) 由题意有 $ a+b=a^2+ab+b^2=(a+b)^2-ab $, 所以 $ (a+b)^2-(a+b)=ab<\left( \dfrac{a+b}{2} \right)^2 $, 整理得 $0<a+b<\dfrac{4}{3} $. 
> 又因为 $ (a+b)^2=a+b+ab>a+b $, 解得 $a+b>1$.
> (3) 
> $$
> \begin{aligned}
> & \sqrt{a^2+ab+b^2}+\sqrt{b^2+bc+c^2}+\sqrt{c^2+ca+a^2} \\
> &> \sqrt{a^2+ab+\dfrac{1}{4}b^2}+\sqrt{b^2+bc+\dfrac{1}{4}c^2}+\sqrt{c^2+ca+\dfrac{1}{4}a^2} \\
> &=  \dfrac{3}{2} (a+b+c)
> \end{aligned}
> $$
>

#### 例 8

(1) 已知 $a,b,c$ 为三角形的三边, 求证: $\dfrac 3 2 < \dfrac a{b+c}+\dfrac b{c+a}+\dfrac c{a+b} < 2$;
(2) 已知 $ a,b,c\in \mathbb{R}^+ $, 求证: $ \dfrac{abc}{a^3+b^3+abc} + \dfrac{abc}{b^3+c^3+abc} + \dfrac{abc}{c^3+a^3+abc} \le 1$.

> (1) 因为 $ a,b,c $ 是三角形的三边, 所以 $ \dfrac a{b+c},\dfrac b{c+a},\dfrac c{a+b}<1 $, 所以有: $ \dfrac a{b+c} < \dfrac {2a}{a+b+c} $, $ \dfrac b{a+c} < \dfrac {2b}{a+b+c} $, $ \dfrac c{a+b} < \dfrac {2c}{a+b+c} $, 三式相加得 $ \dfrac a{b+c}+\dfrac b{c+a}+\dfrac c{a+b} < 2 $;
>
> 根据柯西不等式$ [(b+c)+(a+c)+(a+b)] \left( \dfrac 1 {b+c}+\dfrac 1 {a+c}+\dfrac 1 {a+b} \right)\ge 9 $, 即 $2 \left( \dfrac {a+b+c}{b+c}+\dfrac {a+b+c}{a+c}+\dfrac {a+b+c}{a+b} \right)\ge 9 $, 所以有 $\dfrac a{b+c}+\dfrac b{c+a}+\dfrac c{a+b} > \dfrac 3 2$;
>
> (2) 由排序不等式有 $ a^3+b^3\ge a^2b+ab^2 $, 
> 所以 $ \dfrac{abc}{a^3+b^3+abc} \le \dfrac{abc}{a^2b+ab^2+abc}=\dfrac{c}{a+b+c} $, 
> 同理 $\dfrac{abc}{b^3+c^3+abc}\le \dfrac{a}{a+b+c} $ 和 $\dfrac{abc}{a^3+c^3+abc}\le \dfrac{b}{a+b+c}$, 
> 三式相加即得.

#### 例 9

(1) 已知 $f(x)=\sqrt{1+x^2}$, 求证: 当 $a\neq b$ 时, $|f(a)-f(b)|<|a-b| $;
(2) 已知数列 $T_n=\dfrac{\sin \alpha}{2}+\dfrac{\sin 2\alpha}{2^2}+\dots+\dfrac{\sin n\alpha}{2^n}$, 求证: 对任意 $ m,n\in \mathbb{N}^* $, 当 $ m<n $ 时, 都有 $ |T_m-T_n|<\dfrac{1}{2^m} $.

> (1) 
> $$
> \begin{aligned}
> |f(a)-f(b)|&= |\sqrt{1+a^2}-\sqrt{1+b^2}| \\
> &=   \left| \dfrac{(a-b)(a+b)}{\sqrt{1+a^2}+\sqrt{1+b^2}}\right| \\
> &< |a-b| 
>  \end{aligned}
> $$
> (2) 
> $$
> \begin{aligned}
> |T_m-T_n|&=  \dfrac{\sin(m+1)\alpha}{2^{m+1}} +  \dfrac{\sin(m+2)\alpha}{2^{m+2}} + \dots + \dfrac{\sin n\alpha}{2^{n}} \\
> &\le \dfrac{1}{2^{m+1}}+\dfrac{1}{2^{m+2}}+\dots+ \dfrac{1}{2^{n}} \\
> &=  \dfrac{1}{2^{m}}\left( 1-\dfrac{1}{2^{n-m}} \right) <  \dfrac{1}{2^m} 
> \end{aligned}
> $$
>

#### 例 10

证明不等式:
(1) $ 1+\dfrac{1}{\sqrt 2}+\dfrac{1}{\sqrt 3}+\dots+ \dfrac{1}{\sqrt n}<2\sqrt{n} $;
(2) $\dfrac{n(n+1)}{2}<\sqrt{1\times2}+\sqrt{2\times3}+\dots+\sqrt{n(n+1)}< \dfrac{(n+1)^2}{2} $;
(3) $1+\dfrac{1}{2^2}+\dots+\dfrac{1}{n^2}<1.75 $.

> (1) 数学归纳法, 当 $n=1$ 时, 不等式成立;
>
> 假设当 $ n=k $ 时, 不等式成立, 即 $ 1+\dfrac{1}{\sqrt 2}+\dfrac{1}{\sqrt 3}+\dots+\dfrac{1}{\sqrt k}<2\sqrt{k} $,
>
> 则当 $n=k+1$ 时, $ 1+\dfrac{1}{\sqrt 2}+\dfrac{1}{\sqrt 3}+\dots+\dfrac{1}{\sqrt {k+1}}<2\sqrt{k}+\dfrac{1}{\sqrt {k+1}} $,
>
> 由于 $ 2\sqrt{k}+\dfrac{1}{\sqrt {k+1}}-2\sqrt{k+1}=\dfrac{2\sqrt{k(k+1)}-2(k+1)}{\sqrt{k+1}}<0 $,
>
> 所以 $ n=k+1 $时, 不等式成立.
>
> (2) $\sqrt{1\times2}+\sqrt{2\times3}+\dots+\sqrt{n(n+1)} > \sqrt{1^2}+\sqrt{2^2}+\dots+\sqrt{n^2}=\dfrac{n(n+1)}{2} $,
> $$
> \begin{aligned}
> &\sqrt{1\times2}+\sqrt{2\times3}+\dots+\sqrt{n(n+1)} \\
> &< \sqrt{\left(\dfrac{3}{2}\right)^2} + \sqrt{\left(\dfrac{5}{2}\right)^2} +\dots+ \sqrt{\left(\dfrac{2n+1}{2}\right)^2} \\
> &= \dfrac{n(n+2)}{2}<\dfrac{(n+1)^2}{2} 
> \end{aligned}
> $$
> (3) 显然 $n$ 越大, 左边越大, 下面考虑 $n > 2$ 的情形.
> $$
> \begin{aligned}
> & 1+\dfrac{1}{2^2}+\dots+\dfrac{1}{n^2} \\
> &< 1+\dfrac{1}{2^2}+\dfrac{1}{2\cdot3}+\dfrac{1}{3\cdot4}+\dots+\dfrac{1}{(n-1)n} \\
> &< 1+\dfrac{1}{4}+\dfrac{1}{2}-\dfrac{1}{n} < 1.75
> \end{aligned}
> $$
>

### `十面埋伏`

#### 例 11

已知 $ a,b,c,d\in \mathbb{R}^+$, 且 $a+b+c+d=1$, 构造函数证明: $ \sqrt{4a+1}+\sqrt{4b+1}+\sqrt{4c+1}+\sqrt{4d+1}<6 $.

> 令 $f(x)=\sqrt{2(4x+1)}$, $x>0$. 有 $f(x)=\sqrt{2(4x+1)}\le \dfrac{2+4x+1}{2}=\dfrac{4x+3}{2} $.
>
> 则 $ f(a)+f(b)+f(c)+f(d) \le  \dfrac{4a+3+4b+3+4c+3+4d+3}{2}=8 $,
>
> 所以 $ \sqrt{4a+1}+\sqrt{4b+1}+\sqrt{4c+1}+\sqrt{4d+1}\le 2 \sqrt 2 <6$.

### `剑指八方`

#### 例 12

已知 $ a,b,c,d$ 均为不小于 $-1$ 的实数, 证明: $ 1+a^3+b^3+c^3+d^3 \ge \dfrac{3}{4}(a+b+c+d) $.

> 令 $f(x) = x^3 - \dfrac34x + \dfrac14 = (x+1) \left( x-\dfrac12 \right)^2$, 则 $x \ge -1$ 时, $f(x) \ge 0$.
>
> 由 $f(a) + f(b) + f(c) + f(d) \ge 0$ 可变形得到. 

## `作业`

1. 已知实数 $ a,b,c $ 满足: $ a+b+c > 0 $, $ ab+bc+ac > 0 $, $abc > 0 $, 求证: $ a>0, b>0, c>0 $.

>反证法. 假设 $a,b,c$ 中有负数, 则由 $abc>0$ 知有两个数为负, 一个为正. 不妨设 $a,b < 0$, $c>0$, 则由 $a+b+c>0$ 知 $c>-(a+b)$, $(a+b)c < -(a+b^2)$, 于是 $ab+bc+ca < ab - (a+b)^2 = -(a^2+ab+b^2) < 0$, 与已知条件矛盾. 故 $a,b,c$ 中不可能有负数.

2. 已知 $ x,y,z $ 是正实数, 求证: $ \sqrt{\dfrac{x}{y+z}} + \sqrt{\dfrac{y}{x+z}} + \sqrt{\dfrac{z}{x+y}} \ge 2 $.

>不妨设 $x+y+z = 1$, 待证不等式变形为 $ \sqrt{\dfrac{x}{1-x}} + \sqrt{\dfrac{y}{1-y}} + \sqrt{\dfrac{z}{1-z}} \ge 2$, $x,y,z \in (0,1)$.
>
>不难证明 $x \in (0,1)$ 时 $\sqrt{\dfrac{x}{1-x}} \ge 2x$. 事实上 $x \in (0,1)$ 时, $\sqrt{\dfrac{x}{1-x}} \ge 2x \Leftarrow \dfrac1{1-x} \ge 4x \Leftarrow 1-4x+4x^2 \ge 0$, 显然成立.
>
>于是 $ \sqrt{\dfrac{x}{1-x}} + \sqrt{\dfrac{y}{1-y}} + \sqrt{\dfrac{z}{1-z}} \ge 2x + 2y + 2z \ge 2$.

3. 已知 $ a,b,c,d $ 是正实数, 求证: $ 1 < \dfrac{a}{a+b+d} + \dfrac{b}{b+c+a} + \dfrac{c}{c+d+b} +\dfrac{d}{d+a+c} < 2 $.

>$$
>\begin{gathered}
>\dfrac{a}{a+b+c+d} < \dfrac{a}{a+b+d} < \dfrac{a+c}{a+b+c+d} \\
>\dfrac{b}{a+b+c+d} < \dfrac{b}{b+c+a} < \dfrac{b+d}{a+b+c+d} \\
>\dfrac{c}{a+b+c+d} < \dfrac{c}{c+d+b} < \dfrac{a+c}{a+b+c+d} \\
>\dfrac{d}{a+b+c+d} < \dfrac{d}{d+a+c} < \dfrac{b+d}{a+b+c+d}
>\end{gathered}
>$$
>
>四式相加即得.

## `测试`

1. 已知 $ |a| \neq |b| $, $ m = \dfrac{|a|-|b|}{|a-b|} $, $ n = \dfrac{|a|+|b|}{|a+b|} $, 求 $ m,n $ 之间的大小关系. (6分)

>设 $a = kb$,  则 $|a| = |k| \cdot |b|$, 依题意 $|k| \neq 1$. $b=0$ 时, $m=n=1$; 否则, $m = \dfrac{|k| - 1}{|k-1|}$, $n = \dfrac{|k|+1}{|k+1|}$.
>
>$k<-1$ 时, $-k-1<-k+1<0$, $m = \dfrac{-k-1}{-k+1} > 1$, 而 $n=\dfrac{-k+1}{-k-1} < 1$, $m>n$;
>$-1 < k < 1$ 时, $|k| < 1$, $m<0$, 而 $n=1$, $m<n$;
>$k>1$ 时, $m=n=1$.

2. 已知 $ x \ge 1 $, $y \ge 1 $, 证明: $ x+y+\dfrac{1}{xy} \le \dfrac{1}{x}+\dfrac{1}{y}+xy $. (6分)

>$$
>\begin{aligned}
>& x+y+\dfrac{1}{xy} \le \dfrac{1}{x}+\dfrac{1}{y}+xy \\
>&\Leftarrow \dfrac{1}{xy} - \dfrac{1}{x} - \dfrac{1}{y} + 1 \le xy - x - y + 1 \\
>&\Leftarrow \dfrac{(x-1)(y-1)}{xy} \le (x-1)(y-1) \Leftarrow 1 \le xy
>\end{aligned}
>$$
>
>至此不难证明.

3. 已知 $ a > b > 0 $, 求证: $ \dfrac{(a-b)^2}{8a} < \dfrac{a+b}{2} - \sqrt{ab} < \dfrac{(a-b)^2}{8b} $. (8分)

>$$
>\begin{aligned}
>\dfrac{(a-b)^2}{8a} < \dfrac{a+b}{2} - \sqrt{ab} 
>&\Leftarrow \dfrac{(\sqrt{a}+\sqrt{b})^2 (\sqrt{a}-\sqrt{b})^2}{8a} < \dfrac{(\sqrt{a}-\sqrt{b})^2}{2} \\
>&\Leftarrow (\sqrt{a}+\sqrt{b})^2 < 4a \Leftarrow \sqrt{a}+\sqrt{b} < 2\sqrt{a} \Leftarrow \sqrt{b} < \sqrt{a}
>\end{aligned}
>$$
>
>显然成立. 同理可证明 $\dfrac{a+b}{2} - \sqrt{ab} < \dfrac{(a-b)^2}{8b}$.

