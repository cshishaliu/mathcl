#  游戏与对策续与操作问题

## `讲义`

### 游戏与对策 $^{【续】}$

#### 例 1

一场数学游戏在两个非常聪明的学生甲、乙之间进行. 裁判先在黑板上写出下面的正整数 $2,3,4, \cdots,2006$, 然后随意擦去一个数. 接下来由乙、甲两人轮流擦去其中的一个数 (即乙先擦去其中的一个数, 然后甲再擦去一个数, 如此轮流下去). 若最后剩下的两个数互质, 则判甲胜; 否则, 判乙胜. 按照这种游戏规则, 求甲获胜的概率. (用具体的数字作答)

> (1) 若裁判擦去的是奇数, 此时乙一定获胜.
>
> 乙不管甲取什么数, 只要还有奇数, 就擦去奇数, 这样最后两个数一定都是偶数, 从而所剩两数不互质, 故乙胜;
>
> (2) 若裁判擦去的数是偶数, 此时甲一定获胜.
>
> 设裁判擦去的数是 $2m$, 则将所剩的数配成 1002 对: $(2, 3), \cdots, (2m+1, 2m+2), (2005,2006)$. 这样, 不管乙取哪一个数, 甲就去所配数对中的另一个数, 这样最后剩下的两数必然互质, 故甲胜.
>
> 所以, 甲获胜的概率为 $\dfrac {1003}{2005}$.

#### 例 2 `2010 年全国高中数学联赛安徽省预赛`

桌上放有 $n$ 根火柴, 甲乙二人轮流从中取走火柴, 甲先取, 第一次可取走至多 $n - 1$ 根火柴. 之后每人每次至少取走一根火柴, 但是不超过对方刚才取走火柴数目的两倍. 取得最后一根火柴者获胜. 问: 当 $n = 100$ 时, 甲是否有获胜的策略? 请详细说明理由.


> 把所有使得甲没有有获胜策略的初始火柴数目 $n$ 从小到大排序为: $n_1, n_2 , n_3, \cdots$, 不难发现其前 4 项分别为 $2,3,5,8$. 下面我们用数学归纳法证明:
>
> (1) $\{n_i\}$ 满足 $n_{i +1} = n_i + n_{n-1}$;
>
> (2) 当 $n = n_i$ 时, 乙总可取到最后一根火柴, 并且乙此时所取的火柴数目 $\le n_{i-1}$;
>
> (3) 当 $n_i < n < n_{i +1}$ 时, 甲总可取到最后一根火柴, 并且甲此时所取的火柴数目 $\le n_i$.
>
> 设 $k = n - n_i ( i \ge 4 )$, 注意到 $n_{i -2} < \dfrac  {n_i} 2 < n_{i -1}$. 火柴数目 $\le n_{i-2}$, 剩余 $n_i > 2n_{i -2}$ 根火柴, 乙无法获胜. 
>
> 当 $k = n_{i - 1}$ 时, 设甲第一次时取走 $m$ 根火柴, 若 $m \ge k$, 则乙可取走所有剩小的火柴.

#### 例 3

在黑板上写着 $1、2、3、...、2009$ 这 2009 个数,每次操作可以擦去两个奇偶性相同的数,再写
上它们的平均数,最后黑板上只剩下一个自然数,那么这个自然数最大是多少?

> 2008.

### 操作问题

#### 例 4 `1997-1998 联邦区域竞赛(第四轮) 十一年级 165`

黑板上写着一个正整数. 记住它的最后一位数字后擦去末位数, 再将所得的数与被擦去的末位数的 5 倍相加, 得到一个新数. 假定开始时写的是 $7^{1998}$. 能否通过若干次这种操作,得到数 $1998^7$?

> 不能, 模 7 保持不变.

#### 例 5 `1993-1994 联邦区域竞赛(第四轮) 十一年级 44` 

在凸 $n$ 边形的各个顶点上共放着 $m$ 枚棋子 $(m > n)$. 每一次操作可移动两枚同处一个顶点的棋子到相邻顶点: 一枚顺时针移动, 一枚逆时针移动, 证明: 如果经过若干次操作之后, 各个顶点的棋子数变得与开始时相同, 则所作的操作次数是 $n$ 的倍数.

> 设每个顶点操作 $a_k (k = 1,2,3, \cdots, n)$ 次, 则 $a_i =\dfrac {a_{i-1}+a_{i+1}}2$, 于是 $a_1 = a_2 = \cdots  a_n$.

#### 例 6 `1997-1998 全俄决赛(第五轮）十年级 557`

> 不可能, 要操作相同的次数, 而最后一次操作前只能为 $n$ 和 $n^2 - 1$, 但是要从前一个完全平方数变为 $n^2 - 1$ 需要操作的次数太多.

#### 例 7

黑板上开始时有 0 和 1 两个数. 每次操作可以在黑板上写已有数中任意多个数的平均数, 但不能写重复的数. 求证: 可以写出 0 和 1 之间的任何有理数.

#### 例 8

一个 $5\times5$ 的方格中有一个方格填有 ''-'' 号, 其它方格全部填 "+"号. 每次操作可以将某个 $2\times 2、3\times 3、4\times 4、5\times 5$ 中的所有方格全部变号. 请求出开始填有 "-" 号方格的所有可能, 使得经过若干次操作后, 所有方格都变为 "+" 号.

