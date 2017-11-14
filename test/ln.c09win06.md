# 不等式证明的基本方法 (2)

## `讲义`

### 反证法

首先假设要证明的命题是不正确的，然后利用公理，已有的定义、定理，命题的条件，逐步分析，得到和命题的条件（或已证明的定理、推论）矛盾的结论，以此说明假设的结论不成立，从而得出原来的结论是正确的．

用反证法证明不等式的步骤是: 反设命题、推导矛盾、得出结论． 

反证法适合证明“存在性问题、唯一性问题”，或带有“至少、至多”等字眼的问题，当直接证明有困难时，常采用反证法． 

#### 例 1

(1) 实数 $a$、$b$、$c$ 不全为 0 的意思是 \choice.

  A. 至多有一个为 0
  B. 均不为 0
  C. 至少有一个为 0
  D. 至少有一个不为 0

(2) 已知 $a + b + c > 0$, $ab + bc + ca > 0$, $abc > 0$, 则 $a, b, c$ 三数 \choice.

  A. 全为正数
  B. 至多有两个为正数
  C. 至多有一个为正数 0
  D. 全为负数

> (1) D. 定义.
> (2) A. 特殊值法.

#### 例 2

(1) 已知 $a, b, c, d \in \mathbb{R}$, $a + b = 1$, $c + d = 1$, 且 $ac + bd > 1$, 求证：$a$、$b$、$c$、$d$ 中至少有一个负数；
(2) 已知 $a, b, c \in (0, 1)$, 求证：$(1 - a)b$, $(1 - b)c$, $(1 - c)a$ 不能都大于 $\dfrac{1}{4}$.

> (1) 反证法. 
>
> 设 $a, b, c, d$ 都是非负数，由题意得 $a, b, c, d \in [0, 1)$,
>
> 则 $a + b + c + d = 2 = (a + c) + (b + d) \ge 2 \sqrt{ac} + 2 \sqrt{bd}$ 所以 $\sqrt{ac} + \sqrt{bd} \le 1$，
>
> 又因为 $\sqrt{ac} + \sqrt{bd} > ac + bd$ 那么 $ac + bd > 1$ 与已知矛盾，
>
> 所以假设不成立，即 $a, b, c, d$ 至少有一个为负数；
>
> (2) 设 $(1 - a)b$, $(1 - b)c$, $(1 - c)a$ 都大于 $\dfrac{1}{4}$, 则 $abc (1 - a) (1 - b) (1 - c) > \dfrac{1}{64}$,
>
> 又 $a(1 - 1) b(1 - b) c(1 - c) \le \left( \dfrac{1}{2} \right)^2 \cdot \left( \dfrac{1}{2} \right)^2 \cdot \left( \dfrac{1}{2} \right)^2 = \dfrac{1}{64}$ 矛盾，
>
> 所以假设不成立，即 $(1 - a)b$, $(1 - b)c$, $(1 - c)a$ 不能都大于 $\dfrac{1}{4}$.

#### 例 3

设 $a, b$ 是给定实数，求证：存在 $x, y \in [0, 1]$, 满足 $\vert xy - ax - by \vert \ge \dfrac{1}{3}$.


> 反证法.
>
> 设对于 $a, b$ 都不存在满足 $x, y \in [0, 1]$ 的 $x, y$ 使得 $|xy - ax -by| \ge \dfrac{1}{3}$ 成立，即 $|xy - ax -by| < \dfrac{1}{3}$ 成立；
>
> 然而，若给定 $a = 2, b = 2$, $x = \dfrac{1}{2}, y =\dfrac{1}{2}$ 时，$|xy - ax -by| = \dfrac{7}{4}$ 与假设矛盾，
>
> 所以原假设成立，即存在 $x, y \in [0, 1]$, 满足 $\vert xy - ax - by \vert \ge \dfrac{1}{3}$.

### 主元法

遇到一个含有较多未知数的不等式时，一种方法是减少它的未知数数量，称为降元．我们把其中一个未知数看成主元，其他未知数看做参数，就可以运用一系列解不等式的方法来做证明．

