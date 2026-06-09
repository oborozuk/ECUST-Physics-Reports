#import "@preview/cuti:0.4.0": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/itemize:0.2.0": default-enum-list
#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "动态悬挂法测定金属材料的杨氏模量",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = "数据-动态杨氏.jpg"

// === 请填入你的数据 ===
// 螺旋测微器初读数，单位为mm
#let d-init = -0.015

// data-1: 圆形棒试样的几何尺寸和质量测量
// Fe: 铁棒，Cu: 铜棒
// d: 直径(mm)，l: 长度(cm)，m: 质量(g)
#let data-1 = (
  Fe: (d: (5.986, 5.986, 5.985, 5.985, 5.988, 5.989), l: 15, m: 33.07),
  Cu: (d: (5.750, 5.751, 5.752, 5.753, 5.754, 5.750), l: 15, m: 33.35),
)

// data-2: 两种材料的共振频率，单位为Hz
#let data-2 = (
  Fe: (1200.00, 1200.01, 1200.02, 1200.03, 1199.99, 1199.98),
  Cu: (788.01, 788.03, 788.05, 788.07, 788.09, 788.05),
)

// sample: 用于外延法测量的样品，Fe或Cu
#let sample = "Cu"

// data-3: 外延法测量样品节点处共振频率，单位为Hz
#let data-3 = (795.47, 793.30, 791.50, 790.02, 789.20, 788.69, 788.57, 788.77, 789.66, 790.55)
// === END ===

#{ unit.Youngs = math.upright($N slash m^2$) }

#show: preview-section

== 预习要点

*实验目的：*
+ 动态悬挂法测量金属材料的杨氏模量
+ 了解长棒横振动的物理模型
+ 掌握共振信号的判定及其共振频率的测定
+ 学习根据误差分析选择测量仪器
+ 学习外延法测定试样节点处共振频率

*杨氏模量的物理意义：*
描述材料抵抗形变能力的物理量，该值越大，材料越不易发生形变。
仅与材料的结构、化学成分及其加工制造方法及温度有关。

*常见测量方法：*
+ 静态测量法：对试样直接加力，测量形变，其原理直观，设备简单。
+ 动态测量法：基于振动的方法，测量速度快，适用范围广。本次实验使用动态测量法。

== 注意事项

+ 共振器中传感器的钩子、焊点脆弱，勿拉、勿折、勿转，小心操作
+ 单丝悬挂，对称，横平竖直
+ 电缆线装与卸，注意保护接头
+ 正确使用示波器

#show: report-section

== 实验目的

+ 动态悬挂法测量金属材料的杨氏模量
+ 了解长棒横振动的物理模型
+ 掌握共振信号的判定及其共振频率的测定
+ 学习根据误差分析选择测量仪器
+ 学习外延法测定试样节点处共振频率

== 实验原理

根据棒的横振动方程
$(partial^2 y) / (partial t^2) + (E J) / (rho S) (partial^4 y) / (partial x^4) = 0$，
式中$rho$、$S$、$E$、$J$分别表示材料的密度、棒的截面积、材料的杨氏模量、特定截面的惯性矩。
求解方程，得圆形棒的杨氏模量为
$E = 1.6067 (l^3 m) / (d^4) f^2$，
式中$l$为棒长，$d$为棒的截面直径，$m$为棒的质量。
在实验中测出样品棒的固有频率，即可由上式计算出样品的杨氏模量。
在国际单位制中杨氏模量的单位为#h(-0.25em, weak: true)
$"牛顿·米"^(-2)$ （#unit.Youngs）。

#figure(image("fig1.png"), caption: "实验装置图")

将信号发生器输出的等幅正弦波信号，
经过放大器加在激振器上，把电信号转变成机械振动，
再由悬线把机械振动传给样棒，使得样棒受迫横振动。
样棒另一端的悬线把样棒的振动传给拾振器，
这时机械振动又转变成电信号，该信号经放大后送到示波器上显示。

当信号发生器的频率不等于样棒的固有频率时，样棒不发生共振，示波器显示屏上的信号的幅度不大。
当信号发生器的信号频率等于样棒的固有频率时，样棒发生共振，示波器上波形幅度突然增大，
读出此时的频率为共振频率。
由于样棒的固有频率与共振频率相差甚小，可作为样棒的固有频率。

外延法：改变悬挂点距试样端面的位置，分别测出不同位置对应的共振频率，
以悬挂点相对位置为横坐标、共振频率为纵坐标作图，根据规律通过作图法获得节点处的共振频率。

== 仪器

悬挂法杨氏模量测量仪、示波器、低频信号发生器、电子秤、螺旋测微器、游标卡尺、铜棒和铁棒

== 实验内容与步骤

