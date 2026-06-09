#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "光速测量",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  // experiment-class: "AB12",
  // group-number: "1A",
  // teacher: "大花梨",
)

#let data-image = "数据-光速测量.jpg"

// === 请填入你的数据 ===
// data-1: 时间差法测量光在空气中传播速度
// f: 测量信号频率，单位为MHz
// t1: 时间差，单位为μs
#let data-1 = (
  f: 99.87,
  t1: (
    10.04,
    10.32,
    10.60,
    11.04,
    11.48,
    11.88,
  ),
)

// data-2: 相位差法测量光在空气中传播速度
// x1: 反射棱镜位置1，单位为mm
// x2: 反射棱镜位置2，单位为mm
#let data-2 = (
  x1: (177.6, 177.9, 176.9, 177.4, 177.8, 177.5),
  x2: (823.5, 823.0, 823.2, 822.9, 823.7, 823.1),
)

// data-3: 比较法测量光在石英玻璃中的传播速度
// l: 样品长度，单位为m
// x1: 反射棱镜位置1，单位为m
// x2: 反射棱镜位置2，单位为m
#let data-3 = (
  l: 0.5,
  x1: (0.524, 0.524, 0.524),
  x2: (0.626, 0.628, 0.629),
)

// data-4: 比较法测量光在水中的传播速度
// l: 样品长度，单位为m
// x1: 反射棱镜位置1，单位为m
// x2: 反射棱镜位置2，单位为m
#let data-4 = (
  l: 0.52,
  x1: (0.546, 0.546, 0.546),
  x2: (0.638, 0.639, 0.638),
)
// === END ===

#show: preview-section

== 预习要点

*实验目的：*
+ 了解光调制测量光速方法
+ 掌握时间差法测量光的传播速度
+ 掌握相位差法测量光的传播速度
+ 掌握测量介质折射率的方法，并测量光在介质中传播的速度

时间差法：$c = (Delta s) / (Delta t_1) T_1 f$

相位差法：$c = (Delta s) / (Delta phi) 2 pi f$

介质中$n_"m" = (2 Delta x + L_"m") / L_"m"$，$c_"m" = c / n_"m"$


== 注意事项

+ 放置玻璃、水等介质时保证端面清洁、紧贴光路，避免偏移、气泡影响光程
+ 移动反射棱镜时轻缓操作

#show: report-section

== 实验目的

+ 了解光调制测量光速方法
+ 掌握时间差法测量光的传播速度
+ 掌握相位差法测量光的传播速度
+ 掌握测量介质折射率的方法，并测量光在介质中传播的速度

== 实验原理

如果光信号的调制频率为$f$，周期为$T$，
则光信号可以表示为
$I = I_0 + Delta I_0 cos(2 pi f t)$。
如果光接收器和发射器的距离为$Delta s$，
则光的传播延时为$Delta t = Delta s slash c$，
其中$c$为光速。
在$Delta s$的距离上产生的相位差为
$Delta phi = 2 pi f Delta t = 2 pi dot (Delta t) / T$。
被光电检测器接收后变为电信号，该电信号被滤除直流后可表示为
$U = a cos(2 pi f t - Delta phi)$。
可得光速
$c = (Delta s) / (Delta phi) 2 pi f$。

如果光的调制频率非常高，在短的传播距离$Delta s$内也会产生大的相位差$Delta phi$。
如果光的调制频率$f = 60.000 unit.MHz$，当$Delta s = 5 unit.m$ 时，就会使光信号的相位移达到一个周期$Delta phi = 2 pi$。
然而高频信号的测量和显示是非常不方便的，普通的教学示波器不能用于高频信号的相位差测量。

设在接收端还有一个高频信号$f' = 59.900 unit.MHz$作为参考信号，表示为
$U' = a' cos(2 pi f' t)$。
将$U$和$U'$相乘得到：
$U dot U' = a a' dot cos(2 pi f t - Delta phi) dot cos(2 pi f' t)
= 1/2 a a' cos [ 2 pi (f + f') t - Delta phi] + 1/2 a a' cos(2 pi (f - f') t - Delta phi) ]。$

可见经乘法器后将得到和频$f+f' = 60.000 + 59.900 = 119.000 unit.MHz$
及差频$f_1 = f-f' = 60.000 - 59.900= 100 unit.kHz$ 的混合信号。
将该混合信号通过一个中心频率为$100 unit.kHz$、带宽为$10 unit.kHz$的滤波器后，和频信号将被滤除，差频信号将保留。上式将变为
$U_1 = a_1 cos(2 pi f_1 t - Delta phi)$。

