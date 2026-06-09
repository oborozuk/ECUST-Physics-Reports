#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "牛顿环法测曲率半径",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  // experiment-class: "AB12",
  // group-number: "1A",
  // teacher: "大花梨",
)

// === 请填入你的数据 ===
// l, r分别为牛顿环左侧和右侧的读数，单位为mm
// 环数从12到23
#let data = (
  l: (52.290, 52.175, 52.066, 51.955, 51.832, 51.737, 51.638, 51.535, 51.379, 51.201, 51.110, 51.027),
  r: (58.149, 58.263, 58.386, 58.495, 58.607, 58.712, 58.815, 58.917, 59.011, 59.092, 59.165, 59.252),
)
// === END ===

#show: report-section

== 实验目的

+ 了解等厚干涉的原理和观察方法
+ 理解牛顿环测量透镜曲率半径的方法
+ 掌握读数显微镜的使用
+ 学习用图解法和逐差法处理数据

== 实验原理

#figure(
  image("fig1.jpg", width: 30%),
  caption: "实验原理图",
) <fig1>

如#[@fig1]所示，在平板玻璃面DCF上放一个曲率半径很大的平凸透镜ACB，C点为接触点，这样在ACB和DCF之间，形成一层厚度不均匀的空气薄膜，单色光从上方垂直入射到透镜上，透过透镜，近似垂直地入射于空气膜。
分别从膜的上下表面反射的两条光线来自同一条入射光线，它们满足相干条件并在膜的上表面相遇而产生干涉，干涉后的强度由相遇的两条光线的光程差决定，由图可见，二者的光程差$Delta'$等于膜厚度$e$的两倍，即$Delta' = 2 e$。

此外，当光在空气膜的上表面反射时，是从光密媒质射向光疏媒质，反射光不发生相位突变，而在下表面反射时，则会发生相位突变，即在反射点处，反射光的相位与入射光的相位之间相差$pi$，与之对应的光程差为 $lambda slash 2$ ，所以相干的两条光线还具有$lambda slash 2$的附加光程差，总的光程差为
$Delta = Delta' + lambda slash 2 = 2 e + lambda slash 2$。

当$Delta$满足条件$Delta = k lambda, (k = 1,2,3, ...)$时，发生相长干涉，出现第$k$级亮纹。
而当$Delta = (2 k + 1) lambda slash 2, (k = 1,2,3, ...)$时，发生相消干涉，出现第$k$级暗纹。
因为同一级条纹对应着相同的膜厚，所以干涉条纹是一组等厚度线。
可以想见，干涉条纹是一组以C点为中心的同心圆，这就是所谓的牛顿环。

设第$k$级条纹的半径为$r_k$，对应的膜厚度为$e_k$，则
$R^2 = (R-e_k)^2 + r_k^2$。
在实验中，$R$的大小为几米到十几米，而$e_k$的数量级为毫米，所以$R >> e_k$，$e_k^2$相对于$2 R_k$是一个小量，可以忽略，所以上式可以简化为$r_k^2 = 2 R e_k$。

如果$r_k$是第$k$级暗条纹的半径，$e_k = k lambda slash 2$，
得透镜曲率半径的计算公式
$R = r_k^2 slash k lambda$。
对给定的装置，$R$为常数，暗纹半径$r_k = sqrt(lambda k R)$和级数$k$的平方根成正比，即随着$k$的增大，条纹越来越细。
同理，如果$r_k$是第$k$级明纹，$e_k = (k-1/2) lambda /2$，
可以算出$R = (2 r_k^2) / (2 k - 1)$。
可见，只要测出暗纹半径（或明纹半径），数出对应的级数$k$，即可算出$R$。

在实验中，暗纹位置更容易确定，所以我们选用$R = r_k^2 slash k lambda$来进行计算。
在实际问题中，由于玻璃的弹性形变及接触处不干净等因素，透镜和玻璃板之间不可能是一个理想的点接触。这样一来，干涉环的圆心就很难确定，$r_k$就很难测准，而且在接触处，到底包含了几级条纹也难以知道，这样级数$k$也无法确定，所以公式$R = r_k^2 slash k lambda$不能直接用于实验测量。

在实验中，我们选择两个离中心较远的暗环，假定他们的级数为$m$和$n$，测出它们的直径$d_m = 2r_m, d_n = 2r_n$，则有$d_m^2 = m dot 4 lambda R, d_n^2 = n dot 4 lambda R$。
由此得出$R = (d_m^2 - d_n^2) / (4 (m-n) lambda)$。
从这个公式可以看出，只要我们准确地测出某两条暗纹的直径，准确地数出级数$m$和$n$之差（不必确定圆心也不必确定具体级数$m$和$n$），即可求得曲率半径$R$。

== 仪器

读数显微镜、钠光源、牛顿环仪

== 实验内容与步骤

+ 观察牛顿环。

  + 将牛顿环放置在读数显微镜镜筒和入射光调节架下方，调节玻璃片的角度，使通过显微镜目镜观察时视场最亮。
  + 调节目镜，看清目镜视场的十字叉丝后，使显微镜镜筒下降到接近牛顿环仪然后缓慢上升，直到观察到干涉条纹，再微调玻璃片角度和显微镜，使条纹清晰。

