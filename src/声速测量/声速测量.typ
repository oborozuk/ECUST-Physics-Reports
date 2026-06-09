#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "声速测量",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = "数据-声速测量.jpg"

// === 请填入你的数据 ===
// f-air: 空气中共振频率，单位kHz
#let f-air = 39.07

// f-water: 水中共振频率，单位kHz
#let f-water = 250.61

// t-air: 室温，单位°C
#let t-air = 19.0

// t-water: 水温，单位°C
#let t-water = 16.0

// data-1: 驻波法测量空气中的声速
// x: 单位cm
// a: 信号强度
#let data-1 = (
  x: (3.85, 4.30, 4.75, 5.20, 5.65, 6.10, 6.55, 7.00, 7.40, 7.85, 8.25, 8.70),
  a: (130.68, 125.73, 118.80, 100.98, 99.00, 91.08, 87.12, 78.21, 75.24, 75.24, 71.28, 70.29),
)

// data-2: 相位比较法测量空气中的声速
// x: 单位cm
// shape: "r"表示李萨如图形为右斜线，"l"表示左斜线
#let data-2 = (
  x: (3.85, 4.30, 4.75, 5.15, 5.65, 6.05, 6.50, 6.90, 7.40, 7.80, 8.20, 8.70),
  shape: "rlrlrlrlrlrl",
)

// data-3: 驻波法测量水中的声速
// x: 单位cm
// a: 信号强度
#let data-3 = (
  x: (3.95, 4.37, 4.62, 4.90, 5.20, 5.45, 5.78, 6.10, 6.40, 6.70, 7.00, 7.30),
  a: (399.96, 427.68, 431.64, 431.64, 435.00, 419.76, 431.64, 427.68, 435.60, 443.52, 411.86, 419.76),
)

// data-4: 相位比较法测量水中的声速
// x: 单位cm
// shape: "r"表示李萨如图形为右斜线，"l"表示左斜线
#let data-4 = (
  x: (3.55, 3.85, 4.15, 4.45, 4.70, 4.90, 5.20, 5.50, 5.80, 6.10, 6.40, 6.70),
  shape: "rlrlrlrlrlrl",
)
// === END ===

#show: preview-section

== 预习要点

声波是一种在弹性介质中传播的机械波。

*实验目的：*
+ 学习用共振干涉法（驻波法）和相位比较法（行波法）测定超声波的传播速度
+ 加强对驻波及振动合成等理论知识的理解
+ 了解压电换能器的功能
+ 培养综合使用仪器的能力

声速$v = f lambda$

超声波的获得：压电换能器

驻波法原理：$x_(n+1) - x_n = lambda slash 2$

行波法原理：$Delta phi = 2 pi x slash lambda$

== 注意事项

+ 信号发生器的信号输出幅度不要过大，以免仪器过热而损坏
+ 依次移动S2，使测量数据满足逐差法要求
+ 螺旋来回转动会产生螺距间隙偏差，移动S2时应朝着一个方向转动声速测量仪的测微螺旋
+ S1与S2发射面和接收面要保持相互平行
+ S1与S2间距必须大于3cm，否则会损坏压电换能器

#show: report-section

== 实验目的

+ 学习用共振干涉法（驻波法）和相位比较法（行波法）测定超声波的传播速度
+ 加强对驻波及振动合成等理论知识的理解
+ 了解压电换能器的功能
+ 培养综合使用仪器的能力

== 实验原理

声速$v$、声源振动频率$f$和波长$lambda$之间的关系为$v= f lambda$。
可见，只要测得声波的频率$f$和波长$lambda$，就可求得声速$v$。
其中声波频率$f$可通过频率计测得。
本实验的主要任务是测量声波波长$lambda$，常用的方法有共振干涉法（驻波法）和相位比较法（行波法）。

*共振干涉法（驻波法）：*
按照波动理论，发生器发出的平面声波经介质到接收器，若接收面与发射面平行，
声波在接收面处就会被垂直反射，于是平面声波在两端面间来回反射并叠加。
当接收端面与发射头间的距离恰好等于半波长的整数倍时，叠加后的波就形成驻波。
此时相邻两波节（或波腹）间的距离等于半个波长（即$lambda slash 2$）。
当发生器的激励频率等于驻波系统的固有频率（本实验中压电陶瓷的固有频率）时，会产生驻波共振，波腹处的振幅达到最大值。

声波是一种纵波。
由纵波的性质可以证明，驻波波节处的声压最大。
当发生共振时，接收端面处为一波节，接收到的声压最大，转换成的电信号也最强。
移动接收器到某个共振位置时，如果示波器上出现了最强的信号，
继续移动接收器，再次出现最强的信号时，则两次共振位置之间的距离即为$lambda slash 2$。