该信号频率仅为 $100 unit.kHz$，很容易被低频示波器观测到。$Delta phi$ 与信号 $f_1$ 的传播时间 $Delta t_1$ 相关，$Delta t_1$ 可以从示波器上观测到。设 $f_1$ 的周期为 $T_1$，则
$Delta phi = 2 pi f_1 Delta t_1 = 2 pi (Delta t_1) / T_1$。
得光速
$c = (Delta s) / (Delta t_1) T_1 f$。

使用比较法测量光在非空气介质中的传播速度$c_"m"$，如#[@measure]所示。

#figure(
  image("fig1.jpg"),
  caption: "比较法测量光在不同介质中传播速度",
) <measure>

在光路中加入玻璃或水介质进行第一次测量，总光程为$L_1$，传播时间为$t_1$，反光棱镜位置为$x_1$；
第二次测量时，将介质拿掉，测量信号的相位会发生变化，移动反光棱镜$Delta x$到位置$x_2$处，使测量信号相位回到第一次测量的位置，使光的传播时间和第一次相同为$t_1$，此时总光程为$L_1 + 2 Delta x$；
由此可以得出光在空气中传播距离$2 Delta x + L_"m"$和在介质中传播距离$L_"m"$所需时间相同。

由上述可以得出介质常数$n_"m" = (2 Delta x + L_"m") / L_"m"$，
因此介质中的光速为$c_"m" = c / n_"m"$.

== 仪器

DHLV-2光速测定仪、UTD2102CEX数字存储示波器

== 实验内容与步骤

+ 测量光在空气中的传播速度

  + 调节光路。
    棱镜全程滑动时，反射光完全射入接收头，从示波器上观察测量信号全程幅度变化小于1V。
    一般情况调节棱镜仰角便可将光路调合适。
  + 等间隔移动反射棱镜，记录对应的时间差，计算光速
  + 测量相位差为0度（180度）及90度时反射棱镜的位置，重复测量六次，用相位差计算光速

+ 测量光在水或石英玻璃中的光速

  + 将待测样品水或者石英玻璃棒安放在测试架上，样品放在激光返回的光路上，尽可能靠近光电探测装置，
    记下当前参考信号和测量信号的时间差$Delta t_1$，记下滑块及反射棱镜的位置$x_1$。
  + 将待测样品拿下，滑动滑块及反射棱镜使得参考信号和测量信号的时间差等于步骤（1）中的$Delta t_1$，记下滑块及反射棱镜的位置$x_2$。
  + 计算折射率$n_"m" = (2 Delta x + L_"m") / L_"m"$，光速$c_"m" = c / n_"m"$。

== 数据处理与分析

#let calc-cm = data => {
  let mean-delta-x = mean(data.x1.zip(data.x2).map(((x1, x2)) => x2 - x1))
  let n = (2 * mean-delta-x + data.l) / data.l
  let c = 299792458 / n
  (n, c, mean-delta-x)
}

#let display = data => [
  #table(
    columns: 4,
    [编号], [样品长度$L_"m" slash unit.m$], [反射棱镜位置$x_1 slash unit.m$], [反射棱镜位置$x_2 slash unit.m$],
    ..(
      for (i, (x1, x2)) in data.x1.zip(data.x2).enumerate(start: 1) {
        (
          str(i),
          float-to-str(data.l, 2),
          float-to-str(x1, 3),
          float-to-str(x2, 3),
        )
      }
    ),
  )

  #let (n, c, mean-delta-x) = calc-cm(data)

  $dash(Delta x) = #float-to-str(mean-delta-x, 4) unit.m, \
  n_"m" = (2 Delta x + L_"m") / L_"m"
  = (2 times #float-to-str(mean-delta-x, 4) + #float-to-str(data.l, 2)) / #float-to-str(data.l, 2)
  = #float-to-str(n, 4), \
  c_"m" = c / n_"m"
  = 299792458 / #float-to-str(n, 4)
  = #float-to-str(c / 1e8, 2) pow10(8) unit.mps. \ $
]

