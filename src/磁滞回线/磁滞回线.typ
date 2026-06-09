#import "@preview/cuti:0.4.0": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/itemize:0.2.0": default-enum-list
#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "霍尔法测量铁磁材料的磁滞回线和磁化曲线",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = ("数据-磁滞回线-1.jpg","数据-磁滞回线-2.jpg")

// === 请填入你的数据 ===
// data-1:磁场分布的测定
// start: 起始位置，单位为mm
// B: 磁感应强度，单位为mT
#let data-1 = (
  start: -6,
  B: (
    74.6,
    109.0,
    109.8,
    109.5,
    109.4,
    109.4,
    109.4,
    109.4,
    109.5,
    109.6,
    109.7,
    109.7,
    109.8,
    109.8,
    109.9,
    110.1,
    110.1,
    110.2,
    110.3,
    110.2,
    104.4,
    66.3,
  ),
)

// data-2: 起始磁化曲线的测量
// x: 测量点位置，单位为mm
// I: 励磁电流，单位为mA
// B: 磁感应强度，单位为mT
#let data-2 = (
  x: 4,
  I: range(0, 650, step: 50) + (637,),
  B: (0, 21.5, 54.3, 96.5, 143.9, 192.1, 240.7, 286.4, 327.4, 364.5, 395.5, 422.3, 444.4, 459.4),
)

// l: 样品平均磁路长度，单位为mm
#let l = 238

// data-3-x: 磁滞回线的测量
// I: 励磁电流，单位为mA
// B: 磁感应强度，单位为mT
// data-3-1: 磁化电流从最大减小到零
#let data-3-1 = (
  I: (637,) + range(600, -50, step: -50),
  B: (459.2, 454.0, 447.1, 438.3, 428.6, 416.5, 400.2, 378.8, 348.3, 309.0, 262.9, 213.7, 161.7, 109.2),
)

// data-3-2: 磁化电流从零增加到反向最大
#let data-3-2 = (
  I: range(0, -650, step: -50) + (-637,),
  B: (109.2, 56.4, 3.5, -49.1, -101.7, -154.4, -207.3, -256.2, -303.6, -350.2, -391.8, -419.6, -445.2, -461.4),
)

// data-3-3: 磁化电流从反向最大增加到零
#let data-3-3 = (
  I: (-637,) + range(-600, 50, step: 50),
  B: (-461.4, -460.4, -453.1, -444.7, -435.0, -422.8, -406.7, -384.3, -352.9, -312.2, -265.5, -215.7, -163.1, -110.0),
)

// data-3-4: 磁化电流从零增加到最大
#let data-3-4 = (
  I: range(0, 650, step: 50) + (637,),
  B: (-112.0, -59.5, -4.7, 53.9, 103.4, 156.8, 208.1, 258.7, 305.7, 350.0, 387.99, 420.3, 445.9, 461.4),
)
// === END ===

#show: preview-section

== 预习要点

*实验目的：*
+ 学习铁磁材料剩磁的退磁方法
+ 了解霍尔传感器测量磁感应强度的原理
+ 用霍尔传感器测量铁磁材料的磁滞回线和磁化曲线

#figure(caption: "磁滞回线示意图", image("fig1.jpg", width: 35%))

== 注意事项

+ 测量磁化曲线和磁滞回线时，调节励磁电流增加或减小都不能倒退
+ 电流等于0时，才扳动电流反向开关
+ 使用调节旋钮时，必须小幅度轻轻转动，调到头时不要继续旋转，防止损坏
+ 严禁扳拉霍尔探头

#show: report-section

== 实验目的

+ 学习铁磁材料剩磁的退磁方法
+ 了解霍尔传感器测量磁感应强度的原理
+ 用霍尔传感器测量铁磁材料的磁滞回线和磁化曲线

== 实验原理