*相位比较法（行波法）：*
波是振动状态的传播，也可以说是相位的传播。
在波的传播方向上的任何两点，如果其振动状态相同或者其相位差为$2 pi$的整数倍，
这两点间的距离应等于波长的整数倍，即
$l = n lambda$（$n$为整数），
利用这个公式可精确测量波长。

若超声波发生器发出的声波是平面波，当接收器端面垂直于波的传播方向时，其端面上各点都具有相同的相位。沿传播方向移动接收器时，总可以找到一个位置使得接受到的信号与发射器的激励电信号同相。继续移动接收器，直到找到的信号再一次与发射器的激励电信号同相时，移过的这段距离就等于声波的波长。

== 仪器

声速测量仪、示波器、信号发生器

== 实验内容与步骤

*用驻波法测量空气（水）中的声速：*
+ 将声速测量仪的S1和S2分别连接到信号发生器和示波器上，调整示波器使其显示出S2的输出信号
+ 调整信号发生器的输出频率调至压电陶瓷换能片的振动频率附近（空气中约为40kHz，水中约为250kHz）
+ 缓慢移动S2，使示波器上显示的信号强度达到最大，记录共振频率$f$
+ 由近及远移动S2，逐次记下各振幅最大时S2的位置为$x_1, x_2, dots, x_12$
+ 用逐差法算出声波波长的平均值

*用相位法测量空气（水）中的声速：*
+ 将声速测量仪的S1和S2分别连接到信号发生器和示波器上，调整示波器使其显示出S2的输出信号
+ 将示波器显示模式调整为X-Y，用李萨如图形观察发射波与接收波的位相差
+ 在共振条件下，缓慢移动S2，示波器上显示的李萨如图形为一条斜线时，记录此时S2的位置为$x_1, x_2, dots, x_12$
+ 用逐差法算出声波波长的平均值
+ 记下室温（水温）$t upright(°C)$
+ 根据声速的理论公式计算$t upright(°C)$时声速的理论值：
  $v = v_0 sqrt(T slash T_0) = v_0 sqrt(1 + t / 273.15)$，
  其中$v_0 = 331.45 unit.mps$为0°C时的声速，$T = (273.15 + t) upright(K)$

== 数据处理与分析

空气中共振频率为#float-to-str(f-air, 2)kHz，水中共振频率为#float-to-str(f-water, 2)kHz。
室温为#float-to-str(t-air, 1)°C，水温为#float-to-str(t-water, 1)°C。

#let calculate(t, f, data) = {
  let dx-mean = mean(range(0, 6).map(i => data.x.at(i + 6) - data.x.at(i)))
  let v = 10 / 3 * f * dx-mean
  let s-v = v * calc.sqrt(calc.pow(0.3 / f, 2) + calc.pow(0.0002 / dx-mean, 2))
  (dx-mean, v, s-v)
}

#let calc-content(t, f, data, air: false) = [
  #let (dx-mean, v, s-v) = calculate(t, f, data)

  $dash(Delta x) = (limits(Sigma)_(j = 1)^6 Delta x_j)/6 = #float-to-str(dx-mean, 2) unit.cm$,

  $sigma_(Delta x) = 1 / 6 sqrt(12 sigma^2_x_"仪") = 0.002 unit.cm$,

  $v = f lambda = 1 / 3 dot f dash(Delta x) = 1 slash 3 times #float-to-str(f, 2) pow10(3) times #float-to-str(dx-mean, 2) pow10(-2) = #float-to-str(v, 0) unit.mps$,

  $sigma_v = v sqrt((sigma_f_"仪" / f)^2 + (sigma_(Delta x) / dash(Delta x))^2)
  = #float-to-str(v, 2) times sqrt((0.3 / #float-to-str(f, 2))^2 + (0.002 / #float-to-str(dx-mean, 2))^2)
  = #float-to-str(s-v, 0) unit.mps$,

  所以，$v plus.minus sigma_v = ( #float-to-str(v, 0) plus.minus #float-to-str(s-v, 0) ) unit.mps$.

  #if air [
    #let v-theory-air = 331.45 * calc.sqrt(1 + t-air / 273.15)

    $v_s = v sqrt(1 + t slash 273.15) = #float-to-str(v-theory-air, 2) unit.mps$,

    $E% = abs(v - v_s) / v_s times 100% = abs(#float-to-str(v, 0) - #float-to-str(v-theory-air, 2)) / #float-to-str(v-theory-air, 2) times 100% = #float-to-str(calc.abs(v - v-theory-air) / v-theory-air * 100, 2) %$.
  ]
]

