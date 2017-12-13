# 组合最值

## `讲义`

### 组合最值

在 "组合最值" 问题中, 常常需要经过 "猜想、构造、证明" 三步曲解决问题.

猜想: 是通过分析, 给出答案的上下界或准确值.

构造: 是给出一个 "算法", 以说明组合最值的确可以达到.

证明: 则要求论证更高或更低的值无法取到.

#### 例 1

集合 $A$ 的元素都是整数, 其中最小的是 1, 最大的是 100. 除 1 以外, $A$ 中每一个元素都可以写成 $A$ 中某两个数 (可以相同) 的和. 求集合 $A$ 的元素个数的最小值.

> $\{1,2,3,5,10,20,25,50,100\}$, 则集合 $A$ 的元素个数的最小值不大于 9.
>
> 若 $\{1,2,x_1,x_2,x_3,x_4 ,x_5,100\}$ 也满足条件, 则 $x_1\le 4,x_2\le 8,x_3\le 16,x_4\le 32, x_5\le 64$. 但$x_4+x_5=96<100$, 故 $x_5=50$; $x_3+x_4=48<50$, 故 $x_4=25$; $x_2+x_3=24<25$, 故 $x_3=\dfrac {25}2$, 与 $x_3$ 是整数矛盾. 故 $A$ 的元素个数的最小值是 9.
>
> 每个题的构造时,常常有贪心法的意味.

#### 例 2 `1987 年第二届全国数学冬令营`

$m$ 个互不相同的正偶数和 $n$ 个互不相同的正奇数的总和为 1987, 对于所有这样的 $m$ 与 $n$, 问 $3 m + 4n$ 的最大值是多少? 请证明你的结论.

> 注意到这些正偶数或正奇数越小, 则 $3m+4n$ 就有越大的趋势. 所以设 $a_1,a_2, \cdots,a_m$ 是互不相同的正偶数, $b_1,b_2, \cdots,b_n$ 是互不相同的正奇数, 则
>
> $a_1+a_2+\cdots+a_m \ge 2+4+...+2m=m(m+1)$;
>
> $b_1+b_2+\cdots+b_n \ge 1+3+\cdots+(2n-1)= n^2$,
>
> 得 $m^2+m+n^2 \le 1987$, 进而得 $3m+4n \le 221$. 当 $m=27,n=35$ 时可以取到.

#### 例 3

对 $7 \times 7$ 方格表中的小方格进行染色, 使得每个被染色的小方格满足: 与其相邻的小方格最多只有一个被染色, 其中两个小方格是指它们有一条公共边. 问: 最多可以给多少个小方格染色?

> 答案: 26 个. 提示: 容易构造 26 个的染色方法. 只需证 27 个不行.
>
> 不难证明: $2 \times 2$ 的方格表、 $3 \times 3$ 的方格表分别最多染色 2 个、5 个小方格.
>
> 对 $5 \times 5$ 的方格表, 是在 $3 \times 3$ 的基础上加了宽为 2 的 "镶边". 镶边最多可以划分为 4 个 $2 \times 2$ 的方格, 其中右下角的方格中, 一个被重复使用, 一个没有使用, 于是最多可以增加 9 个染色方格. 于是 $5 \times 5$ 的方格表中最多有 14 个方格被染色, 此时必须让最右下角的方格染色, 左上一个格的不能染色, 且镶边中的 4 个 $2 \times 2$ 的方格必须各染 2 个. 类似地, 对 $7 \times 7$ 的方格表, 在 $5 \times 5$ 的方格表的基础上加了宽为 2 的 "镶边". 最多可染 27 个方格. 然而这时必须让最右下角的方格染色, 左上一个格的不能染色, 且镶边中的 6 个 $2 \times 2$ 的方格必须各染 2 个. 而最右下角的方格的上方或左方方格至少有一个没有染色. 会导致矛盾.

#### 例 4 `2007 加试 02`

如图, 在 $7 \times 8$ 的长方形棋盘的每个小方格的中心点各放一枚棋子, 如果两枚棋子所在的小方格共边或共顶点, 那么, 这两枚棋子 "相连". 先从这 56 枚棋子中取出一些, 使得棋盘上剩下的棋子没有 5 枚在一条直线 (横、竖、斜方向) 上依次相连. 问最少取出多少枚棋子才能满足要求? 并说明理由.