+ 铁磁材料的磁化及磁导率

  铁磁物质的磁化过程很复杂，这主要是由于它具有磁滞的特性。
  一般都是通过测量磁化场的磁场强度$H$和磁感应强度$B$之间的关系来研究其磁性规律的。

  #figure(caption: "起始磁化曲线和磁滞回线", image("fig1.jpg", width: 35%)) <fig1>

  当铁磁物质中不存在磁化场时，$H$和$B$均为零，即#[@fig1]中$B$～$H$曲线的坐标原点0。
  随着磁化场$H$的增加，$B$也随之增加，但两者之间不是线性关系。
  当$H$增加到一定值时，$B$不再增加（或增加十分缓慢），这说明该物质的磁化已达到饱和状态。
  $H_"m"$和$B_"m"$分别为饱和时的磁场强度和磁感应强度（对应于图中a点）。
  如果再使$H$逐渐退到零，则与此同时$B$也逐渐减少。
  然而$H$和$B$对应的曲线轨迹并不沿原曲线轨迹$a_0$返回，而是沿另一曲线ab下降到$B_"r"$，这说明当$H$下降为零时，铁磁物质中仍保留一定的磁性，这种现象称为磁滞，$B_"r"$称为剩磁。
  将磁化场反向，再逐渐增加其强度，直到$H = -H_"c"$，磁感应强度消失，这说明要消除剩磁，必须施加反向磁场$H_"c"$. $H_"c"$称为矫顽力。
  它的大小反映铁磁材料保持剩磁状态的能力。
  #[@fig1]表明，当磁场按$H_"m"→0→-H_"c"→H_"m"→0→H_"c"→H_"m"$次序变化时，$B$所经历的相应变化为$B_"m"→B_"r"→0→-B_"m"→-B_"r"→0→B_"m"$。
  于是得到一条闭合的$B$～$H$曲线，称为磁滞回线。
  所以，当铁磁材料处于交变磁场中时（如变压器中的铁心），它将沿磁滞回线反复被磁化→去磁→反向磁化→反向去磁。
  在此过程中要消耗额外的能量，并以热的形式从铁磁材料中释放，这种损耗称为磁滞损耗。
  可以证明，磁滞损耗与磁滞回线所围面积成正比。

+ $B$～$H$曲线的测量方法

  将待测的铁磁材料做成环形样品，绕上一组线圈，在环形样品的中间开一极窄的均匀气隙，在线圈中通以励磁电流，则铁磁材料即被磁化，气隙中的磁场应与铁磁材料中的磁场一致。
  如果样品截面的线度与气隙的宽度比例恰当，则气隙中有一定区域的磁场是均匀的。
  若在线圈中通过的电流为$I$，则磁化场的磁场强度$H = N / dash(l) I$，其中$N$为磁化线圈的匝数，$dash(l)$为样品平均磁路长度。
  变化通电线圈中的励磁电流，磁场强度$H$也作相应的变化，用特斯拉计测得气隙中均匀磁场区域内的磁感应强度$B$与$H$的对应关系，即能得到该铁磁材料的磁滞回线和磁化曲线，从中测得剩磁、矫顽力及饱和磁感应强度等表征铁磁材料基本磁特性的物理量。

== 仪器

HM–1霍尔法磁化曲线与磁滞回线实验仪、恒流电源、实心铁芯样品（绕有2000匝励磁线圈，截面长2.00cm 、宽2.00cm，气隙间隔2.0mm，样品的平均磁路长度为24.00cm）

== 实验内容与步骤

+ 铁磁材料磁隙磁场分布的测量和样品退磁

  样品气隙中的磁场分布与横向位置$X$有关，测试时，应将毫特计的霍尔探头置于磁感应强度最大值的均匀区域内。我们可以测量样品中剩磁的磁感应强度$B$与$X$的关系，来确定测试磁化曲线和磁滞回线时探头的放置位置。

  转动霍尔探头支架上的鼓轮，将探头平行地插入气隙，注意不能与样品接触。线圈通以一定的直流电流，用毫特计沿$X$方向等间隔（1.0mm）测出磁场分布，以均匀区域内最大值处为测量点。

  由于铁磁材料中有剩磁存在，在测量磁化曲线和磁滞回线前必须对样品进行退磁处理。在测量点，将励磁电流调到600mA，然后减小到零，再把电流反向，调到600mA，然后也调到零。这样，不断改变电流方向，同时逐渐减小励磁电流的大小，重复上述过程直至毫特计示值为零，退磁完成。

+ 起始磁化曲线的测量

  励磁电流$I$以50mA为间隔从零开始逐渐增加，直至磁感应强度$B$趋向饱和，即测得起始磁化曲线。