#### 例 4

设函数 $f(x) = mx^2 - mx - 6 + m$.

(1) 若对于 $m \in [-2, 2]$, $f(x) < 0$ 恒成立，求实数 $x$ 的取值范围；
(2) 若对于 $x \in [1, 3]$, $f(x) < 0$ 恒成立，求实数 $m$ 的取值范围.


> (1) 反解 $m$ 有 $m < \dfrac{6}{x^2 - x + 1}$, 
>
> (因为 $x^2 - x + 1 > 0$ 恒成立) 所以 $\dfrac{6}{x^2 - x + 1} > 2$ 
>
> $\therefore x \in (-1, 2)$;
>
> (2) $m < \dfrac{6}{x^2 - x + 1}$ 在 $x \in [1, 3]$ 上恒成立，
>
> 所以 $m < \left(\dfrac{6}{x^2 - x + 1}\right)_{min}$, 即 $m \in (-\infty, \dfrac{6}{7})$.
>

#### 例 5

(1) 利用主元法证明不等式 $x^2 + y^2 + z^2 \ge xy + yz + zx$;
(2) 已知 $\triangle ABC$, 证明不等式 $x^2 + y^2 + z^2 \ge 2xy \cos A + 2yz \cos B + 2zx \cos C$.


> (1) 令 $f(x) = x^2 - (y + z)x + (y^2 + z^2 - yz)$, 
>
> $\Delta = (y + z)^2 - 4(y^2 + z^2 - yz) = -3(y - z)^2 < 0$ 恒成立，
>
> 所以 $f(x) \ge 0$ 恒成立，即 $x^2 + y^2 + z^2 \ge xy + yz + zx$;
>
> (2) 要证明原不等式成立，只需证明 $x^2 + y^2 + z^2 - 2xy \cos A - 2yz \cos B - 2zx \cos C \ge 0$, 
>
> 整理有 $(x - y \cos A - z \cos C)^2 + y^2 \sin^2 A + z^2 \sin^2 C - yz(2 \cos B + 2 \cos A \cos C) \ge 0$
>
> 即证 $(x - y \cos A - z \cos C)^2 + y^2 \sin^2 A + z^2 \sin^2 C - yz \cdot 2 \sin A \sin C \ge 0$
>
> 变形整理得 $(x - y \cos A - z \cos C)^2 + (y \sin A - z \sin C)^2 \ge 0$ 显然成立，
>
> 所以原不等式成立.

### 变量替换

例：设 $a,b,c,d > 0$，且 $\dfrac{a^2}{1+a^2} + \dfrac{b^2}{1+b^2} + \dfrac{c^2}{1+c^2} + \dfrac{d^2}{1+d^2} = 1$，求证：$abcd \le \dfrac19$．

设 $a = \tan\alpha$, $b=\tan\beta$, $c=\tan\gamma$, $d = \tan\delta$, $\alpha,\beta,\gamma,\delta \in (0,\dfrac\pi2)$, 则 $\sin^2 \alpha + \sin^2 \beta + \sin^2 \gamma + \sin^2 \delta = 1$, 所以
$$
\begin{aligned}
3 \cdot \sqrt[3]{\sin^2 \alpha \sin^2 \beta \sin^2 \gamma}
&\le \sin^2 \alpha + \sin^2 \beta + \sin^2 \gamma = \cos^2 \delta \\
3 \cdot \sqrt[3]{\sin^2 \alpha \sin^2 \beta \sin^2 \delta}
&\le \sin^2 \alpha + \sin^2 \beta + \sin^2 \delta = \cos^2 \gamma \\
3 \cdot \sqrt[3]{\sin^2 \alpha \sin^2 \gamma \sin^2 \delta}
&\le \sin^2 \alpha + \sin^2 \gamma + \sin^2 \delta = \cos^2 \beta \\
3 \cdot \sqrt[3]{\sin^2 \beta \sin^2 \gamma \sin^2 \delta}
&\le \sin^2 \beta + \sin^2 \gamma + \sin^2 \delta = \cos^2 \alpha
\end{aligned}
$$
以上各式相乘, 整理可得 $\tan^2 \alpha \tan^2 \beta \tan^2 \gamma \tan^2 \delta \le \dfrac1{81}$, 即 $abcd \le \dfrac19$.