\figurehere

> 11 个棋子.

#### 例 5 `1999 加试 03`

给定正整数 $n$, 已知用克数都是正整数的 $k$ 块砝码和一台天平可以称出质量为 $1,2,\cdots, n$ 的所有物品.

(1) 求 $k$ 的最小值 $f(n)$.
(2) 当且仅当 $n$ 取什么值时, 上述 $f(n)$ 块砝码的组成方式是唯一确定的? 并证明你的结论.

> (1) $f(n) =\left \lceil \log_3 (2n+1) \right \rceil$. 其中, $\left \lceil \right \rceil$ 是向上取整.
>
> (2) $n$ 是形如 $\dfrac {3^m-1}2 (m \in \mathbb N^*)$ 的正整数.

#### 例 6

设 $S = \{1, 2,3, \cdots, 280\}$, 求最小的正整数 $n$, 使 $S$ 的任意 $n$ 元子集都含有五个两两互质的数.

> 5 个数中存在两个不互质的数, 当且仅当两个数有共同的质因子. 所以考虑前四个质数 $2,3,5,7$. 它们的倍数共 216 个. 所以 $n > 216$ .
>
> 另一方面, 设 $B_1= \{1 和 S 中的一切素数\}$,
>
> $B_2=\{2^2,3^2,5^2 ,7^2,11^2,13^2\}$,
>
> $B_3=\{2\times 131,3\times 89, 5\times 53, 7\times 37,11\times 23,13\times 19\}$,
>
> $B_4=\{2\times 127,3\times 83,5\times 47,7\times 31,11\times 19,13\times 17\}$,
>
> $B_5 = \{2\times 113,3\times 79,5\times 43,7\times 29,11\times 17\}$,
>
> $B_6=\{2\times 109, 3\times 73, 5\times 41, 7\times 23,11\times 13\}$.
>
> 记 $B=B_1\cup B_2\cup \cdots \cup B_6$, 则$|B|=88$, 于是 $S\backslash B$  含有 192 个元素. 在 $S$ 中任取 217 个数, 由于 $217-192=25$, 故至少有 25 个元素在 $B$ 中, 且 $25=4\times 6+1$, 故这 25 个元素中必有 5 个数属于同一 $B_i$, 显然他们两两互素. 故 $n$ 的最小值为 217.

#### 例 7 `1990 年全国高中数学联赛二试`

某市有 $n$ 所中学, 第 $i$ 所中学派出 $C_i$ 名学生到体育馆观看球赛 $(1 \le C_i \le 39, i = 1, 2, \cdots, n)$, 全部学生总数为$\sum\limits_{i=1}^n C_i = 1990$. 看台上每一横排有 199 个座位. 要求同一学校的学生必须坐在同一横排. 问体育馆最少要安排多少横排才能保证全部学生都能坐下?

> 由于 $1\le C_i\le 39$, 故每一横排至少可坐 161 人, 于是只要有 13 排, 至少可坐 $161\times 13=2093$人, 当然能坐下全部学生 1990 人. 下面我们来看 12 排座位能否安排下全部学生.
>
>  注意, 这时共有 $199\times 12=2388$ 个座位, 坐了 1990 人后, 还有 398 个座位. 因此, 如果每排的空位数都不超过 33 个, 便可安排下全部学生. 将所有学校学生从多到少重新编号, 于是有 $C_1\ge C_2\ge C_3\ge \cdots \ge C_n$. 这样存在非负整数 $m$, 使 $C_m\ge 34$ 而$Cm+1\le33$. (若 $m=0$, 则意味着所有 $C_i$ 都不超过 33). 设 $m=5p+r (0\le r<5)$. 将前 $5p$ 个学校的学生安排在前 $p$ 排就坐, 每排 5 个学校, 每排至少坐 170 人, 空位至多 29 个. 
>
> 接下去按次序使其余学校的学生就坐, 每排都是坐到不能全部坐下下一学校的学生为止, 则每排的空位都不会超过 32 个, 直到第 11 排为止. 这 11 排空位不超过 $32×11=352$ 个, 所以至少已坐了 1837 人, 全部中学生中至多还有 $1990-1837=153$ 人没坐下, 当然可将他们安排在第 12 排就坐. 可见, 只要有 12 排座位, 即可使全部学生按要求就坐. 最后, 让我们来看, 只有 11 排座位情形如何? 这时, 只有 199 个空位, 要想安排下全部学生, 每排空位平均不能达到19 个. 现设 $n=80$, 前 79 所学校各有 25 人, 最后一个学校有 15 人, 则 $25\times 79+15=1990$. 除了一排可以安排 $25\times 7+15=190$ 人就坐之外, 其余 10 排至多安排 175 人, 故 11 排至多安排 $190+175\times 10=1940$ 人就坐. 这个例子说明只有 11 排座位是不够的. 因此,为了安排下 1990 名学生,最少需要 12 排座位.
>
> 评注: 为了求得横排数的最小值, 先进行估计, 说明 12 个横排可以达到要求, 在论证过程中, 以数字 33 作为分界线, 精确计算, 达到了目的. 然后通过构造实例说明 11 个安排不够.