+ 使用时间差法测量光在空气中传播速度

  #table(
    columns: (auto, auto, 1fr, 1fr, auto, 1fr),
    [编号],
    [测量信号频率$slash unit.kHz$],
    [$T_1 slash unit.us$],
    [$x slash unit.cm$],
    [时间差$t_1 slash unit.us$],
    [$s slash unit.cm$],
    ..(
      for (i, t1) in data-1.t1.enumerate(start: 1) {
        (
          str(i),
          float-to-str(data-1.f, 2),
          float-to-str(1000 / data-1.f, 2),
          str(i * 10),
          float-to-str(t1, 2),
          str(i * 20),
        )
      }
    ),
  )

  #let (k, b) = linear-fit(range(1, 7).map(i => i * 0.2), data-1.t1.map(t => t / 1e6))

  #let c1 = 1 / k * 10 * 60
  #let c1-error = calc.abs(c1 - 299792458) / 299792458 * 100

  #figure(
    lq.diagram(
      xlabel: $s slash unit.cm$,
      ylabel: $t_1 slash unit.us$,
      width: 14cm,
      height: 8.5cm,
      legend: (position: bottom + right),
      lq.scatter(
        range(1, 7).map(i => i * 20),
        data-1.t1,
      ),
      lq.line(
        (15, 15e4 * k + b * 1e6),
        (130, 130e4 * k + b * 1e6),
        label: $t_1 = #float-to-str(k * 1e4, 4) s + #float-to-str(b * 1e6, 3)$,
      ),
    ),
  )

  $k = #float-to-str(k * 1e4, 5) unit.us slash unit.cm, \
  c = (T_1 f) / k
  = (#float-to-str(1000 / data-1.f, 2) pow10(-6) times 60 pow10(6)) / #sci-notation(k, 3) unit.mps
  = #float-to-str(c1 / 1e8, 2) pow10(8) unit.mps, \
  E% = #float-to-str(c1-error, 2) %.$

+ 使用相位差法测量光在空气中传播速度

  #table(
    columns: 4,
    [编号],
    [反射棱镜位置$x_1 slash unit.mm$],
    [反射棱镜位置$x_2 slash unit.mm$],
    [$Delta s slash unit.mm$],
    ..(
      for (i, (x1, x2)) in data-2.x1.zip(data-2.x2).enumerate(start: 1) {
        (
          str(i),
          float-to-str(x1, 1),
          float-to-str(x2, 1),
          float-to-str((x2 - x1) * 2, 1),
        )
      }
    ),
  )

  #let mean-delta-s = mean(data-2.x1.zip(data-2.x2).map(((x1, x2)) => x2 - x1)) * 2

  #let c2 = mean-delta-s / 1e3 * 4 * 60e6
  #let c2-error = calc.abs(c2 - 299792458) / 299792458 * 100

  $dash(Delta s) = #float-to-str(mean-delta-s, 2) unit.mm, \
  c = dash(Delta s) / (Delta phi) dot 2 pi f
  = (#float-to-str(mean-delta-s, 2) pow10(-3)) / (pi slash 4) times 2 pi times 60 pow10(6) unit.mps
  = #float-to-str(c2 / 1e8, 2) pow10(8) unit.mps, \
  E% = #float-to-str(c2-error, 2) %.$

+ 测量光在石英玻璃中的传播速度

  #display(data-3)

  #let (n-quartz, c-quartz, _) = calc-cm(data-3)


+ 测量光在水中的传播速度

  #display(data-4)

  #let (n-water, c-water, _) = calc-cm(data-4)

== 结果与讨论

本次实验用时间差法测得光速$c = #float-to-str(c1 / 1e8, 2) pow10(8) unit.mps$，相对误差$E% = #float-to-str(c1-error, 2) %$；
用相位差法测得光速$c = #float-to-str(c2 / 1e8, 2) pow10(8) unit.mps$，相对误差$E% = #float-to-str(c2-error, 2) %$；
用比较法测得光在石英玻璃中的传播速度$c_"石英" = #float-to-str(c-quartz / 1e8, 2) pow10(8) unit.mps$，折射率$n_"石英" = #float-to-str(n-quartz, 4)$；
测得光在水中的传播速度$c_"水" = #float-to-str(c-water / 1e8, 2) pow10(8) unit.mps$，折射率$n_"水" = #float-to-str(n-water, 4)$。
实验测得的数值与理论值基本符合，误差主要来自示波器判断信号相位差或时间差的位置时的判读误差，以及反光棱镜位置读数视差。

== 分析讨论题

- *本实验中光速的测量误差主要来源是什么？*

  在示波器上判断信号相位差或时间差的位置时，存在判读误差；反光棱镜位置依靠导轨读数，存在读数视差。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
