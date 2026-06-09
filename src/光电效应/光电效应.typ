#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "光电效应",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = "数据-光电效应.jpg"

// === 请填入你的数据 ===
// data-1: 利用零点法手动测量遏止电压
// 数据对应lambda = 365, 405, 436, 546, 577 nm的入射光频率，单位为10^14 Hz
#let data-1 = (1.759, 1.357, 1.129, .586, .472)

// data-2: 利用图解法计算普朗克常数
// 数据对应lambda = 365, 405, 436, 546, 577 nm的入射光频率，单位为10^14 Hz
// 第一行为零点法，第二行为切线法
#let data-2 = (
  (1.71, 1.29, 1.03, 0.55, 0.38),
  (1.61, 1.11, 0.97, 0.48, 0.32),
)
// data-3: 研究光电管饱和电流与入射光强的关系
// 数据对应光阑孔径Phi = 2, 4, 8 mm的入射光强，单位为10^(-10) A
#let data-3 = (9, 29, 114)
// === END ===

#show: preview-section

== 预习要点

*实验目的：*
+ 了解光电效应的规律，加深对光的量子性的认识
+ 测量普朗克常数$h$

光电效应：在一定频率的光照射下，电子从金属或金属化合物表面逸出的现象

#figure(caption: "伏安特性曲线", image("fig1.png", width: 45%))

#figure(caption: "光电效应电路图", image("fig2.png", width: 30%))

光电效应方程：$1/2 m v^2 = h nu - A$，其中$h$为普朗克常数，$A$为金属的逸出功。

== 注意事项

+ 不要随意拆卸电缆和导线，保证接触良好
+ 不要让光源的出射光直接入射光电管，保证光管安全
+ 在变换电压量程时，需将电压调节为零
+ 汞灯光源发光稳定后开始测量

#show: report-section

== 实验目的

+ 了解光电效应的规律，加深对光的量子性的认识
+ 测量普朗克常数$h$

== 实验原理

在一定频率的光的照射下，电子从金属表面逸出的现象称为光电效应，
从金属表面逸出的电子称为光电子。

光电效应的基本实验规律如下：

+ 饱和光电流$I_upright(h)$与入射光强成正比。
+ 光电子的初动能$1/2 m v^2$与入射光频率成正比，与光强无关。
+ 光电效应存在截止频率$nu_0$，当入射光$nu < nu_0$时，无论光强如何，均不能发生光电效应。
+ 光电效应是瞬时效应，只要入射光频率$nu > nu_0$，一经光线照射，立刻产生光电子。

#figure(caption: "光电效应基本实验规律", grid(
  columns: (1fr, 1fr),
  align: center,
  image("fig1.png"),
  {
    import "@preview/cetz:0.4.2": canvas, draw
    v(7pt)
    canvas({
      import draw: *
      set-style(
        mark: (fill: black),
        stroke: (thickness: 1.15pt, cap: "round"),
      )

      content((-0.35, -0.25), $ O $)
      line((-0.9, 0), (6, 0), mark: (end: "stealth"))
      content((5.3, -0.3), $ nu $, anchor: "west")
      line((0, -0.7), (0, 4), mark: (end: "stealth"))
      content((-0.35, 3.5), $ U_upright(a) $, anchor: "south")

      line((1, 0), (4, 3), stroke: 1.4pt)
      content((0.9, -0.3), $ nu_0 $, anchor: "west")
    })
  },
))

按照光子论和能量守恒定律，爱因斯坦提出了著名的光电效应方程：
$1/2 m v^2 = h nu - A$，
其中$h$为普朗克常数，$A$为金属的逸出功。

由此可知，要能产生光电效应，入射光的频率必须满足$nu > A/h$，即存在截止频率$nu_0 = A/h$。

实验中，测出不同频率$nu$的光入射时的遏止电势差$U_upright(a)$后，
作$U_upright(a) dash nu$曲线，
可得直线$e U_upright(a) = h nu - A$，即$U_upright(a) = (h/e) nu - A/e$，
从直线斜率$(h/e)$可求出普朗克常数$h$，
从直线与横坐标轴的交点可求出阴极金属的截止频率$nu_0$。

== 仪器

可调直流（恒压）电源、微电流放大器、汞灯、汞灯电源、光电管、导轨、计算机

== 实验内容与步骤

+ 测量光电管的伏安特性曲线与遏止电压

  取光阑$Phi = 4 unit.mm$，分别测量在入射光为汞灯的5条特征光谱，分别取$lambda = 365, 405, 436, 546, 577 unit.nm$照射下，光电管的伏安特性曲线。
  再用零点法分别测出并记录下相应的5个遏止电压值，并计算出相应的普朗克常数。

+ 研究饱和光电流与入射光强的关系

  选取$lambda = 577 unit.nm$的入射光，
  分别选用不同的光阑$Phi = 2, 4, 8 unit.mm$，
  测量并记录下相应的饱和光电流值，并分析其与入射光强的关系。

== 数据处理与分析

#let lambda-list = (365, 405, 436, 546, 577)

#let calc-h = (U, nu) => linear-fit(nu, U).first() * 16.02

