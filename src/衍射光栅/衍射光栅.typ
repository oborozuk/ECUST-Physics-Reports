#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "衍射光栅",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = "数据-衍射光栅.jpg"

// === 请填入你的数据 ===
// data-1: 平行光正入射条件
// white0: 白光方位角T_0
// green1: 绿光T_1
// green-1: 绿光T_(-1)
#let data-1 = (
  "white0": ((288, 25), (108, 30)),
  "green1": (297, 50),
  "green-1": (279, 2),
)

// data-2: 光栅常数的测量
// 每行分别是一次测量的T_1, T'_1, T_(-1), T'_(-1)
#let data-2 = (
  ((297, 55), (117, 50), (279, 5), (99, 2)),
  ((297, 53), (117, 49), (279, 5), (99, 2)),
  ((297, 53), (117, 48), (279, 4), (99, 2)),
  ((297, 54), (117, 49), (279, 3), (99, 1)),
  ((297, 53), (117, 48), (279, 4), (99, 2)),
  ((297, 55), (117, 50), (279, 3), (99, 0)),
)

// data-3-1: 黄内谱线波长的测量
// 每行分别是一次测量的T_1, T'_1, T_(-1), T'_(-1)
#let data-3-1 = (
  ((298, 25), (118, 24), (278, 33), (98, 30)),
  ((298, 26), (118, 24), (278, 32), (98, 30)),
  ((298, 27), (118, 23), (278, 34), (98, 29)),
)

// data-3-2: 黄外谱线波长的测量
#let data-3-2 = (
  ((298, 28), (118, 26), (278, 29), (98, 25)),
  ((298, 27), (118, 26), (278, 28), (98, 25)),
  ((298, 27), (118, 27), (278, 30), (98, 26)),
)

// data-3-3: 紫光谱线波长的测量
#let data-3-3 = (
  ((295, 57), (115, 54), (280, 55), (100, 55)),
  ((295, 57), (115, 54), (280, 55), (100, 55)),
  ((295, 56), (115, 53), (280, 54), (100, 54)),
)
// === END ===

#show: preview-section

== 预习要点

*实验目的：*
+ 观察光的衍射现象，加深对光栅衍射原理的理解
+ 进一步熟悉分光计的调节与使用
+ 测定光栅常数和汞原子特征光谱线的波长

光栅由大量相互平行、等宽、等距的狭缝构成。

光栅方程：$d sin phi = k lambda, med k = 0, plus.minus 1, plus.minus 2, ...$

#import "@preview/cetz:0.4.2"
#figure({
  set text(size: 9pt)
  set par(leading: .5em)
  cetz.canvas({
    import cetz.draw: *

    line((-1, 5), (1, 5), stroke: (dash: (6pt, 2.5pt)))
    content((1.5, 5), align(center)[光栅])

    line((-0.7, 5.3), (-0.7, 3.1), mark: (end: "straight", scale: 0.8), stroke: 0.7pt)
    line((-0.25, 5.3), (-0.25, 3), mark: (end: "straight", scale: 0.8), stroke: 0.7pt)
    line((0.25, 5.3), (0.25, 3), mark: (end: "straight", scale: 0.8), stroke: 0.7pt)
    line((0.7, 5.3), (0.7, 3.1), mark: (end: "straight", scale: 0.8), stroke: 0.7pt)

    arc((0, 3.5), start: 60deg, stop: 120deg, radius: 2, anchor: "arc-center")
    arc((0, 2.97), start: 240deg, stop: 300deg, radius: 2, anchor: "arc-center")

    line((-0.7, 3.1), (0, 0), stroke: 0.7pt)
    line((-0.25, 3), (0, 0), stroke: 0.7pt)
    line((0.25, 3), (0, 0), stroke: 0.7pt)
    line((0.7, 3.1), (0, 0), stroke: 0.7pt)
    
    line((-2.48, 0.85), (-2.48, 0.1), stroke: yellow)
    line((-2.4, 0.8), (-2.4, 0.1), stroke: yellow)
    content((-2.47, -0.11), "黄")
    line((-2.2, 0.66), (-2.2, -0.1), stroke: green)
    content((-2.18, -0.35), "绿")
    line((-1.5, 0.3), (-1.5, -0.5), stroke: blue + 0.75pt)
    line((-1, 0.12), (-1, -0.75), stroke: rgb("9933ff") + 0.75pt)
    content((-2, -1), align(center)[一级明条纹\ $k=-1$])

    line((0, 0), (0, -0.8), stroke: black + 1.5pt)
    content((0, -1.4), align(center)[中央明条纹\ $k=0$])
    
    line((2.48, 0.85), (2.48, 0.1), stroke: yellow)
    line((2.4, 0.8), (2.4, 0.1), stroke: yellow)
    content((2.47, -0.11), "黄")
    line((2.2, 0.66), (2.2, -0.1), stroke: green)
    content((2.18, -0.35), "绿")
    line((1.5, 0.3), (1.5, -0.5), stroke: blue + 0.75pt)
    line((1, 0.12), (1, -0.75), stroke: rgb("9933ff") + 0.75pt)
    content((2, -1), align(center)[一级明条纹\ $k=1$])

    arc((0, 0), start: 210deg, stop: 330deg, radius: 4, anchor: "arc-center")
  })
})