#### 例 6

已知 $x, y, z \ge 0$, 求证：$(x + y - z) (x + z - y) (y + z - x) \le xyz$.


> 当 $(x + y - z)$、$(x + z - y)$、$(y + z - x)$ 有一个负数时，原不等式左边小于零，右边大于零，所以原不等式成立；
>
> 又因为 $(x + y - z)$、$(x + z - y)$、$(y + z - x)$ 不能同时出现两个或两个以上的负数，则当 $(x + y - z)$、$(x + z - y)$、$(y + z - x)$ 都是正数时，因为
>
> $x = \dfrac{[(x + y - z) + (x - y + z)]}{2} \ge \sqrt{(x + y - z) (x - y + z)}$,
>
> $y = \dfrac{[(y + x - z) + (y - x + z)]}{2} \ge \sqrt{(y + x - z) (y - x + z)}$,
>
> $z = \dfrac{[(z + x - y) + (z - x + y)]}{2} \ge \sqrt{(z + x - y) (z - x + y)}$,
>
> 三个式子相乘得
>
> $xyz \ge (x + y - z) (x + z - y) (y + z - x)$
>
> 所以原不等式成立.
>

#### 例 7

已知 $a, b, c > 0$, 求 $\dfrac{a + 3c}{a + 2b + c} + \dfrac{4b}{a + b + 2c} - \dfrac{8c}{a + b + 3c}$ 的最小值.


> 设 $x = a + 2b + c$, $y = a + b + 2c$, $z = a + b + 3c$, 所以有
>
> $a + 3c = 2y - x$, $4b =4z + 4x - 8y$, $8c = 8z - 8y$,
>
> 所以原式等价于
>
> $\dfrac{2y - x}{x} + \dfrac{4z + 4x - 8y}{y} - \dfrac{8z - 8y}{z} 
> = -17 + \dfrac{2y}{x} + \dfrac{4z}{y} + \dfrac{4x}{y} + \dfrac{8y}{z}$
>
> 所以有 $-17 + \dfrac{2y}{x} + \dfrac{4z}{y} + \dfrac{4x}{y} + \dfrac{8y}{z} 
> \ge -17 + 12 \sqrt{2}$, 
>
> 所以有最小值 $-17 + 12 \sqrt{2}$.
>

#### 例 8

(1) 求证：$-\dfrac{1}{2} \le x \sqrt{1 - x^2} \le \dfrac{1}{2}$;
(2) 已知 $x^2 + y^2 \le 1$, 求证：$\vert x^2 + 2xy - y^2 \vert \le \sqrt{2}$.


> (1) 令 $x = \cos \theta, \theta \in [0, \pi]$, 则 
> $x \sqrt{1 - x^2} = \cos \theta \cdot \sin \theta = \dfrac{1}{2} \sin 2\theta \in \left[-\dfrac{1}{2}, \dfrac{1}{2}\right]$, 所以原不等式成立：
>
> (2) 令 $x = r \sin \alpha$, $y = r \cos \alpha$ \, $r \in [0, 1]$, 则 $|x^2 + 2xy - y^2| = r^2 |\sin^2 \alpha - \cos^2 \alpha + 2 \sin \alpha \cos \alpha| = r^2 |\sin 2\alpha - \cos 2\alpha| \ge \sqrt{2} r^2$, 所以原不等式成立.

### 齐次化思想

例：已知正数 $a,b,c$, 满足 $a+b+c=1$，证明: $\dfrac{a}{\sqrt{a+bc}} + \dfrac{b}{\sqrt{b+ca}} +\dfrac{c}{\sqrt{c+ab}} \le \dfrac32$.