+ 磁滞回线的测量

  为了得到一个中心对称而稳定的磁滞回线，在测量磁滞回线之前必须对样品进行反复磁化，称为磁锻炼。
  磁锻炼是这样实现的：当测量起始磁化曲线$B$增加得十分缓慢（即达到饱和状态）时，励磁电流$I_"m"$，保持$I_"m"$不变，把双刀换向开关来回拨动10次即可。在拉动开关时，触点从接触到断开的时间应该长些。磁锻炼后就可以测量磁滞回线。

  调节励磁电流从饱和电流$I_"m"$开始，每隔50mA减小到零，然后双刀换向开关将电流换向，电流反向从零增加（每隔50mA）到$-I_"m"$，这样使励磁电流$I$经$I_"m"→0→-I_"m"→ 0 →I_"m"$ 变化（每隔50mA），记录相应的磁感应强度$B$值。由励磁电流$I$可得到$H$。
  在直角坐标纸上作铁磁材料样品的起始磁化曲线和磁滞回线，读出该样品的饱和磁感应强度$B_"m"$、矫顽力$H_"c"$以及剩磁$B_"r"$。由于$H$数据有效数字比较多，在直角坐标纸上画出$B～H$曲线不易，我们可以作$B～I$曲线，二者变化规律相同，同样在图上可读出$B_"m"$和$B_"r"$ ，至于矫顽力$H_"c"$，可以先读出$I_"c"$（即对应于$H_"c"$的电流），再用公式$H = N / dash(l) I$计算得到。


== 数据处理与分析

#{
  assert(data-2.I.len() == data-2.B.len(), message: "数据长度不匹配")
  assert(data-3-1.I.len() == data-3-1.B.len(), message: "数据长度不匹配")
  assert(data-3-2.I.len() == data-3-2.B.len(), message: "数据长度不匹配")
  assert(data-3-3.I.len() == data-3-3.B.len(), message: "数据长度不匹配")
  assert(data-3-4.I.len() == data-3-4.B.len(), message: "数据长度不匹配")
}

+ 磁场分布的测定

  #table(
    columns: 9,
    $x slash unit.mm$, ..range(data-1.start, data-1.start + 8).map(str),
    $B slash unit.mT$, ..data-1.B.slice(0, 8).map(x => float-to-str(x, 1)),
    $x slash unit.mm$, ..range(data-1.start + 8, data-1.start + 16).map(str),
    $B slash unit.mT$, ..data-1.B.slice(8, 16).map(x => float-to-str(x, 1)),
    $x slash unit.mm$, ..range(data-1.start + 16, data-1.start + 22).map(str), [], [],
    $B slash unit.mT$, ..data-1.B.slice(16, 22).map(x => float-to-str(x, 1)),
  )

  #figure(
    lq.diagram(
      xlabel: $x slash unit.mm$,
      ylabel: $B slash unit.mT$,
      width: 11cm,
      height: 5cm,
      lq.plot(range(data-1.start, data-1.start + 22), data-1.B),
    ),
    caption: "磁隙磁场分布曲线",
  )


+ 起始磁化曲线的测量

  测量点位置$x_"B"= #data-2.x unit.mm$

  #table(
    columns: calc.ceil(data-2.I.len() / 2) + 1,
    [励磁电流$I slash unit.mA$], ..data-2.I.slice(0, calc.ceil(data-2.I.len() / 2)).map(i => float-to-str(i, 1)),
    [磁感应强度$B slash unit.mT$], ..data-2.B.slice(0, calc.ceil(data-2.I.len() / 2)).map(i => float-to-str(i, 1)),
    [励磁电流$I slash unit.mA$], ..data-2.I.slice(calc.ceil(data-2.I.len() / 2)).map(i => float-to-str(i, 1)), ..(
      ([],) * (calc.ceil(data-2.I.len() / 2) - data-2.I.slice(calc.ceil(data-2.I.len() / 2)).len())
    ),
    [磁感应强度$B slash unit.mT$], ..data-2.B.slice(calc.ceil(data-2.I.len() / 2)).map(i => float-to-str(i, 1)),
  )