#### 例 9 `07 亚太题 5`

在一个由 25 盏灯构成的 $5\times 5$ 的方阵中, 按动其中一盏灯的开关, 该灯及其所在行与列的所有与之相邻的灯的状态都将改变 (或由熄灭变为开启, 或由开启变为熄灭). 开始时, 所有灯都是熄灭的, 在按动若干次开关后, 恰有一盏灯是开启的. 试求这盏开启的灯的所有可能的位置.

> $(2,2), (2,4), (3,3), (4,2), (4,4)$ 这五个位置可以.
>
> 染色: 染 1、3、5 行中除第 3 列外的 12 个方格. 奇偶性不变.

#### 例 10 `1997-1998 联邦区域竞赛(第四轮) 十一年级 164`

如今有一个 $n \times n$ 的方格表, 其中 $n - 1$ 个方格中写着 1, 其余的方格中都写着 0. 允许进行如下的操作: 从表中选出一个方格, 将其中的数减 1, 而将与该方格同在一行的所有其余方格中的数全都加 1, 而且将与该方格同在一列的所有其余方格中的数亦全都加 1. 试问, 能否借助于这样的操作, 使得表中的所有数全都变为相等?

> 不能, 取一行一列全为 0, 再任取一个 1, 则有 $2\times 2$ 子表为 $1,0,0,0$, 证明 $a + d - b - c$ 模 3 不变.

## `作业`

1. 设甲有一条长为 $k$ 的线段, 乙有一条长为 $l$ 的线段. 甲先将自己的线段分成 3 段, 然后乙也将自己的线段分成 3 段, 如果得到的 6 条线段可以组成两个三角形, 则乙胜, 否则甲胜. 问: 根据 $k$ 与 $l$ 的不同取值, 甲乙两人谁有必胜策略?

   > $k > l$ 则甲必胜, 只需切出一段大于 $l$ 的即可; 否则乙必胜 (设出甲切的三段, 乙做出合适选择即可).

2. 甲乙两人轮流给正方体的棱涂色, 每次每人可以涂三条, 已经涂过色的不能再涂, 甲只能涂红色, 乙只能涂蓝色, 最后谁能先把某个面的四条棱都涂成同一种颜色就算赢. 如果甲先开始涂, 问: 甲是否有必胜策略?

   > 没有, 无论甲首先选哪那条, 乙总可以选三条互不共面的棱涂上蓝色.

3. 桌上放有 3 堆火柴, 根数分别为 $100, 200, 300$, 甲乙二人进行游戏, 甲先开始并轮流进行如下操作: 每次取走一堆火柴, 再把余下的两堆中的某一堆分成两个非空的堆, 轮到谁时不能操作就算谁输. 问: 谁有必胜策略?

   > $100 = 2^2 \cdot 25$, $200 = 2^3 \cdot 25$, $300 = 2^2 \cdot 75$, 对于三数 $2^n a, 2^n b, 2^m c (0 \le n < m)$ 且 $a, b, c$ 为奇数, 则甲必胜.
   >
   > 取走 $2^n a$,分开 $2^m c$, 变为三数 $2^n a, 2^n p, 2^n q (*)$, $p + q = 2^{m-n} c$ 且 $p, q$ 为奇数, 乙随便取一组, 并分开另一组变为 $2^n p, 2^{n_1} r, 2^{n_2}s$, $r, s$ 为奇数, $2^{n_1}r + 2^{n_2}s = 2^n q$, 则要么 $n_1 = n_2 < n$, 要么 $n_2 = n, n_1 > n$, 即 $n, n_1, n_2$ 必有两个相等 (即 $n, n_1 , n_2 $ 较小的两个必定相等), 故甲可以将三数再次变为 $(*)$, 故甲永远不败.

4. `2008 年第 5 届中国东南地区数学奥林匹克 第 7 题` 杰克船长与他的海盗们掠夺到 6 个珍宝箱 $A_1 , A_2 , A_3 , A_4,A_5,A_6$, 其中 $A_i$ 内有金币 $a_i$ 枚 $(a_i \in \mathbb N^*, i = 1,2,3,4,5,6)$, 诸 $a_i$ 互不相等. 海盗们设计了一种箱子的布局图 (如图), 并推派一人和船长轮流拿珍宝箱. 每次可任意拿走不和两个或两个以上的箱子相连的整个箱子. 如果船长最后所取得的金币不少于海盗们所取得的金币, 那么船长获胜. 问: 若船长先拿, 他是否有适当的取法保证获胜?

   \figurehere

   > 船长有必胜策略.

5. 黑板上写有 21, 7 和 8, 每次操作可以将其中某几个数加上 2, 其他数减去 1.

   (1) 能否最后得到 12,12,12?
   (2) 能否最后得到 23,15,19?

   > (1) 否;
   >
   > (2) 能; 三个数除以 3 的余数保持为 0、1、2.

6. `2008 年俄罗斯数学奥林匹克 九年级 第 9.7 题` 在一个已写有一个正整数的黑板上进行如下操作: 若数 $x$ 已写在黑板上, 则可以在黑板上写上数 $2x+1$ 或 $\dfrac x{x+2}$. 已知在某个时刻黑板上写有数 2008. 证明: 黑板上原有的数是 2008.

   > 提示: 每次操作所得最简分数分子和分母总和不变或变为原来的两倍.