注意到项 $\dfrac{a}{\sqrt{a+bc}}$ 中，分子 $a$ 中的次数是 $1$ 次的，而分母中 $\sqrt{a+bc}$ 的次数并不是齐次的．所以，考虑将分母变成 $\sqrt{a(a+b+c)+bc}$，即
$$
\dfrac{a}{\sqrt{a+bc}} = \dfrac{a}{\sqrt{a(a+b+c)+bc}} = \sqrt{\dfrac{a}{a+b}} \cdot \sqrt{\dfrac{a}{a+c}} \le \dfrac12 \left( \dfrac{a}{a+b} + \dfrac{a}{a+c} \right)
$$
然后不难证明．

#### 例 9

已知 $a, b, c \in \mathbb{R}^+$, 且 $a + b + c = 1$, 求证：

(1) $a^3b + b^3c +c^3a \ge abc$;
(2) $\dfrac{a}{a + bc} + \dfrac{b}{b + ca} + \dfrac{c}{c + ab} \le \dfrac{9}{4}$.


> (1) $\dfrac{a^3b + b^3c + c^3a}{abc} + (a + b + c)$ 
>
> $= \left(\dfrac{a^2}{c} + c\right) + \left(\dfrac{b^2}{a} + a\right) + \left(\dfrac{c^2}{b} + b\right) \ge 2 (a + b + c)$
>
> 所以原不等式成立；
>
> (2) $\dfrac{a}{a + bc} + \dfrac{b}{b + ac} + \dfrac{c}{c + ab}$ 
>
> $= (a + b + c) \left[\dfrac{a}{a(a + b + c) + bc} + \dfrac{b}{b(a + b + c) + ac}  + \dfrac{c}{c(a + b + c) + ab}\right]$
>
> $= (a + b + c) \left[\dfrac{2(ab + ac + bc)}{(a + b) (a + c) (b + c)} \right]$,
>
> 要证明原式小于 $\dfrac{9}{4}$, 只需证明 $8(a + b + c)(ab + ac + bc) \le 9(a + b) (a + c) (b + c)$,
>
> 即证 $8abc \le (a + b) (a + c) (b + c)$, 
>
> 显然 $8abc = 2 \sqrt{ab} \cdot 2 \sqrt{ac} \cdot 2 \sqrt{bc} \le (a + b) (a + c) (b + c)$, 
>
> 所以原不等式成立.

### 数学归纳法

用数学归纳法证明不等式时，我们常会结合其他比较重要的方法，例如放缩法．从“$n=k$”到“$n=k+1$”的过渡中，利用归纳假设是比较困难的一步，它不像证明恒等式问题只需拼凑出所需要的结构，还需要通过“放大”或“缩小”的过程，才能利用归纳假设．因此，我们可以综合的分析从“$n=k$”到“$n=k+1$”的变化，从中找到“放缩尺度”，准确地拼凑出所需要的结构．

#### 例 10

(1) 用数学归纳法证明 $1 + \dfrac{1}{2} + \dfrac{1}{3} + \cdots + \dfrac{1}{2^n - 1} < n (n \in \mathbb{N}^*, n > 1)$ 时，由 $n = k$ 到证 $n = k + 1$ 时，左边应增加的项数是 \choice.

  A. $2^{k - 1}$ 
  B. $2^k - 1$ 
  C. $2^k$ 
  D. $2^k + 1$

(2) 求证：$1 + \dfrac{1}{2} + \dfrac{1}{3} + \cdots + \dfrac{1}{2^{n - 1}} > \dfrac{n}{2} (n \in \mathbb{N}^*)$.