#let method-1(t, f, data, air: false) = [
  #{
    table(
      columns: (auto,) + (1fr,) * 6,
      "次数", ..range(1, 7).map(str),
      $x_i slash unit.cm$, ..data.x.slice(0, 6).map(x => float-to-str(x, 2)),
      "强度", ..data.a.slice(0, 6).map(a => float-to-str(a, 2)),
      table.hline(stroke: 1.5pt),
      "次数", ..range(7, 13).map(str),
      $x_i slash unit.cm$, ..data.x.slice(6, 12).map(x => float-to-str(x, 2)),
      "强度", ..data.a.slice(6, 12).map(a => float-to-str(a, 2)),
      table.hline(stroke: 1.5pt),
      $Delta x_j slash unit.cm$, ..range(0, 6).map(i => float-to-str(data.x.at(i + 6) - data.x.at(i), 2)),
    )
  }
  #calc-content(t, f, data, air: air)
]

#let method-2(t, f, data, air: false) = [
  #{
    table(
      columns: (auto,) + (1fr,) * 6,
      "次数", ..range(1, 7).map(str),
      [$x_i slash unit.cm$], ..data.x.slice(0, 6).map(x => float-to-str(x, 2)),
      "波形",
      ..data
        .shape
        .slice(0, 6)
        .clusters()
        .map(s => if s == "r" { rotate(-45deg, line(length: 14pt)) } else { rotate(45deg, line(length: 14pt)) }),
      table.hline(stroke: 1.5pt),
      "次数", ..range(7, 13).map(str),
      [$x_i slash unit.cm$], ..data.x.slice(6, 12).map(x => float-to-str(x, 2)),
      "波形",
      ..data
        .shape
        .slice(6, 12)
        .clusters()
        .map(s => if s == "r" { rotate(-45deg, line(length: 14pt)) } else { rotate(45deg, line(length: 14pt)) }),
      table.hline(stroke: 1.5pt),
      [$Delta x_j slash unit.cm$], ..range(0, 6).map(i => float-to-str(data.x.at(i + 6) - data.x.at(i), 2)),
    )
  }
  #calc-content(t, f, data, air: air)
]

1. 用驻波法测量空气中的声速

  #method-1(t-air, f-air, data-1, air: true)

  #let (_, v-air, s-v-air) = calculate(t-air, f-air, data-1)

  #figure(
    caption: "驻波幅度距离关系图",
    lq.diagram(
      xlabel: $L slash unit.cm$,
      ylabel: $U slash unit.mV$,
      width: 12cm,
      height: 6.5cm,
      lq.plot(data-1.x, data-1.a),
    ),
  )

2. 相位比较法测量空气中的声速

  #method-2(t-air, f-air, data-2, air: true)

  #let (_, v-air-2, s-v-air-2) = calculate(t-air, f-air, data-2)

3. 用驻波法测量水中的声速

  #method-1(t-water, f-water, data-3)

  #let (_, v-water, s-v-water) = calculate(t-water, f-water, data-3)

4. 相位比较法测量水中的声速

  #method-2(t-water, f-water, data-4)

  #let (_, v-water-2, s-v-water-2) = calculate(t-water, f-water, data-4)

== 结果与讨论

本次实验用驻波法测得空气中的声速为$( #float-to-str(v-air, 0) plus.minus #float-to-str(s-v-air, 0) ) unit.mps$，水中的声速为$( #float-to-str(v-water, 0) plus.minus #float-to-str(s-v-water, 0) ) unit.mps$；
用相位比较法测得空气中的声速为$( #float-to-str(v-air-2, 0) plus.minus #float-to-str(s-v-air-2, 0) ) unit.mps$，水中的声速为$( #float-to-str(v-water-2, 0) plus.minus #float-to-str(s-v-water-2, 0) ) unit.mps$；
观察到声波在空气中传播时声强随传播距离衰减。

本次实验测得数值基本符合理论值，但相位法测水中声速的结果误差稍大；
误差主要来源于测微螺旋的读数误差，驻波振幅最大值与相位法李萨如图形的判断不够精准。

== 分析讨论题

- *如何调节与判断测量系统是否处于共振状态？*

根据实验室给出的压电陶瓷换能片的振动频率$f$（空气中约为40kHz，水中约为250kHz），
将信号发生器的输出频率调至$f$附近，缓慢移动S2，
当在示波器上看到正弦波首次出现振幅较大处，固定S2，
再仔细微调信号发生器的输出频率，使屏幕上图形振幅达到最大，读出共振频率$f$。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