+ 测牛顿环半径。

  + 使显微镜十字叉丝交点和牛顿环中心重合，并使水平方向的叉丝和标尺平行（与显微镜移动方向平行）。
  + 转动显微镜微调鼓轮，使显微镜沿一个方向移动，同时数出十字叉丝竖丝移过的暗环数，直到竖丝与第24环相切为止。记录标尺读数。
  + 反向转动鼓轮，当竖丝与第23环相切时，记录读数显微镜上的位置读数，然后继续转动鼓轮，使竖丝依次与第22至12环相切，顺次记下读数。
  + 继续转动鼓轮,越过干涉圆环中心，记下竖丝依次与另一边的第12至23环相切时的读数。

+ 利用逐差法处理得到的数据，得到牛顿环半径$R$。

== 数据处理与分析

#{
  data.l = data.l.sorted()
  data.r = data.r.sorted().rev()
  data.d = data.l.zip(data.r).map(((l, r)) => r - l)
}

#table(
  columns: 8,
  [环数$k$], [左$slash unit.mm$], [右$slash unit.mm$], [$D_k slash unit.mm$],
  [环数$k$], [左$slash unit.mm$], [右$slash unit.mm$], [$D_k slash unit.mm$],
  ..range(12)
    .zip(range(23, 17, step: -1))
    .map(((i, m)) => (
      str(m),
      float-to-str(data.l.at(i), 3),
      float-to-str(data.r.at(i), 3),
      float-to-str(data.d.at(i), 3),
      str(m - 6),
      float-to-str(data.l.at(i + 6), 3),
      float-to-str(data.r.at(i + 6), 3),
      float-to-str(data.d.at(i + 6), 3),
    ))
    .join(),
)

#let R = (
  data
    .d
    .slice(6)
    .zip(data.d)
    .map(
      ((d1, d2)) => (d2 * d2 - d1 * d1) / 24 / .589,
    )
)

#for (i, m, R) in range(6).zip(range(23, 17, step: -1), R) [

  $R_#(i + 1) = (D_#m^2 - D_#(m - 6)^2) / (4 m lambda)
  = ((#float-to-str(data.d.at(i), 3)^2 - #float-to-str(data.d.at(i + 6), 3)^2) pow10(6)) / (4 times 6 times 589 pow10(-9)) = #float-to-str(R, 3) unit.m,$

]

#let mean-R = mean(R)

$dash(R) = #float-to-str(mean-R, 3) unit.m .$

#let (k, b) = linear-fit(range(23, 11, step: -1), data.d.map(d => d * d))

#figure(
  lq.diagram(
    xlabel: [环数$k$],
    ylabel: $D_k^2 slash unit.mm^2$,
    width: 14cm,
    height: 8cm,
    legend: (position: bottom + right),
    lq.line((11, 11 * k + b), (24, 24 * k + b), label: $D_k^2 = #float-to-str(k, 3) k #format-signed(b, digits: 3)$),
    lq.scatter(range(23, 11, step: -1), data.d.map(d => d * d)),
  ),
  caption: [$D_k^2 dash k$关系图],
)

#let res-R = k / 4 / .589

由$tan theta = (Delta D_k^2) / (Delta k) = 4 R lambda$，
得$R = (tan theta) / (4 lambda) = #float-to-str(res-R, 3) unit.m$。

== 结果与讨论

本次实验用逐差法测得的透镜曲率半径$R$的平均值为$#float-to-str(mean-R, 3) unit.m$，用图解法测得的$R$为$#float-to-str(res-R, 3) unit.m$，两者相差不大，说明两种方法测量结果基本一致。实验中的误差主要来自于测量环径时的读数误差。

== 分析讨论题

- *实验中可用测量弦长代替直径的条件是什么？*请证明$D_(k+m)^2 - D_k^2 = s_(k+m)^2 - s_k^2$。

牛顿环干涉图样为同心圆，设环心为原点，某一级暗环（明环同理）实际直径为D，若测量时十字叉丝未严格对准圆心，测出的是弦长$s$。

设圆心到测量弦的垂直距离为$a$，环真实半径$r= D slash 2$，由几何勾股定理：$(s slash 2)^2 + a^2 = r^2$，
展开得$s^2 slash 4 + a^2 = D^2 slash 4$，即$D^2 = s^2 + 4 a^2$。

实验公式标准形式（暗环）：$r_k^2 = k R lambda$，即$D_k^2 = 4 k R lambda$，
取第$k+m$级与第$k$级作差消去常数项：$D_(k+m)^2 - D_k^2 = 4 m R lambda$。
把$D_(k+m)^2 = s_(k+m)^2 + 4 a^2$、$D_k^2 = s_k^2 + 4 a^2$代入差值：
$D_(k+m)^2 - D_k^2 = (s_(k+m)^2 + 4 a^2) - (s_k^2 + 4 a^2) = s_(k+m)^2 - s_k^2$。

条件：测量同一套环时，圆心偏移量$a$恒定不变（测$k$环和$k+m$环时，显微镜、牛顿环装置位置不动，偏心距离$a$相同），弦长平方差等于直径平方差，因此可以用弦长替代直径计算曲率半径。