> (1) 左边增加的项是 $\dfrac{1}{2^k} + \dfrac{1}{2^k + 1} + \dfrac{1}{2^k + 2} + \cdots + \dfrac{1}{2^{k + 1} - 1}$, 所以共 $2^k$ 项，故选 C.
>
> (2) 数学归纳法. 当 $n = 1$ 时， $1 > \dfrac{1}{2}$, 满足不等式；
>
> 假设当 $n = k$ 时，原不等式成立，即 $1 + \dfrac{1}{2} + \dfrac{1}{3} + \cdots + \dfrac{1}{2^{k - 1}} > \dfrac{k}{2}$, 则当 $n = k + 1$ 时，
> $$
> \begin{aligned}
> & 1 + \dfrac{1}{2} + \dfrac{1}{3} + \cdots + \dfrac{1}{2^{k - 1}} + \dfrac{1}{2^{k - 1} + 1} + \cdots + \dfrac{1}{2^k} \\
> &> \dfrac{k}{2} + \dfrac{1}{2^{k - 1} + 1} + \cdots + \dfrac{1}{2^k} \\
> &> \dfrac{k}{2} + \dfrac{2^{k - 1}}{2^k} = \dfrac{k + 1}{2}
> \end{aligned}
> $$
> 所以原不等式成立.

#### 例 11

(1) 求证：$2^{n + 1} \ge n^2 + n +2$, $(n \in \mathbb{N}^*)$;
(2) 求证：$\dfrac{1}{\sqrt{1 \times 2}} + \dfrac{1}{\sqrt{2 \times 3}} + \cdots + \dfrac{1}{\sqrt{n \times (n + 1)}} < \sqrt{n}$, $(n \in \mathbb{N}^*)$.


> (1) 数学归纳法. 当 $n = 1$ 时， $4 \ge 4$, 满足不等式，
>
> 假设当 $n = k$ 时，原不等式成立，即 $2^{k + 1} \ge k^2 + k +2$, 则当 $n = k + 1$ 时，
>
> $$
> \begin{aligned}
> 2^{k + 2} = 2 \times 2^{k + 1} 
> &\ge 2(k^2 + k + 2) = 2k^2 + 2k + 4 \\
> &\ge k^2 + 3k + 4 = (k + 1)^2 + (k + 1) +2
> \end{aligned}
> $$
> 所以原不等式成立.
>
> (2) 数学归纳法.当 $n = 1$ 时， $\dfrac{1}{\sqrt{2}} < 1$, 满足不等式，
>
> 假设当 $n = k$ 时，原不等式成立，即 $\dfrac{1}{\sqrt{1 \times 2}} + \dfrac{1}{\sqrt{2 \times 3}} + \cdots +\dfrac{1}{\sqrt{k \times (k + 1)}} < \sqrt{k}$,
>
> 则当 $n = k + 1$ 时，
>
> $\dfrac{1}{\sqrt{1 \times 2}} + \dfrac{1}{\sqrt{2 \times 3}} + \cdots + \dfrac{1}{\sqrt{k (k + 1)}} + \dfrac{1}{\sqrt{(k + 1) (k + 2)}} < \sqrt{k} + \dfrac{1}{\sqrt{(k + 1) (k + 2)}}$,
>
> 而 $\sqrt{k} + \dfrac{1}{\sqrt{(k + 1) (k + 2)}} - \sqrt{k + 1}  = \dfrac{1}{\sqrt{(k + 1) (k + 2)}} - \dfrac{1}{\sqrt{k} + \sqrt{k + 1}}$ 在 $k \ge 2$ 时恒为负.
>

#### 例 12

(1) 求证：$\dfrac{1}{2^2} + \dfrac{1}{3^2} + \cdots + \dfrac{1}{n^2} < 1 (n \in \mathbb{N}^*, n \ge 2)$;
(2) 已知不等式 $\dfrac{1}{n + 1} + \dfrac{1}{n + 2} + \dfrac{1}{n + 3} + \cdots + \dfrac{1}{3n + 1} > \dfrac{a}{24}$ 对 $n \in \mathbb{N}^*$ 均成立，求正整数 $a$ 的最大值并证明.