+ 磁滞回线的测量

  磁化线圈匝数$N = 2000$，样品平均磁路长度$dash(l) = #float-to-str(l, 1) unit.mm$。

  #table(
    columns: 8,
    [$I slash unit.mA$],
    [$B slash unit.mT$],
    [$I slash unit.mA$],
    [$B slash unit.mT$],
    [$I slash unit.mA$],
    [$B slash unit.mT$],
    [$I slash unit.mA$],
    [$B slash unit.mT$],
    ..data-3-1
      .I
      .zip(data-3-1.B, data-3-2.I, data-3-2.B, data-3-3.I, data-3-3.B, data-3-4.I, data-3-4.B)
      .map(((i1, b1, i2, b2, i3, b3, i4, b4)) => (
        float-to-str(i1, 1),
        float-to-str(b1, 1),
        float-to-str(i2, 1),
        float-to-str(b2, 1),
        float-to-str(i3, 1),
        float-to-str(b3, 1),
        float-to-str(i4, 1),
        float-to-str(b4, 1),
      ))
      .join(),
    table.vline(x: 2, stroke: 1.5pt),
    table.vline(x: 4, stroke: 1.5pt),
    table.vline(x: 6, stroke: 1.5pt),
  )

  #let (k1, b1) = linear-fit(data-3-2.I.slice(0,6),data-3-2.B.slice(0,6))
  #let Hc = -b1 / k1
  #let (k2, b2) = linear-fit(data-3-4.I.slice(0,6),data-3-4.B.slice(0,6))
  #let Hc2 = -b2 / k2

  #figure(
    lq.diagram(
      xlabel: $I slash unit.mA$,
      ylabel: $B slash unit.mT$,
      xaxis: (auto-exponent-threshold: 9),
      yaxis: (auto-exponent-threshold: 9),
      width: 12cm,
      height: 8cm,
      lq.plot(data-2.I, data-2.B, smooth: true, color: black),
      lq.plot(data-3-1.I, data-3-1.B, smooth: true, color: black),
      lq.plot(data-3-2.I, data-3-2.B, smooth: true, color: black),
      lq.plot(data-3-3.I, data-3-3.B, smooth: true, color: black),
      lq.plot(data-3-4.I, data-3-4.B, smooth: true, color: black),
      lq.line((0, data-3-1.B.first()), (data-3-1.I.first(), data-3-1.B.first()), stroke: (dash: "dashed")),
      lq.place(-40, data-3-1.B.first(), $B_"m"$),
      lq.line((data-3-1.I.first(), 0), (data-3-1.I.first(), data-3-1.B.first()), stroke: (dash: "dashed")),
      lq.place(data-3-1.I.first(), -40, $H_"m"$),
      // lq.scatter((0,), (data-3-1.B.last(),), color: blue, mark: "x"),
      lq.place(-40, data-3-1.B.last() + 40, $B_"r"$),
      // lq.scatter((Hc,), (0,), color: blue, mark: "x"),
      lq.place(Hc - 40, 40, $H_"c"$),
      // lq.scatter((0,), (data-3-3.B.last(),), color: blue, mark: "x"),
      lq.place(40, data-3-3.B.last() - 40, $B'_"r"$),
      // lq.scatter((Hc2,), (0,), color: blue, mark: "x"),
      lq.place(Hc2 + 40, -40, $H'_"c"$),
    ),
    caption: "实验测得的磁滞回线图",
  )
  
  由图可知，饱和磁感应强度$B_"m" = #float-to-str(data-3-1.B.first(), 1) unit.mT$，
  剩磁$B_"r" = #float-to-str(data-3-1.B.last(), 1) unit.mT$，
  矫顽力$H_"c" = N / dash(l) I_"c" = 2000 / (#float-to-str(l, 1) pow10(-3)) times #float-to-str(Hc2, 2) pow10(-3) = #float-to-str(Hc2 * 2000 / l, 2) unit.A slash unit.m$，
  饱和磁化强度为$H_"m" = N / dash(l) I_"m" = 2000 / (#float-to-str(l, 1) pow10(-3)) times #float-to-str(data-3-1.I.first(), 1) pow10(-3) = #float-to-str(data-3-1.I.first() * 2000 / l, 2) unit.A slash unit.m$。


== 结果与讨论

实验测得铁磁材料初始磁化曲线随磁场强度$H$增大，磁感应强度$B$先快速上升后趋于饱和；循环改变磁场方向得到闭合磁滞回线，可见明显磁滞现象，同时观测到剩磁与矫顽力。
误差主要来源于霍尔副效应、漏磁、退磁不彻底以及读数不稳。

== 分析讨论题

- *请简要阐述退磁过程。*

  将电流调至零后，发现有剩磁存在，将电流方向调至反向，调节电流使毫特计数值变为原先数值的相反数的一半，再将电流调回零；若仍有剩磁，则继续重复上述过程，直到毫特计数值为零，退磁完成。若退磁后剩磁与电流方向相同，则保持电流方向不变，调节电流使毫特计数值变为2\~3倍，再将电流调回零。


#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