== 注意事项

+ 光栅是易损的光学元件，使用时要小心，不能用手触摸光栅面
+ 汞灯在使用过程中不能频繁启闭；汞灯光线很强，不要长时间直视
+ 旋转分光计各调节螺丝时应轻轻转动，防止其脱落或拧断；在望远镜和游标盘的制动螺丝旋紧时，不能硬扳

#show: report-section

== 实验目的

+ 观察光的衍射现象，加深对光栅衍射原理的理解
+ 进一步熟悉分光计的调节与使用
+ 测定光栅常数和汞原子特征光谱线的波长

== 实验原理

+ 衍射光栅、光栅常量

  光栅由大量相互平行、等宽、等距的狭缝构成。
  原制光栅是用金刚石刻刀在精制的平行平面的光学玻璃上刻划而成的。
  刻痕处，光射到它上面向四处散射而透不过去，两刻痕之间相当于透光狭缝。

  光栅上若刻痕宽度为$a$，刻痕间距为$b$，则$d=a+b$称为光栅常量，它是光栅基本参数之一。

+ 光栅方程、光栅光谱

  当一束平行单色光垂直入射到光栅平面上时，光波将发生衍射。
  光衍射角$phi$满足光栅方程$d sin phi = k lambda, med k = 0, plus.minus 1, plus.minus 2, ...$。
  光会叠加，衍射后的光波经过透镜会聚后，在焦平面上将形成分隔得较远的一系列对称分布明条纹。

  如果入射光波含几种不同波长的复色光，会形成衍射光谱。
  普通低压汞灯每一级有4条特征谱线：紫光$lambda_1 = 435.8 unit.nm$，绿光$lambda_2 = 546.1 unit.nm$，黄光$lambda_3 = 577.0 unit.nm$和$lambda_4 = 579.1 unit.nm$。

+ 光栅常量与汞灯特征谱线波长的测量

  光垂直入射到光栅上，若$lambda$已知，测出相应的$phi$，就可以算出光栅常量$d$；
  反之，若$d$已知，测出$phi_i$，可以计算$lambda_i$。

== 仪器

分光计、光栅、双面反射镜、汞灯

== 实验内容与步骤

+ 分光计调整与观察汞灯衍射光谱

  + 认真调整好分光计。
  + 将光栅放于载物台上。
    通过调平螺丝使光栅平面与平行光管光轴垂直。转动望远镜观察汞灯衍射光谱。
    中央零级为白色，望远镜分别转到左右时均可以看到第一级的4条彩色谱线。
  + 调节平行光管狭缝宽度，以能够分辨出两条紧靠的黄色谱线为准。

+ 光栅常量与光谱线波长的测量

  以绿光谱线的波长$lambda_2 = 546.1 unit.nm$作为已知，测出第一级绿光明条纹的衍射角$phi$。
  为了消除偏心差，同时读下$T$和$T'$双游标的读数。
  接下来以相同方法测量紫光、黄光的衍射角。

== 数据处理与分析

#let convert-to-angle = ((deg, min)) => (deg + min / 60) * 1deg

#let display-angle = d => {
  let deg = calc.floor(d / 1deg)
  let min = calc.round((d / 1deg - deg) * 60)
  if min == 60 {
    deg += 1
    min = 0
  }
  $deg degree min prime$
}

#let display = (angles, space: h(0.5em)) => {
  if type(angles) != array { angles = (angles,) }
  assert(angles.all(d => type(d) == angle))
  angles.map(display-angle).join(space)
}

#let calc-phi = (t1, t11, t-1, t-11) => {
  let phi1 = calc.abs(t1 - t-1) / 2
  let phi2 = calc.abs(t11 - t-11) / 2
  (phi1 + phi2) / 2
}

#{
  data-1 = data-1
    .pairs()
    .map(
      ((key, value)) => {
        value = if type(value.at(0)) == int {
          convert-to-angle(value)
        } else { value.map(convert-to-angle) }
        (key, value)
      },
    )
    .to-dict()

  let process = d => d.map(
    ((t1, t11, t-1, t-11)) => {
      let convert = t => convert-to-angle(t)
      (convert(t1), convert(t11), convert(t-1), convert(t-11))
    },
  )
  data-2 = process(data-2)
  data-3-1 = process(data-3-1)
  data-3-2 = process(data-3-2)
  data-3-3 = process(data-3-3)
}

#let display-table = (data, c) => table(
  columns: (1fr,) * 6,
  table.cell(rowspan: 2)[次数],
  table.cell(colspan: 5, c),
  $T_1$, $T'_1$, $T_(-1)$, $T'_(-1)$, $phi$,
  ..data
    .enumerate(start: 1)
    .map(
      ((i, (t1, t11, t-1, t-11))) => {
        let phi = calc-phi(t1, t11, t-1, t-11)
        (str(i), display(t1), display(t11), display(t-1), display(t-11), display(phi))
      },
    )
    .join(),
)