#### 例 8

设 $S = \{1,2,\cdots ,10\}$, $A_1, A_2 ,\cdots , A_k$ 是 $A$ 的子集, 满足条件:

(1) $|A_i| = 5 ( i = 1 , 2 , \cdots , n )$;
(2) $|A_i \cap A_j| \le 2 (1 \le i < j \le k)$.

求 $k$ 的最大值.

> 思路分析: 应当根据子集满足的条件推导出一个 $k$ 的上界. 作如下试探: 令 $A_1=\{1,2,3,4,5\}$, 各子集间至多有 2 个公共元, 令 $A_2 =\{1, 2, 6, 7, 8\}$, 此时, 若 $\{1, 2\}\subseteq A_3$, 则必有$|A_1\cap A_3|\ge 3$ 或 $|A_2\cap A_3|\ge 3$ 矛盾.
>
> 由此得到第一个猜想: $A_1,A_2,\cdots A_k$ 中至多有两个集合包含同一个 2 元子集. 令 $A_3=\{1,3,6,9,10\}$, 此时, 若 $1\in A_4$, 则此时 $A_1,A_2,A_3$ 中除 1 外均至多还有一个元素同时属于 $A_4$, $|A_4|\le 4$, 矛盾. 
>
> 由此得到第二个猜想: $S$ 中每一个元素至多属于 $A_1,A_2, \cdots,A_k$ 中的 3 个集合. 此时可求得 K 的一个上界.
>
> 解: (1) 对 $S$ 的任意一个 2 元子集 $\{a,b\} \subseteq S$, $A_1 ,A_2, \cdots A_k$ 中至多有两个集合包含 $\{a,b\}$. 否则, 设有 $A_1 \supseteq \{a,b\}, A_2 \supseteq \{a,b\}, A_3 \supseteq \{a,b\}$, 则由于 $|A_i \cap A_j|\le 2(1\le i < j \le k)$, 所以 $A_i-\{a,b\}$ 两两不交$(i=1,2,3)$, 上述 $A_i-\{a,b\}$ 表示差集: $A-B=\{x|x\in A 且 x\notin B\}$. 但 $|A_i-\{a,b\}|=3 (i=1,2,3)$, 于是 $|S|\ge 3\times 3+2=11$, 矛盾.
>
> (2) 对 $S$ 的任意一个元素 $a$, $A_1,A_2,\cdots A_k$ 至多有三个集合包含 $\{a\}$. 设已有 $A_1 \supseteq \{a\}, A_2 \supseteq \{a\}$,$ A_3 \supseteq \{a\}$, 若 $|A_i\cap A_j|=1(1\le i < j \le 3)$, 则 $|A_1\cup A_2\cup A_3|=3\times 4+1=13$, 矛盾. 设 $b\ne a$, 且 $a,b\in A_1 \cap A_2$, 则 $|A_1\cup A_2|=8$, 根据 (1), $b\notin A_3$ 且 $|A_3\cap A_1|\le 2,|A_3\cap A_2|\le 2$, 所以 $A_3$ 中至多还有 2 个元素不属于 $A_1\cup A_2$, 即 $\overline {A_1\cup A_2} \subset A_3$.
>
> 同理, 若还有 $A_4 \supseteq \{a\}$, 那么 $\overline {A_1\cup A_2} \subseteq A_4$, 从而$|A_3 \cap A_4|\ge 3$, 矛盾. 故对任意 $a\in S$, $a$ 至多属于 $A_1 ,A_2,\cdots, A_k$ 中 3 个子集, 所以 $S$ 中每个元素至多在 $|A_1| +|A_2|+\cdots +|A_k|$ 中作了 3 重计数, 故 $|A_1| +|A_2|+\cdots +|A_k|\ge 3|S|=30$, 所以 $k\le 6$.
>
> 按照上述思路, 可构造出符合条件的 6 个子集: $\{1,2,3,4,5\},\{1,2,6,7,8\},\{1,3,6,9,10\}$,$\{2,4,7,9,10\},\{3,5,7,8,10\},\{4,5,6,8,9\}$. 故 $k$ 的最大值为 6.

