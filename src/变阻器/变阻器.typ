#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "变阻器的使用与电路控制",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = "数据-变阻器.jpg"

// === 请填入你的数据 ===
// data-1-1: 制流电路
// 数据对应x = 0, 0.1, .., 1.0的电流值，单位为mA
#let data-1-1 = (
  8.5,
  9.3,
  10.8,
  12.1,
  13.9,
  16.1,
  19.7,
  26.6,
  34.7,
  57.8,
  101.2,
)

// data-1-2: 加细调电路
// 数据对应x = 0, 0.1, .., 1.0的电流值，单位为mA
#let data-1-2 = (
  28.6,
  29.9,
  31.5,
  33.2,
  35.1,
  37.9,
  40.3,
  43.0,
  46.3,
  50.4,
  54.9,
)

// data-2-1: 分压电路
// 数据对应x = 0, 0.1, .., 1.0的电压值，单位为V，k=1
#let data-2-1 = (
  0.02,
  0.24,
  0.41,
  0.69,
  0.98,
  1.21,
  1.53,
  1.80,
  2.17,
  2.60,
  3.00,
)

// data-2-2: 分压电路
// 数据对应x = 0, 0.1, .., 1.0的电压值，单位为V，k>10
#let data-2-2 = (
  0.00,
  0.27,
  0.57,
  0.86,
  1.24,
  1.51,
  1.82,
  2.13,
  2.44,
  2.68,
  3.00,
)
// === END ===

#show: preview-section

== 预习要点

*实验目的：*
+ 掌握简单控制电路的设计——正确选择参数、连接方法
+ 培养探索精神及分析问题解决问题的能力
+ 学会设计最佳实验方案，充分发挥主观能动性
+ 掌握计算机辅助设计的基本方法及使用计算机作图

控制电路选择原则:

+ 如果要求负载上的电压或电流从0开始变化，则选择分压电路
+ 如果要求负载上的电压或电流不从0开始变化，选择制流电路（主要从功率损耗方面考虑）
+ 如果选择制流电路，则根据设计要求计算电路特征系数，由此确定是否需要增加细调电路

== 注意事项

+ 仪器布局合理：“便于连线，利于操作，易于观察，保证安全”
+ 一个一个回路接线
+ 先接线，后通电
+ 先断电，后拆线

#show: report-section

== 实验目的

+ 掌握简单控制电路的设计——正确选择参数、连接方法
+ 培养探索精神及分析问题解决问题的能力
+ 学会设计最佳实验方案，充分发挥主观能动性
+ 掌握计算机辅助设计的基本方法及使用计算机作图

== 实验原理

一个实验电路一般可以分为电源、控制电路和测量电路三部分。
测量电路是事先根据实验方法确定好的，可以把它抽象地用一个电阻$R$来代替，称为负载。
根据负载所要求的电压$U$和电流$I$，选定电源。
只要选择电源的端电压$U_0$略大于$U$，额定电流大于$I$即可。
而控制电路中电压和电流的变化，都可用滑线变阻器来实现。控制电路有制流和分压两种最基本接法。
两种接法的性能和特点可由特性曲线、调节范围、细调程度来表征。

+ 制流电路与制流特性曲线

  #figure(
    image("fig1.png", width: 16cm),
    caption: "制流电路与制流特性曲线",
  ) <fig1>

  引进参数：$k = R slash R_0$，指负载电阻与滑线电阻之比，又称为电路特征系数；
  $x = R_1 slash R_0$，指滑动端在滑线电阻上的相对位置。
  从直流特性曲线可以看到：负载$R$上通过的电流不可能为零；
  $k$愈大，电流调节范围越小，但电路的线性程度愈好；
  对$k >= 1$，调节的线性比较好，电流调节范围适中；
  对$k$很小，电流调节范围很大，但线性程度很差，当$x$接近1时电流变化很大，细调程度不够。
  引入$k$与$x$后，制流电路电流的调节范围为$k/(k+1) I_"max" tilde.op I_"max"$。
  当$k$值较大或$x$值较小时，控制电路能够较精确地改变负载上的电流；
  当$k$值较小或$x$值较大时，细调能力下降。