+ 平行光正入射条件

  #table(
    columns: (1fr,) * 4,
    table.cell(colspan: 4, align: left)[白光方位角 $T_0$ = #display(data-1.at("white0"))],
    $T_"绿1"$, $abs(T_"绿1" - T_0)$, $T_("绿−1")$, $abs(T_"绿−1" - T_0)$,
    display(data-1.at("green1")),
    display(calc.min(
      ..data-1.at("white0").map(t => calc.abs(t - data-1.at("green1"))),
    )),
    display(data-1.at("green-1")),
    display(calc.min(
      ..data-1.at("white0").map(t => calc.abs(t - data-1.at("green-1"))),
    )),
  )

  $abs(abs(T_"绿1" - T_0) - abs(T_"绿−1" - T_0)) < 10 prime$，
  说明平行光垂直入射到光栅上。

+ 光栅常数的测量

  #display-table(data-2, "绿光")

  #let phi-green = mean(data-2.map(t => calc-phi(..t)))
  #let d-res = 546.1 / calc.sin(phi-green)
  #let s-d = 546.1 * calc.cos(phi-green) / calc.pow(calc.sin(phi-green), 2) * calc.pi / 180 / 60

  根据公式$phi = (abs(T_1 - T_(-1)) + abs(T'_1 - T'_(-1))) slash 4$，可得衍射角
  $phi plus.minus sigma_phi = #display-angle(phi-green) plus.minus 1 prime$.

  $d = lambda / (sin phi) = (546.1 unit.nm) / (sin #display-angle(phi-green))
  = #float-to-str(d-res, 2) unit.nm$，
  $sigma_d = (lambda sigma_phi cos phi) / (sin^2 phi) = #float-to-str(s-d, 2) unit.nm$，
  所以光栅常数
  $d plus.minus sigma_d = (#float-to-str(d-res, 2) plus.minus #float-to-str(s-d, 2)) unit.nm$.

+ 黄内、黄外和紫光波长的测量

  #let calculate-lambda = (data, lambda-i) => {
    let phi-i = mean(data.map(t => calc-phi(..t)))
    let lambda-res = calc.sin(phi-i) / calc.sin(phi-green) * 546.1
    let E = calc.abs(lambda-res - lambda-i) / lambda-i * 100
    return (lambda-res, E, phi-i)
  }

  #let display-calc(data, c, lambda-i) = [
    #display-table(data, c)

    #let (lambda-res, E, phi-i) = calculate-lambda(data, lambda-i)

    $phi = #display-angle(phi-i)$,

    $lambda_#c = sin(#display-angle(phi-i)) / sin(#display-angle(phi-green)) times 546.1 unit.nm
    = #float-to-str(lambda-res, 1) unit.nm$,

    $E% = abs(#float-to-str(lambda-res, 1) - #lambda-i) slash #lambda-i times 100% = #float-to-str(E, 2) %$.
  ]

  #let (lambda-1, E-1, _) = calculate-lambda(data-3-1, 577.0)
  #let (lambda-2, E-2, _) = calculate-lambda(data-3-2, 579.1)
  #let (lambda-3, E-3, _) = calculate-lambda(data-3-3, 435.8)

  #display-calc(data-3-1, "黄内", 577.0)
  #display-calc(data-3-2, "黄外", 579.1)
  #display-calc(data-3-3, "紫光", 435.8)

== 结果与讨论

本次实验测得
光栅常数$d = (#float-to-str(d-res, 2) plus.minus #float-to-str(s-d, 2)) unit.nm$；
黄内谱线波长$lambda_"黄内" = #float-to-str(lambda-1, 1) unit.nm$，
相对误差$E% = #float-to-str(E-1, 2) %$；
黄外谱线波长$lambda_"黄外" = #float-to-str(lambda-2, 1) unit.nm$，
相对误差$E% = #float-to-str(E-2, 2) %$；
紫光谱线波长$lambda_"紫光" = #float-to-str(lambda-3, 1) unit.nm$，
相对误差$E% = #float-to-str(E-3, 2) %$。
谱线波长与真实值相比相对误差很小，
说明本次实验测量是准确的，平行光几乎垂直射到了光栅上。
由于光谱是有宽度的, 目镜中的黑线与光谱中心不一定完全重合, 故会带来误差。

== 分析讨论题

- *试结合测量的百分误差分析其产生的原因？*

  可能的原因：分光计没有严格的调整好；平行光不是真正的平行光，两轴线没严格正交；视差没有完全消除；测量时十字准线没有对准光谱线的中间；移动望远镜时手不是拿着架子转动，而是拿着目镜转动；读数误差。

- *如果光栅平面和分光计转轴平行，但光栅上刻线和转轴不平行，那么整个光谱会有何变化？
  对测量结果有无影响？*

  会出现光谱线不水平，但对衍射角测量无明显影响，结果可认为基本不变。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