## `作业`

1. 对有限集 $A$, 存在函数 $f: \mathbb N \to  A$ ,具有下述性质: 对 $i, j \in \mathbb N$, 若 $|i - j|$ 是素数, 则 $f(i) \ne f(j)$, 问
   集合 $A$ 中至少有几个元素?

   > 4 个元素.
   >
   > 因为 $1,3,6,8$ 这四个数字中任何两个数字的差的绝对值均为素数, 由题意知 $f(1), f(3), f(6), f(8)$ 是 $A$ 中四个两两不等的元素. 从而 $|A|\ge 4$. 另一方面, 若令 $A=\{0,1,2,3\}$, $f: \mathbb N \to A$ 的对应法则为: $f$ 把自然数 $n$ 映为 $n$ 除以 4 后的余数. 若 $|x-y|$ 为素数, 假设 $f(x)=f(y)$, 则 $x\equiv y(\mod4)$, 于是 $4||x-y|$, 这与 $|x-y|$ 是素数矛盾. 故集合 $A$ 中至少含有 4 个元素.

2. 10 人到书店买书, 已知每人都买了三种书, 且任两人所买的书中, 都至少有一种相同. 问购买的人数最多的一种书最少有几个人购买?

   > 5 个人.
   >
   > 设其中甲买了三种书, 因他与其余 9 个人中每人都至少有一种书相同, 所以, 甲的三种书中, 购买人数最多的一种书不少于 4 人购买. 若购买人数最多的一种书有 4 人购买, 则甲的三种书均为 4 人购买, 其他 9 人的每种书也均为 4 人购买. 因而,10 人买书的总数是 4 的倍数, 即 $4|30$, 矛盾. 于是, 购买的人最多的一种书至少有 5 人购买.
   >
   > 考虑下面的购买方式: $\{B_1,B_2,B_3\},\{B_1,B_2,B_4\},\{B_2,B_3,B_5\},\{B_1,B_3,B_6\},\{B_1,B_4,B_5\}$, $\{ B_2,B_4,B_6\},\{B_3, B_4, B_5\},\{B_1,B_5,B_6\},\{B_2,B_5,B_6\},\{B_3,B_4,B_6\}$.

3. 在一个有限的实数数列中, 任何七个连续项之和都是负数, 而任何十一个连续项之和都是正数, 试问这样的数列最多能有多少项?

   > 16 项.
   >
   > 考察下面的排列: $a_1,a_2,a_3,a_4,a_5,a_6,\cdots,a_{11}$; $a_2,a_3,a_4,a_5,a_6,a_7, \cdots,a_{12}$; $a_3,a_4,a_5,a_6,a_7,a_8,\cdots,a_{13}$; $\cdots \cdots$; $a_7,a_8,a_9,a_{10},a_{11},a_{12},\cdots,a_{17}$.
   >
   > 由题设条件, 每一横行之和为正数, 故表中所有数之和为正数. 另一方面, 每一列的数之和为负数. 将所有列的数的和相加, 其和为负, 既又得到表中所有数之和为负数. 矛盾, 故这样的数列最多能有 16 项. 下面我们构造一个有 16 项的满足条件的数列: $5,5,-13,5,5,5,-13,5,5,-13,5,5,5,-13,5,5​$.
   >
   > 综上可知, 满足题中要求的数列最多有 16 项.