+ 分压电路与分压特性曲线

  #figure(
    image("fig2.png", width: 16cm),
    caption: "分压电路与分压特性曲线",
  ) <fig2>

  与制流电路类似，引入参数$k = R slash R_0$和$x = R_1 slash R_0$。
  对于不同的$k$值，$x$与$U$的关系如#[@fig2]分压特性曲线所示。

  由图可知，若要使电压$U$在0到$U_0$整个范围内均匀变化，则取$k>1$比较合适；
  分压电路的调节范围和变阻器阻值无关；
  当$k$远大于1时，电路元件选定后，在整个滑线变阻器的调节范围内，细条程度处处一样；
  当$k$远小于1时，如果$x$较小，控制电路也能较精细地改变负载电流，而如果$x$较大，细调能力下降；
  当$k$在1附近时，细调程度介于前两者之间。

== 仪器

滑线变阻器、多量程电压表、多量程电流表、可变电阻箱、电源

== 实验内容与步骤

+ 设计一个负载为42#unit.Omega，电流调节范围为0.01－0.1A的制流电路。
+ 设计一个电压变化范围为0－3V，总负载为1000#unit.Omega（总负载是指电压表与电阻箱的并联电阻）的分压电路，研究其在$k=1$和$k>10$两种情况下的分压特性曲线。

== 数据处理与分析

#let dx-1-1 = 1 / (data-1-1.len() - 1)
#let dx-1-2 = 1 / (data-1-2.len() - 1)
#let dx-2-1 = 1 / (data-2-1.len() - 1)
#let dx-2-2 = 1 / (data-2-2.len() - 1)

+ 制流电路

  分析：电路示意图如#[@fig1]所示。根据题设，$R = 42 #unit.Omega$，$I_"max" = 0.10 unit.A$，$I_"min" = 0.01 unit.A$，所以电流表量程为$150 unit.mA$。
  因为$U = R dot I_"max" = 4.2 unit.V$，而电源电压要求$E >= U$，根据实验室提供的电源，可选择$E=4.5 unit.V$。
  利用$k = R slash R_0$，那么$k = (U slash I_"max") / (U slash I_"min" - U slash I_"max") = 0.01 / (0.1 - 0.01) approx 0.111$；
  则$R_0 = R slash k = 42 / 0.111 approx 378 unit.Omega$，根据实验室提供的变阻器，可以选择$R_0 = 420 unit.Omega$。
  电流表示值误差$Delta I = 150 unit.mA * 0.5% = 0.8 unit.mA$

  #table(
    columns: data-1-1.len() + 1,
    [$x$], ..range(data-1-1.len()).map(i => float-to-str(i * dx-1-1, 2)),
    [$I slash unit.mA$], ..data-1-1.map(i => float-to-str(i, 1)),
    [$I slash I_"max"$], ..data-1-1.map(i => float-to-str(i / data-1-1.last(), 3)),
  )

  #figure(
    lq.diagram(
      xlabel: $x$,
      ylabel: $I slash I_"max"$,
      width: 11cm,
      height: 7cm,
      lq.plot(range(data-1-1.len()).map(i => i * dx-1-1), data-1-1.map(i => i / data-1-1.last()), smooth: true),
    ),
    caption: "制流特性曲线",
  )

  由制流电路特性曲线可知，$k=0.111$时，当$x$接近1时电流变化很大，细调程度不够。
  因此，在可以在主控电路基础上加上另一变阻器进行细调。
  实验中在主控$x=0.9$时，加一细调变阻器，实现$x$在0.8～0.9范围内的细调。
  那么此时细调变阻器$R'_0 = 1/10 R_0 = 42 unit.Omega$。
  根据实验室所提供仪器，细调变阻器选用56#unit.Omega。

  #figure(
    image("fig3.png", width: 55%),
    caption: "加细调电路",
  )

  #table(
    columns: data-1-2.len() + 1,
    [$x$], ..range(data-1-2.len()).map(i => float-to-str(i * dx-1-2, 2)),
    [$I slash unit.mA$], ..data-1-2.map(i => float-to-str(i, 1)),
    [$I slash I_"max"$], ..data-1-2.map(i => float-to-str(i / data-1-1.last(), 3)),
  )

  #figure(
    lq.diagram(
      xlabel: $x$,
      ylabel: $I slash I_"max"$,
      width: 11cm,
      height: 7cm,
      lq.plot(range(data-1-1.len()).map(i => i * dx-1-1), data-1-1.map(i => i / data-1-1.last()), smooth: true),
      lq.plot(range(data-1-2.len()).map(i => i * dx-1-2), data-1-2.map(i => i / data-1-1.last()), smooth: true),
    ),
    caption: "加细调后的制流特性曲线",
  ) <fine-adjustment>

  从#[@fine-adjustment]中可以看到，加细调后，在主控0.8～0.9的范围内，可以通过细调实现电路中电流较均匀的微小改变。