+ 测定样棒的长度、直径和质量
+ 在室温下铁和铜的杨氏模量分别约为$2 pow10(11) unit.Youngs$和$1.2 pow10(11) unit.Youngs$，先估算出共振频率，以便寻找共振点
+ 分别测出铁棒和铜棒的固有频率
+ 分别计算出铁棒和铜棒的杨氏模量
+ 用外延法测量样棒节点的共振频率

== 数据处理与分析

+ 圆形棒试样的几何尺寸和质量测量

  $Delta d_"仪" = 0.004 unit.mm, quad Delta l_"仪" = 0.002 unit.cm, quad Delta m_"仪" = 0.02 unit.g, quad d_"初" = #float-to-str(d-init, 3) unit.mm$

  #table(
    columns: (1fr,) * 9,
    table.cell(rowspan: 2)[材料],
    table.cell(colspan: 6)[直径 $d_"末"$ / #unit.mm],
    table.cell(rowspan: 2)[长度\ $l$ / #unit.cm],
    table.cell(rowspan: 2)[质量\ $m$ / #unit.g],
    ..range(1, 7).map(i => str(i)),
    "Fe", ..data-1.Fe.d.map(n => float-to-str(n, 3)), float-to-str(data-1.Fe.l, 3), float-to-str(data-1.Fe.m, 2),
    "Cu", ..data-1.Cu.d.map(n => float-to-str(n, 3)), float-to-str(data-1.Cu.l, 3), float-to-str(data-1.Cu.m, 2),
  )

+ 两种材料的共振频率

  $Delta f_"仪" = 0.2 unit.Hz$

  #table(
    columns: 8,
    table.cell(rowspan: 2)[材料],
    table.cell(colspan: 6)[共振频率 $f$ / #unit.Hz],
    table.cell(rowspan: 2)[平均\ $macron(f)$ / #unit.Hz],
    ..range(1, 7).map(i => str(i)),
    "Fe", ..data-2.Fe.map(n => float-to-str(n, 2)), float-to-str(mean(data-2.Fe), 2),
    "Cu", ..data-2.Cu.map(n => float-to-str(n, 2)), float-to-str(mean(data-2.Cu), 2),
  )

*数据处理：*

#{
  data-1.Fe.d = data-1.Fe.d.map(n => calc.round(n - d-init, digits: 3))
  data-1.Cu.d = data-1.Cu.d.map(n => calc.round(n - d-init, digits: 3))
}
#let d-Fe-mean = calc.round(mean(data-1.Fe.d), digits: 3)
#let sd-Fe = calc.round(sample-standard-deviation(data-1.Fe.d), digits: 4)
#let errd-Fe = calc.round(calc.max(sd-Fe, 0.002), digits: 3)

#let f-Fe-mean = calc.round(mean(data-2.Fe), digits: 2)
#let sf-Fe = calc.round(sample-standard-deviation(data-2.Fe), digits: 3)
#let errf-Fe = calc.round(calc.max(sf-Fe, 0.12), digits: 2)

铁棒
$macron(d) = #d-Fe-mean unit.mm, quad
Delta d_"仪" = 0.004 unit.mm, quad
sigma_d_"仪" = 0.004 slash sqrt(3) = 0.002 unit.mm ,$

$
  sigma_d & = #scale(x: 91%, reflow: true)[$sqrt(
              (#{ data-1.Fe.d.map(n => [$(#n"−"#d-Fe-mean)^2$]).join("+") }) /
              (6 - 1)
            )$] \
          & = #sd-Fe unit.mm
            #{ if sd-Fe > 0.002 { ">" } else { "<" } } sigma_d_"仪",
$

所以，$d = ( #d-Fe-mean plus.minus #errd-Fe ) unit.mm$.

$macron(f) = #f-Fe-mean unit.Hz, quad
Delta f_"仪" = 0.2 unit.Hz, quad
sigma_f_"仪" = 0.2 slash sqrt(3) = 0.12 unit.Hz ,$

$
  sigma_f & = #scale(x: 72%, reflow: true)[$sqrt(
              (#{ data-2.Fe.map(n => [$(#n"−"#f-Fe-mean)^2$]).join("+") }) /
              (6 - 1)
            )$] \
          & = #sf-Fe unit.Hz
            #{ if sf-Fe > 0.12 { ">" } else { "<" } } sigma_f_"仪" ,
$

所以，$f = ( #f-Fe-mean plus.minus #errf-Fe ) unit.Hz$.

#let E-Fe = (
  1.6067
    * calc.pow(data-1.Fe.l * 0.01, 3)
    * data-1.Fe.m
    * 0.001
    * f-Fe-mean
    * f-Fe-mean
    / calc.pow(d-Fe-mean * 0.001, 4)
)

$macron(E) & = 1.6067 (l^3 m) / (macron(d)^4) macron(f)^2 \
& = 1.6067 times ((#float-to-str(data-1.Fe.l, 3) pow10(-2))^3 times #data-1.Fe.m pow10(-3)) / ((#d-Fe-mean pow10(-3))^4) times #f-Fe-mean^2 \
& = #sci-notation(E-Fe, 3) unit.Youngs ,$

#let sE-Fe = (
  E-Fe
    * calc.sqrt(
      4 * calc.pow(errd-Fe / d-Fe-mean, 2)
        + 16 * calc.pow(0.02 / data-1.Fe.m, 2)
        + 9 * calc.pow(errf-Fe / f-Fe-mean, 2)
        + calc.pow(0.004 / d-Fe-mean, 2),
    )
)
#let exp-E-Fe = calc.floor(calc.log(E-Fe))

$sigma_E & = sqrt(
  2^2 times (0.1/ #f-Fe-mean)^2 +
  4^2 times (0.004/ #d-Fe-mean)^2 +
  3^2 times (0.002/ #data-1.Fe.l)^2 +
  (0.02/ #data-1.Fe.m)^2
) times #sci-notation(E-Fe, 3) \
& = #sci-notation(sE-Fe, 3, exponent: exp-E-Fe) unit.Youngs ,$

所以，$E_"Fe" = ( #float-to-str(E-Fe / calc.pow(10, exp-E-Fe), 3) plus.minus #float-to-str(sE-Fe / calc.pow(10, exp-E-Fe), 3) ) pow10(#exp-E-Fe) unit.Youngs$.


#let d-Cu-mean = calc.round(mean(data-1.Cu.d), digits: 3)
#let sd-Cu = calc.round(sample-standard-deviation(data-1.Cu.d), digits: 4)
#let errd-Cu = calc.round(calc.max(sd-Cu, 0.002), digits: 3)

#let f-Cu-mean = calc.round(mean(data-2.Cu), digits: 2)
#let sf-Cu = calc.round(sample-standard-deviation(data-2.Cu), digits: 3)
#let errf-Cu = calc.round(calc.max(sf-Cu, 0.12), digits: 2)

铜棒
$macron(d) = #d-Cu-mean unit.mm, quad
Delta d_"仪" = 0.004 unit.mm, quad
sigma_d_"仪" = 0.004 slash sqrt(3) = 0.002 unit.mm ,$

$
  sigma_d & = #scale(x: 86%, reflow: true)[$sqrt(
              (#{ data-1.Cu.d.map(n => [$(#n"−"#d-Cu-mean)^2$]).join("+") }) /
              (6 - 1)
            )$] \
          & = #sd-Cu unit.mm
            #{ if sd-Cu > 0.002 { ">" } else { "<" } } sigma_d_"仪",
$

所以，$d = ( #d-Cu-mean plus.minus #errd-Cu ) unit.mm$.

$macron(f) = #f-Cu-mean unit.Hz, quad
Delta f_"仪" = 0.2 unit.Hz, quad
sigma_f_"仪" = 0.2 slash sqrt(3) = 0.12 unit.Hz ,$

$
  sigma_f & = #scale(x: 75%, reflow: true)[$sqrt(
              (#{ data-2.Cu.map(n => [$(#n"−"#f-Cu-mean)^2$]).join("+") }) /
              (6 - 1)
            )$] \
          & = #sf-Cu unit.Hz
            #{ if sf-Cu > 0.12 { ">" } else { "<" } } sigma_f_"仪" ,
$

所以，$f = ( #f-Cu-mean plus.minus #errf-Cu ) unit.Hz$.

#let E-Cu = (
  1.6067
    * calc.pow(data-1.Cu.l * 0.01, 3)
    * data-1.Cu.m
    * 0.001
    * f-Cu-mean
    * f-Cu-mean
    / calc.pow(d-Cu-mean * 0.001, 4)
)
#let exp-E-Cu = calc.floor(calc.log(E-Cu))

$macron(E) & = 1.6067 (l^3 m) / (macron(d)^4) macron(f)^2 \
& = 1.6067 times ((#float-to-str(data-1.Cu.l, 3) pow10(-2))^3 times #data-1.Cu.m pow10(-3)) / ((#d-Cu-mean pow10(-3))^4) times #f-Cu-mean^2 \
& = #sci-notation(E-Cu, 3) unit.Youngs ,$

#let sE-Cu = (
  E-Cu
    * calc.sqrt(
      4 * calc.pow(errd-Cu / d-Cu-mean, 2)
        + 16 * calc.pow(0.02 / data-1.Cu.m, 2)
        + 9 * calc.pow(errf-Cu / f-Cu-mean, 2)
        + calc.pow(0.004 / d-Cu-mean, 2),
    )
)

$sigma_E & = sqrt(
  2^2 times (0.1/ #f-Cu-mean)^2 +
  4^2 times (0.004/ #d-Cu-mean)^2 +
  3^2 times (0.002/ #data-1.Cu.l)^2 +
  (0.02/ #data-1.Cu.m)^2
) times #sci-notation(E-Cu, 3) \
& = #sci-notation(sE-Cu, 3, exponent: exp-E-Cu) unit.Youngs ,$

所以，$E_"Cu" = ( #float-to-str(E-Cu / calc.pow(10, exp-E-Cu), 3) plus.minus #float-to-str(sE-Cu / calc.pow(10, exp-E-Cu), 3) ) pow10(#exp-E-Cu) unit.Youngs$.

3. 用外延法测量#{ if sample == "Cu" { "铜" } else { "铁" } }棒节点的共振频率

  #{
    set text(size: 10.5pt)
    table(
      columns: 11,
      [$x$ / #unit.cm], ..range(1, 11).map(i => float-to-str(i * 0.5, 2)),
      [$f$ / #unit.Hz], ..data-3.map(n => float-to-str(n, 2)),
    )
  }

  #let fit(r-data, f-data) = {
    let n = r-data.len()
    let t-data = r-data.map(r => calc.pow(r - 0.224, 2))

    let sum-t = t-data.sum()
    let sum-f = f-data.sum()
    let sum-tt = t-data.map(t => t * t).sum()
    let sum-tf = t-data.zip(f-data).map(((t, f)) => t * f).sum()

    let denominator = n * sum-tt - sum-t * sum-t

    let a = (n * sum-tf - sum-t * sum-f) / denominator
    let f0 = (sum-f - a * sum-t) / n
    return (a, f0)
  }

  #let (a, f0) = fit(range(1, 11).map(i => i * 0.5 / data-1.at(sample).l), data-3)
  #let fx = x => a * (x - 0.224) * (x - 0.224) + f0
  #let t = lq.linspace(0, 0.4)

  #figure(
    caption: [验证马吕斯定律$P dash theta$图],
    lq.diagram(
      xlabel: [相对位置$x slash l$],
      ylabel: [共振频率$f slash unit.Hz$],
      xaxis: (lim: (0, 0.4), subticks: none),
      yaxis: (subticks: none),
      width: 14.5cm,
      height: 8.5cm,
      lq.scatter(range(1, 11).map(i => i * 0.5 / data-1.at(sample).l), data-3, mark: "x"),
      lq.plot(t, t.map(fx), color: black, smooth: true, mark: none),
    ),
  )

  #let E = (
    1.6067
      * calc.pow(data-1.at(sample).l * 0.01, 3)
      * data-1.at(sample).m
      * 0.001
      * f0
      * f0
      / calc.pow((if sample == "Cu" { d-Cu-mean } else { d-Fe-mean }) * 0.001, 4)
  )
  #let exp-E = calc.floor(calc.log(E))

  以相对位置$x slash l$为横轴，共振频率$f$为纵轴作图；
  由图可知节点处的共振频率为$#float-to-str(f0, 2) unit.Hz$，
  计算得到$E = #sci-notation(E, 3) unit.Youngs$。

== 结果与讨论

本次实验测得铁棒的杨氏模量为$( #float-to-str(E-Fe / calc.pow(10, exp-E-Fe), 3) plus.minus #float-to-str(sE-Fe / calc.pow(10, exp-E-Fe), 3) ) pow10(#exp-E-Fe) unit.Youngs$，
铜棒的杨氏模量为$( #float-to-str(E-Cu / calc.pow(10, exp-E-Cu), 3) plus.minus #float-to-str(sE-Cu / calc.pow(10, exp-E-Cu), 3) ) pow10(#exp-E-Cu) unit.Youngs$，
与理论值接近。
由外延法测得#{ if sample == "Cu" { "铜" } else { "铁" } }棒
节点处的共振频率为$#float-to-str(f0, 2) unit.Hz$，
计算得杨氏模量为$#sci-notation(E, 3) unit.Youngs$。

实验过程中，在寻找波幅最大的共振点时，调整频率波形幅度变化较小，准确读数略有困难，导致测量的共振频率存在一定误差。

== 分析讨论题

- *如何较准确地确定共振频率？*

  从小到大缓慢调节信号发生器频率，观察示波器上波形的变化，
  当波形幅度突然增大时停止调节，接着微调频率以寻找波形幅度最大的点，读出此时的频率作为共振频率。
  此外，还需要事先预估共振信号的范围，识别真假基频共振信号。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