4. 求最大的自然数 $k$, 满足: 在 $7 \times 7$ 个小方格的正方形里, 能够划出 $k$ 个小方格的中心, 使其中任何
   四个点都不是其边与正方形的边平行的矩形的顶点.

   > 21.
   >
   > 考虑 $m \times m$ 的正方形, 设 $x_i$ 是第 $i$ 行中适合条件的小方格的中心的数目, 则 $\sum\limits_{i=1}^m x_i =k$. 如果在某行标出某两个方格的中心, 那么在另外任何一行不能标相同列的一对方格. 在第 $i $ 行有 $\dfrac 12 x_i(x_i -1)$对标出的方格. 又因为每行标出的方格对不同, 故有 $\sum\limits_{i=1}^m \dfrac {x_i(x_i-1)} 2 \le \dfrac {m(m-1)}2$, 从而 $\sum\limits_{i=1}^m x_i ^2 \le m(m-1)+\sum\limits_{i=1}^m x_i = m(m-1)+k$.
   >
   > 又 $\sum\limits_{i=1}^m x_i^2 \ge \dfrac {(x_1+\cdots +x_m)^2}m = \dfrac {k^2}m$, 故 $\dfrac {k^2}m \le m(m-1)+k$, 解得 $k\le \dfrac 12(m+m\sqrt{4m-3})$, 所以，当 $m=7$ 时, $k\le 21$, $k$ 的最大值为 21. 如图:
   >
   > \figurehere

5. 在 $100 \times 25$ (即 100 行, 25 列) 的长方形表格中每一格填入一个非负实数, 第 $i$ 行第 $j$ 列中填入的数为 $x_{i, j} (1 \le i \le 100, 1 \le j \le 25)$, 如表 1. 然后将表 1 每列中的数按由大到小的次序从上到下重新排列为 $x_{1,j}' \ge x_{2,j}' \ge \cdots \ge x_{100,j}' (1 \le j \le 25)$, 如表 2. 求最小自然数 $k$, 使得只要表 1 中填入的数满足$\sum\limits_{j=1}^{25} x_{i, j}\le 1 (1\le i \le 100)$, 则当 $i \ge k$ 时, 在表 2 中就能保证 $\sum\limits_{j=1}^{25} x_{i, j}'\le 1$成立.

   \figurehere

   \figurehere

   > 97.
   >
   > 令 $x_{1,1} = x_{2,1} = x_{3,1} = x_{4,1} = x_{5,2} = x_{6,2} = x_{7,2} = x_{8,2} = 0, \cdots, \cdots$, $x_{97,25} = x_{98,25} = x_{99,25} = x_{100,25} = 0$, 其余元素为 $\dfrac 1{24}$, 则每行 25 个数之和为 $0+24\times \dfrac 1{24} =1$, 此时在表 1 中每列元素恰有 4 个为 0, 因而调整为表二后最后四行全为 0, 但前 96 行的数全为 $\dfrac 1{24}$, 每行之和为  $\dfrac {25}{24}>1$. 这说明最小的 $k \ge 97$.
   >
   > 以下证明 $k$ 的最小值时 97. 因为后三行 (第 98,99,100 行) 只能容纳 75 个元素, 所以表一中必定有某一行 (设为第 r 行), 它的全部 25 个元素, 在调整后的表二中处于前面 97 行中. 否则每行至少有一个元素落入后三行, 则至少有 100 个元素落入后三行, 这不可能. 这说明在表二中, $x'_{97, j} \le x_{r, j}$ ($x_{r, j}$ 仍在表二中的第 $j$列, 行数不一定是 $r$, 但行号 $\le97$). 从而对任意 $i \ge 97$, 有 $x'_{i, j} \le x'{97, j} \le x_{r, j}$. 所以当 $i \ge 97$ 时, $\sum\limits_{j=1}^{25} x_{i,j} \le \sum\limits_{j=1}^{25} x_{r,j} \le 1$. 故 k 的最小值是 97.