+ 分压电路

  根据电压变化范围，选择电源$E = 3 unit.V$；根据电压表量程3V档时内阻为$500 unit.Omega slash unit.V$，所以电压表的内阻 $R_"V" = 500 times 3 = 1500 unit.Omega$。
  根据并联电路$1/R_"总" = 1/R_"V" + 1/R$，
  即$1/1000 = 1/1500 + 1/R$ ，所以$R = 3000 unit.Omega$。
  当$k=1$时，由$R_"总" / R_0 = 1$，所以$R_0 = R_"总" = 1000 unit.Omega$；
  当$k>=10$时，由$R_"总" / R_0 >= 10$，要求$R_0 <= 100 unit.Omega$；考虑到功率损耗$w = U^2 / R$，所以选择$R_0 = 56 unit.Omega$。

  $k = 1, quad R_0 = 1000 unit.Omega, quad Delta U = 0.02 unit.V$

  #table(
    columns: data-2-1.len() + 1,
    [$x$], ..range(data-2-1.len()).map(i => float-to-str(i * dx-1-1, 2)),
    [$U slash unit.V$], ..data-2-1.map(i => float-to-str(i, 2)),
    [$U slash U_"max"$], ..data-2-1.map(i => float-to-str(i / data-2-1.last(), 3)),
  )

  $k > 10, quad R_0 = 56 unit.Omega$

  #table(
    columns: data-2-2.len() + 1,
    [$x$], ..range(data-2-2.len()).map(i => float-to-str(i * dx-1-2, 2)),
    [$U slash unit.V$], ..data-2-2.map(i => float-to-str(i, 2)),
    [$U slash U_"max"$], ..data-2-2.map(i => float-to-str(i / data-2-2.last(), 3)),
  )

  #figure(
    lq.diagram(
      xlabel: $x$,
      ylabel: $U slash U_"max"$,
      width: 11cm,
      height: 7cm,
      legend: (position: bottom + right),
      lq.plot(
        range(data-2-1.len()).map(i => i * dx-2-1),
        data-2-1.map(i => i / data-2-1.last()),
        smooth: true,
        label: $k=1$,
      ),
      lq.plot(
        range(data-2-2.len()).map(i => i * dx-2-2),
        data-2-2.map(i => i / data-2-2.last()),
        smooth: true,
        label: $k > 10$,
      ),
    ),
    caption: "分压特性曲线",
  )

== 结果与讨论

通过本次实验，我理解不同连接方式下的控制电路的特性曲线，并学会了如何根据设计要求选择合适的电路连接方式和参数。
实验得到的分压特性曲线中曲线有波动，可能是读数时视线与电表刻度不垂直造成的误差。
此外一开始分压电路连接不正确，导致实验失败，后来重新连接后才得到了正确的结果。

== 分析讨论题

- - *选择分压或制流的主要依据是什么？*

    主要考虑负载对变阻器特性的要求。此外，对测量范围、线性程度、省电、安全经济及电源的稳定性、操作简便等进行综合考虑，使之处于最佳方案。

  - *若已确定选择分压法，那么选定变阻器阻值时，应考虑的主要因素是什么？
    若选择制流法又该如何考虑？*

    分压法重要考虑线性及电源特性；制流法应考虑电流范围、线性程度及省电。

- *细调时，细调变阻器与主控变阻器的阻值之比应如何确定？*

  一般取细调电阻$R'_0$为主控变阻值$R_0$的$1 slash 10$，此时细调线性很好，可以对负载作线性控制。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