+ 测量光电管的伏安特性曲线

  汞灯与光电管的距离$L = 30 unit.cm$，选用光阑$Phi = 4 unit.mm$。

  #figure(caption: "实验测得伏安特性曲线", image("实验IU图.png")) <IU>

  从#[@IU]能看出：
  + 对同一频率的入射光，正向电压越大，光电流越大，当电压足够大时，光电流趋于稳定的饱和电流
  + 当施加反向电压时，光电流并不立刻降为零，而是当反向电压增大到某一负值，光电流才降为零
  + 瞬时性

+ 利用零点法手动测量遏止电压，计算普朗克常数

  汞灯与光电管的距离$L = 30 unit.cm$，选用光阑$Phi = 4 unit.mm$。

  #table(
    columns: (auto,) + (1fr,) * 5,
    [波长$lambda slash unit.nm$], ..lambda-list.map(str),
    [频率$nu slash 10^14 unit.Hz$], ..lambda-list.map(x => float-to-str(2997.92458 / x, 3)),
    [遏止电压$U_upright(a) slash unit.V$], ..data-1.map(x => float-to-str(x, 3)),
  )

  #let h1 = calc-h(data-1, lambda-list.map(x => 2997.92458 / x))

  计算得$h = #float-to-str(h1, 3) pow10(-34) "J" dot "s"$，相对误差$E% = #float-to-str(calc.abs(h1 - 6.626) / 6.626 * 100, 2) "%"$。

+ 利用图解法计算普朗克常数

  #table(
    columns: (auto,) + (1fr,) * 5,
    [波长$lambda slash unit.nm$], ..lambda-list.map(str),
    [频率$nu slash 10^14 unit.Hz$], ..lambda-list.map(x => float-to-str(2997.92458 / x, 3)),
    [遏止电压$U_upright(a) slash unit.V$ （零点法）], ..data-2.at(0).map(x => float-to-str(x, 2)),
    [遏止电压$U_upright(a) slash unit.V$ （切线法）], ..data-2.at(1).map(x => float-to-str(x, 2)),
  )

  #let h2 = calc-h(data-2.at(0), lambda-list.map(x => 2997.92458 / x))
  #let h3 = calc-h(data-2.at(1), lambda-list.map(x => 2997.92458 / x))

  零点法求得$h = #float-to-str(h2, 3) pow10(-34) "J" dot "s"$，相对误差$E% = #float-to-str(calc.abs(h2 - 6.626) / 6.626 * 100, 2) "%"$。

  切线法求得$h = #float-to-str(h3, 3) pow10(-34) "J" dot "s"$，相对误差$E% = #float-to-str(calc.abs(h3 - 6.626) / 6.626 * 100, 2) "%"$。

  #let (k1, b1) = linear-fit(lambda-list.map(x => 2997.92458 / x), data-2.at(0))
  #let (k2, b2) = linear-fit(lambda-list.map(x => 2997.92458 / x), data-2.at(1))

  #figure(caption: "遏止电压与入射光频率的关系", 
    lq.diagram(
      xlabel: [频率$nu slash 10^14 unit.Hz$],
      ylabel: [遏止电压$U_upright(a) slash unit.V$],
      xaxis: (lim: (3.5, 9), subticks: none),
      yaxis: (lim: (0, auto), subticks: none),
      width: 14.5cm,
      height: 8.5cm,
      legend: (position: bottom + right),
      lq.scatter(lambda-list.map(x => 2997.92458 / x), data-2.at(0), mark: "x"),
      lq.scatter(lambda-list.map(x => 2997.92458 / x), data-2.at(1), mark: "o"),
      lq.line((0, 0 * k1 + b1), (9, 9 * k1 + b1), stroke: black, label: "零点法"),
      lq.line((0, 0 * k2 + b2), (9, 9 * k2 + b2), stroke: red, label: "切线法"),
    ),
  )

+ 研究光电管饱和电流与入射光强的关系

  $U_"AK" = 30 unit.V, quad lambda = 577 unit.nm, quad L = 300 unit.mm 。$

  #table(
    columns: (auto,) + (1fr,) * 3,
    [光阑孔径$Phi slash unit.mm$], "2", "4", "8",
    [饱和光电流$I_upright(s) slash 10^(-10) unit.A$], ..data-3.map(str),
  )

  #let (k, b) = linear-fit((2, 4, 8), data-3)

  #figure(
    caption: "光电管饱和电流与入射光强的关系",
    lq.diagram(
      xlabel: [光阑孔径$Phi slash unit.mm$],
      ylabel: [饱和光电流$I_upright(s) slash 10^(-10) unit.A$],
      xaxis: (lim: (0, 10), subticks: none),
      yaxis: (lim: (0, auto), subticks: none),
      width: 14.5cm,
      height: 8.5cm,
      lq.scatter((2, 4, 8), data-3, mark: "x"),
      lq.line((0, b), (10, 10 * k + b), stroke: black),
    ),
  )

  结论：光阑孔径越大，光强越强，饱和光电流越大。

== 结果与讨论

通过本次实验，了解了光电效应的规律，加深了对光量子性的理解，并测量了普朗克常数$h$。
实验结果表明，光电效应的基本规律得到了验证，测得的普朗克常数与理论值相符，说明了光的量子性。
实验中切线法的误差稍大，是由于测量软件的操作不够精确导致的；
实验的误差还可能来源于金属热辐射电子、剩余气体分子电离产生的电子等因素。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