> (1) $\dfrac{1}{2^2} + \dfrac{1}{3^2} + \cdots + \dfrac{1}{n^2} < \dfrac{1}{1 \times 2} + \dfrac{1}{2 \times 3} + \cdots + \dfrac{1}{(n - 1) \times n} = 1 - \dfrac{1}{n} < 1$.
>
> (2) 设 $f(n) = \dfrac{1}{n + 1} + \dfrac{1}{n + 2} + \dfrac{1}{n + 3} + \cdots + \dfrac{1}{3n + 1}$ 
>
> 则 $f(n + 1) = \dfrac{1}{n + 2} + \dfrac{1}{n + 3} + \dfrac{1}{n + 4} + \cdots + \dfrac{1}{3n + 2} + \dfrac{1}{3n + 3} + \dfrac{1}{3n + 4}$
>
> 所以 $f(n + 1) - f(n) = \dfrac{1}{3n + 2} + \dfrac{1}{3n + 3} + \dfrac{1}{3n + 4} - \dfrac{1}{n + 1} > 0$, 所以 $f(n)$ 单调递增，由题意只需 $f(1) = \dfrac{1}{2} + \dfrac{1}{3} + \dfrac{1}{4} = \dfrac{26}{24} > \dfrac{a}{24}$, 即 $a$ 的最大值为 25.

### `十面埋伏`

#### 例 13

已知数列 $\{a_n\}$ 满足 $a_1 > 1$, 且 $a_{n + 1} = \dfrac{a_n(a_n^2 + 3)}{3a_n^2 + 1}$, 求证：$a_n > a_{n + 1} > 1$.


> 数学归纳法. 当 $n = 1$ 时， $a_1 > 1$, 满足不等式 $a_n > 1$.
>
> 假设当 $n = k$ 时，满足不等式 $a_k > 1$，则当 $n = k + 1$ 时，
>
> $a_{n + 1} - 1 = \dfrac{a_n(a_n^2 + 3)}{3a_n^2 + 1} - 1 =  \dfrac{(a_n - 1)^3}{3a_n^2 + 1} > 0$, 所以 $a_n > 1$ 成立；
>
> $\dfrac{a_{n + 1}}{a_n} = \dfrac{a_n(a_n^2 + 3)}{3a_n^2 + 1} =  \dfrac{1}{3} +  \dfrac{8}{9a_n^2 + 3} < 1$ 
>
> 所以可得 $a_n > a_{n + 1} > 1$.

### `剑指八方`

#### 例 14 `磨光变换简介`

设 $x_i$ ($1 \le i \le n$, $n$ 是给定的自然数, $n \ge 1$) 是非负实数, 且 $x_1 + x_2 + \cdots + x_n = \dfrac{1}{2}$, 求 $(1 - x_1)(1 - x_2) \cdots (1 - x_n)$ 的最大值和最小值.


> 最大值是显然的：$(1 - x_1)(1 - x_2) \cdots (1 - x_n) \le \left(\dfrac{1 - x_1 + 1 - x_2 + \cdots + 1 - x_n}{n}\right)^n = \left(1 - \dfrac{1}{2n}\right)^n$.
>
> 在求最小值时，发现若 $x_1, x_2, \cdots, x_{n - 2}$ 都固定，则 $(x_n + x_{n - 1})$ 也就固定下来了，并且注意到 $(1 - x_{n - 1})(1 - x_n) = 1 - (x_n + x_{n - 1}) + x_n x_{n - 1} = 1 - (x_n + x_{n - 1}) + \dfrac{(x_n + x_{n - 1})^2 - (x_n - x_{n - 1})^2}{4}$, 从而 $x_n$ 和 $x_{n - 1}$ 相差越大，原式的值就越小. 即：$x_1, x_2, \cdots, x_{n - 2}$ 都固定的情况下, $x_n = 0$ 时，原式最小. 做变换
> $$
> \begin{cases}
>  x_1' = x_1 \\
>  x_2' = x_2 \\
>  \vdots \\
>  x_{n - 1}' = x_{n - 1} + x_n \\
>  x_n' = 0
> \end{cases}
> $$
> 这样可以做到
>
> (1) 条件没有变：$x_1' + x_2' + \cdots + x_n' = \dfrac{1}{2}$；
> (2) 问题没有变：$(1 - x_1')(1 - x_2') \cdots (1 - x_n')$ 的最小值恰是 $(1 - x_1)(1 - x_2) \cdots (1 - x_n)$ 的最小值；
> (3) 变量的个数减少了：由于 $x_n' = 0$, 上述操作把 $n$ 个变量的问题转化成了 $(n - 1)$ 个变量的问题；
>
> 依此类推，最终可知 $x_1 = \dfrac{1}{2}, x_2 = x_3 = \cdots = x_n = 0$ 时，可以使 $(1 - x_1)(1 - x_2) \cdots (1 - x_n)$ 取到最小值.

### `课后阅读` 数学笑话

1、故事背景：某地、某校、某班进行了一次考试。其中有一试题为：某人一天吃 $3$ 个苹果，问此人 $4$ 天吃几个苹果？某生答曰：$4 \times 3=12$ 个也。师大怒，曰：汝之不惠！此题应为：$3 \times 4=12$ 个也。吾闻此事，乃大惊，即以此事请教数学大师也。

牛顿：如果这张试卷落在我肩上，我一样可以发现万有引力。因为我是站在无数张试卷上才能望的更远。

祖冲之：此题在《九章算数》的第二章第三节中有述。

欧几里德：老师为什么不用几何的方法解这道题目？我所研究的几何可是建立在公理的基础上的。

毕达歌拉斯： $3 \times 4$？唔，第三边应该是 $5$。 

高斯：我不能表扬这位学生，因为表扬他就是表扬我自己。

陈景润：我的最好成绩是 $1+2$。 

王元：这道题目的难度可放在以后的全国数学竞赛中。 

笛卡尔：让我躺到床上去想一想。 

欧拉：可以用心算吗？ 

柯西：难道还要用高等数学来求？ 

费马：你问我这个问题是需要用数学方法解决还是用法律方式解决？ 

希尔伯特：为什么不早一点说这个问题？否则我就把他列入第 $24$ 个问题了。 

罗素：好小子，想挑起第四次数学危机吗！ 

爱因斯坦：这么难的问题来问我？不知道我数学能力不强吗？

2、只有两种人

世界上有两种数学家: 会数数的和不会数数的。

世界上有两种人：一种相信世界上的人分为两种， 一种不相信。 

世界上有两种人： 一种可以被归类于两种人之一， 一种不可以。 

## `作业`

1. 已知 $a, b, c \in (-2, 1)$, 求证：$abc > a + b + c -2$.

>令 $f(a) = abc-(a+b+c)+2$, 要证明 $f(a)>0$ 在 $a \in (-2,1)$ 时恒成立, 只需证明 $f(-2) \ge 0$ 以及 $f(1) \ge 0$. 其中, $f(1) = bc -b - c + 1 = (b-1) (c-1)$ 显然为正.
>
>$f(-2) = -2bc - b - c + 4$, 令 $g(b) = -2bc-b-c+4$, 要证明 $g(b) \ge 0$ 在 $b \in (-2,1)$ 上恒成立, 只需证明 $g(-2) \ge 0$ 以及 $g(1) \ge 0$. $g(-2) = 3c+6$, 而 $g(1) = -3c+3$, 由于 $c \in (-2,1)$, 所以 $g(-2) >0$, $g(1)>0$, 于是 $g(b) = f(-2)>0$.
>
>综上, $f(a)>0$, 证毕.

2. 已知 $f(x) = x^2 + px + q$, 求证：$\vert f(1) \vert$、$|f(2)|$、$|f(3)|$ 中至少有一个不小于 $\dfrac{1}{2}$.

>反证法. 假设这三个数都小于 $\dfrac12$, 即 $|1+p+q| < \dfrac12$, $|4+2p+q| < \dfrac12$, $|9+3p+q| < \dfrac12$, 分别可变形得 $-\dfrac32 < p+q < -\dfrac12$, $-\dfrac92 < 2p+q < -\dfrac72$, $-\dfrac{19}2 < 3p+q < -\dfrac{17}2$. 第一个和第三个式子叠加可得 $-\dfrac{11}2 < 2p+q < -\dfrac92$, 与第二个式子矛盾.

3. 设 $n$ 是正整数，求证：$\left(1 + \dfrac{1}{n}\right)^n < \left(1 + \dfrac{1}{n + 1}\right)^{n + 1}$.

>由平均值不等式, 
>$$
>\begin{aligned}
>\sqrt[n+1]{ \left(1 + \dfrac{1}{n}\right)^n }
>&= \sqrt[n+1]{  \underbrace{\left(1 + \dfrac{1}{n}\right) \cdot \dots \cdot \left(1 + \dfrac{1}{n}\right)}_{n~\text{个}} \cdot 1 }\\
>&\le \dfrac1{n+1} \cdot \left[ \underbrace{ \left(1 + \dfrac{1}{n}\right) + \dots+ \left(1 + \dfrac{1}{n}\right) }_{n~\text{个}} + 1 \right] \\
>&= 1 + \dfrac1{n+1}
>\end{aligned}
>$$
>因此, $\left(1 + \dfrac{1}{n}\right)^n < \left(1 + \dfrac{1}{n + 1}\right)^{n + 1}$.

4. 设 $a > 2$, 给定数列 $\{x_n\}$, 其中 $x_1 = a$, $x_{n + 1} = \dfrac{x_n^2}{2(x_n - 1)}$, $n = 1, 2, \cdots$. 求证：

(1) $x_n > 2$, $\dfrac{x_{n + 1}}{x_n} < 1$, $(n = 1, 2, \cdots)$;
(2) 如果 $a \le 3$, 那么 $x_n \le 2 + \dfrac{1}{2^{n - 1}}$, $(n = 1, 2, \cdots)$.


>(1) $\dfrac{x_{n+1}}{x_n} = \dfrac{x_n}{2x_n - 1} = \dfrac12 - \dfrac1{4x_n-2}$.
>
>$x_1 = a > 2$, $\dfrac{x_2}{x_1} = \dfrac12 - \dfrac1{4x_1 -2} = \dfrac12 - \dfrac1{4a -2} < 1$, 故 $n = 1$ 时, 待证结论成立.
>
>设待证结论在 $n = k$ 时成立, 即有 $x_k > 2$, $\dfrac{x_{k + 1}}{x_k} < 1$. 则 $n = k+1$ 时, $x_{k + 1}-2 = \dfrac{x_k^2}{2(x_k - 1)} - 2 = \dfrac{x_k^2 - 4 x_k + 4}{2(x_k - 1)} = \dfrac{(x_k-2)^2}{2(x_k - 1)} > 0$, 故 $x_{k+1} > 2$; $\dfrac{x_{k+1}}{k_n} =  \dfrac12 - \dfrac1{4x_k-2} < 1$. 待证结论成立.
>
>(2) 不难验证 $n=1$ 时待证结论成立. 设待证结论在 $n = k$ 时成立, 即有 $x_k \le 2 + \dfrac{1}{2^{k - 1}}$. 则 $n = k+1$ 时, 
>
>令 $f(x) = \dfrac{x^2}{2(x-1)} = \dfrac12 \left( x-1 + \dfrac1{x-1} +2 \right)$, 不难验证 $f(x)$ 在 $(2,+\infty)$ 上单调递增, 故 $x_{k+1} = f(x_k) \le f \left( 2+\dfrac1{2^{k-1}} \right) = \dfrac{(2+\dfrac1{2^{k-1}})^2}{2+\dfrac1{2^{k-2}}}$, $x_{k+1} - \left( 2+\dfrac1{2^k} \right) = \dfrac{\left( 2+\dfrac1{2^{k-1}} \right)^2 - \left( 2+\dfrac1{2^k} \right)\left( 2+\dfrac1{2^{k-2}} \right)}{2+\dfrac1{2^{k-2}}} = \dfrac{ -\dfrac1{2^k} }{2+\dfrac1{2^{k-2}}} < 0$, 故 $x_{k+1} < 2+\dfrac1{2^k}$, 待证结论成立.



1

