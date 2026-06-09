#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "光的偏振",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = ("数据-光的偏振-1.jpg", "数据-光的偏振-2.jpg")

// === 请填入你的数据 ===
// data-1: 验证马吕斯定律
// start: 起始角度
// step: 角度步长
// p: 记录的光功率值，单位为mW
#let data-1 = (
  start: 0,
  step: 15,
  p: (
    0.510,
    0.717,
    0.879,
    0.895,
    0.804,
    0.593,
    0.335,
    0.142,
    0.023,
    0.008,
    0.118,
    0.298,
    0.522,
    0.727,
    0.857,
    0.854,
    0.765,
    0.581,
    0.337,
    0.148,
    0.022,
    0.008,
    0.107,
    0.291,
    0.510,
  ),
)

// data-2: 线偏振光通过1/2波片
// theta: 半波片光轴方位角
// start: 起始角度
// step: 角度步长
// p: 记录的光功率值，单位为mW
#let data-2 = (
  theta: 300,
  start: 130,
  step: 15,
  p: (
    0.474,
    0.311,
    0.148,
    0.035,
    0.004,
    0.058,
    0.182,
    0.354,
    0.497,
    0.618,
    0.633,
    0.582,
    0.412,
    0.291,
    0.141,
    0.038,
    0.004,
    0.057,
    0.184,
    0.361,
    0.525,
    0.627,
    0.635,
    0.577,
    0.474,
  ),
)

// data-3: 线偏振光通过1/2波片
// theta-3: 半波片光轴方位角
// theta-2: 消光时检偏器刻度盘初始读数
// theta: 检偏器转过角度，对应半波片转过角度（15, 30, 45, 60, 75, 90）
#let data-3 = (
  theta-3: 300,
  theta-2: 130,
  theta: (30, 60, 90, 120, 150, 180),
)

// data-4-1: 1/4波片对线偏振光的作用
// 4次消光时1/4波片光轴的相对位置
#let data-4-1 = (40, 130, 220, 210)

// data-4-2
// max: 两个极大点的位置和对应的光功率值
// min: 两个极小点的位置和对应的光功率值
#let data-4-2 = (
  max: ((240, 0.460), (60, 0.472)),
  min: ((330, 0.191), (150, 0.199)),
)
// === END ===

#show: preview-section

== 预习要点

*实验目的：*
+ 观察光的偏振现象，加深对光偏振基本规律的认识
+ 熟悉常用的起偏振和检偏振的方法
+ 验证马吕斯定律
+ 了解椭圆、圆偏振光的产生与检测方法，以及1/2、1/4波片的作用原理

光的偏振态分类：完全非偏振光、完全偏振光（线偏振光、圆偏振光、椭圆偏振光）、部分偏振光

马吕斯定律：$I = I_0 cos^2 theta$。

#import "@preview/cetz:0.4.2"
#figure(
  {
    set text(size: 9pt)
    cetz.canvas({
      import cetz.draw: *
      rect((-3.5, -1), (-2.5, 1))
      rect((-2.5, -0.5), (-2, 0.5))
      rect((-1, -1), (-0.5, 1))
      rect((0.5, -1), (1, 1))
      rect((2, -0.5), (2.5, 0.5))
      rect((2.5, -1), (3.5, 1))
      content((-2.75, -1.3), "激光器")
      content((-0.75, -1.3), "起偏器")
      content((0.75, -1.3), "检偏器")
      content((2.75, -1.3), "光功率计")
    })
  },
  caption: [验证马吕斯定律的光路示意图],
)

*1/2波片光轴的方向如何确定？*

先调节起偏器与检偏器至正交消光状态，再将1/2波片置于两者之间，缓慢旋转波片直至光路再次出现消光，此时波片的光轴方向与起偏器的透振方向平行或垂直。

== 注意事项

+ 先定性、后定量，定性观察变化规律，定量测量
+ 激光不能直射眼
+ 所有光学元件轻拿轻放
+ 不能用手摸光学元器件的表面，保证光学表面光洁
+ 光路搭建时反射光点法的利用，等高共轴的调节
+ 数据处理中的极坐标作图和线性拟合

#show: report-section

== 实验目的

+ 观察光的偏振现象，加深对光偏振基本规律的认识
+ 熟悉常用的起偏振和检偏振的方法
+ 验证马吕斯定律
+ 了解椭圆、圆偏振光的产生与检测方法，以及1/2、1/4波片的作用原理

== 实验原理

+ 光的偏振态

  在垂直于光波传播方向来平面内，光矢量可能有不同的震动方向。通常把光矢量保持一定振动方向上的状态称为偏振态。若光在传播中，光矢量固定在平面上振动，称为平面振动态，此平面为偏振面。此时光矢量在垂直与传播平面上的投影为一直线，为线偏振光。若光矢量绕传播方向旋转，为圆偏振态。若轨迹为椭圆，则为椭圆偏振态。

  若光矢量在垂直与传播方向平面上的投影表现为各向同性，这种光为自然光。线、圆、椭圆偏振光又可称为完全偏振光。自然光与完全偏振光的混合称为部分偏振光。

+ 起偏振与检偏振

  实现光的起偏振和检偏振的核心器件是偏振片，其工作原理基于二向色性。

  起偏振：将偏振片作为起偏器，当自然光垂直入射到起偏器时，只有平行于透振方向的光振动分量能够通过，输出线偏振光。
  此时线偏振光的振动方向与起偏器的透振方向一致，光强变为入射自然光强的1/2。

  检偏振：将另一块偏振片作为检偏器，让线偏振光垂直入射到检偏器上，转动检偏器改变其透振方向，观察出射光强的变化：
  当检偏器透振方向与入射线偏振光的振动方向平行时，出射光强最大；当两者垂直时，出射光强为零（消光现象）；
  当两者成某一角度时，出射光强介于两者之间。
  通过消光现象可判断入射光为线偏振光，这是检偏振的关键依据。
// 若入射光为自然光或圆偏振光，转动检偏器时出射光强保持不变；
// 若为部分偏振光，则光强会随检偏器转动而变化，但不会出现消光现象。

+ 马吕斯定律

  设入射到检偏器上的线偏振光的光强为$I_0$，检偏器的透振方向与入射线偏振光的振动方向夹角为$theta$，则通过检偏器后的出射光强$I$满足：$I = I_0 cos^2 theta$。

+ 光的不同偏振态的转换与检测

  波片是由双折射晶体制成的薄片，其光轴方向固定，作用是使入射的线偏振光分解为振动方向相互垂直的o光（寻常光）和e光（非常光），并使两束光之间产生固定的光程差，从而改变光的偏振态。

  1/2波片：o光和e光通过波片后产生的光程差为$lambda slash 2$，对应的相位差为$pi$。
  当线偏振光垂直入射到1/2波片时，出射光仍为线偏振光，但振动方向会发生旋转：若入射光振动方向与波片光轴夹角为$theta$，则出射光振动方向与光轴的夹角变为$2 theta$，即振动方向旋转了$2 theta$角度。1/2波片的核心作用是改变线偏振光的振动方向，不改变光的偏振态。

  1/4波片：o光和e光通过波片后产生的光程差为$lambda slash 4$，对应的相位差为$pi slash 2$。
  当线偏振光垂直入射到1/4波片，且入射光振动方向与波片光轴夹角为$theta$时：
  - 若$theta = 45 degree$，入射光振动分解为o光和e光的振幅相等，叠加后形成圆偏振光；
  - 若$theta eq.not 0 degree、45 degree、90 degree$，o光和e光振幅不相等，叠加后形成椭圆偏振光；
  - 若$theta = 0 degree$或$90 degree$，入射光振动方向与光轴平行或垂直，出射光仍为线偏振光。

== 仪器

半导体激光器、光电探测器和功率计、光具座和导轨、1/4波片、1/2波片、偏振片

== 实验内容与步骤

+ 观察激光的偏振性，验证马吕斯定律

  在导轨上依次放置：激光器、起偏器、检偏器、光功率计，确保激光垂直入射各元件，探头正对出射光。
  打开激光器，转动起偏器，使通过起偏器的线偏振光光强最大，固定起偏器不再转动。
  转动检偏器，直至光功率计示数为零，记录此时检偏器的角度$theta$。
  从$theta$开始，每隔$15 degree$记录一次光功率计的示数$P$，共记录24个数据。

+ 线偏振光通过1/2波片

  在上述基础上，在起偏器和检偏器之间放置1/2波片。
  调整1/2波片使其光轴与入射线偏振光的振动方向夹角$Delta theta_3 = 30 degree$
  （即旋转1/2波片至消光后旋转1/2波片$30 degree$）。
  转动检偏器，每隔$15 degree$记录一次光功率计的示数$P$，共记录24个数据。

+ 观察并研究1/2波片对线偏振光的作用

  使两偏振片正交，半波片光轴与入射线偏振光的振动方向夹角$Delta theta_3 = 15 degree$。
  转动检偏器再使消光出现，记录检偏器所转动的角度$Delta theta_2$。
  然后依次将1/2波片旋转$Delta theta_3 = 30 degree, 45 degree, 60 degree, 75 degree, 90 degree$，
  重复上述步骤，每次记录消光时检偏器转过的角度$Delta theta_2$。

+ 观察并研究1/4波片对线偏振光的作用

  先将两偏振片调为正交，并在其中插入1/4波片。
  旋转波片，观察是否恢复消光，从而确定波片主轴方向。
  随后将1/4波片偏离主轴一定角度，再转动检偏器，
  测量透射光的极大值、极小值及对应位置，据此判断透射光的偏振态。

== 数据处理与分析

#let process = data => {
  data
    .p
    .enumerate()
    .map(
      ((i, p)) => (calc.rem(data.start + i * data.step, 360), p),
    )
}

#let fill-table(contents, col, default) = {
  let n = contents.len()
  let rows = calc.ceil(n / 3)
  range(rows)
    .map(
      i => range(3).map(j => {
        let idx = i + j * rows
        if idx < n { contents.at(idx) } else { default }
      }),
    )
    .join()
}

#{
  data-1.coord = process(data-1)
  data-2.coord = process(data-2)
}

+ 验证马吕斯定律

  #table(
    columns: (1fr,) * 6,
    $theta_2 slash degree$,
    $P slash upright("mW")$,
    $theta_2 slash degree$,
    $P slash upright("mW")$,
    $theta_2 slash degree$,
    $P slash upright("mW")$,
    ..fill-table(
      data-1.coord.map(((th, p)) => (str(th), float-to-str(p, 3))),
      3,
      ("", ""),
    ).join(),
  )

  #let fit = data => {
    let theta-list = data.map(((th, p)) => th)
    let p-list = data.map(((th, p)) => p)
    let n = theta-list.len()

    let sum-c = 0
    let sum-s = 0
    let sum-P = 0
    let sum-c2 = 0
    let sum-s2 = 0
    let sum-cs = 0
    let sum-Pc = 0
    let sum-Ps = 0

    for (th, p) in theta-list.zip(p-list) {
      let c = calc.cos(th * 2deg)
      let s = calc.sin(th * 2deg)
      sum-c += c
      sum-s += s
      sum-P += p
      sum-c2 += c * c
      sum-s2 += s * s
      sum-cs += c * s
      sum-Pc += p * c
      sum-Ps += p * s
    }

    let M11 = sum-c2
    let M12 = sum-cs
    let M13 = sum-c
    let M22 = sum-s2
    let M23 = sum-s
    let M33 = n
    let det = M11 * (M22 * M33 - M23 * M23) - M12 * (M12 * M33 - M13 * M23) + M13 * (M12 * M23 - M13 * M22)

    let A = (
      ((M11 * M22 - M12 * M12) * sum-P - M13 * (M22 * sum-Pc - M12 * sum-Ps) - M23 * (M11 * sum-Ps - M12 * sum-Pc))
        / det
    )
    let C1 = (
      ((M22 * M33 - M23 * M23) * sum-Pc - M12 * (M33 * sum-Ps - M23 * sum-P) + M13 * (M12 * M33 - M23 * M13)) / det
    )
    let C2 = (
      (M11 * (M33 * sum-Ps - M23 * sum-P) - (M33 * sum-Pc - M13 * sum-P) * M12 + M13 * (M12 * M23 - M13 * M22)) / det
    )

    let B = hypot(C1, C2)
    let phi = calc.atan2(C1, C2)

    x => A + B * calc.cos(2deg * x - phi)
  }

  #figure(
    caption: [验证马吕斯定律$P dash theta$图],
    {
      let fx = fit(data-1.coord)
      let t = lq.linspace(0, 360)
      lq.diagram(
        xlabel: $theta slash degree$,
        ylabel: $P slash upright("mW")$,
        xaxis: (lim: (0, 360), tick-distance: 30, subticks: none),
        yaxis: (subticks: none),
        width: 14.5cm,
        height: 8cm,
        lq.scatter(data-1.coord.map(((x, y)) => x), data-1.coord.map(((x, y)) => y), mark: "x"),
        lq.plot(t, t.map(fx), color: black, smooth: true, mark: none),
      )
    },
  )

  实验测得的光强$P$随偏振角$θ$变化的曲线，呈现为一条平移的余弦平方曲线，与马吕斯定律$I = I_0 cos^2 theta$的理论形式一致。

+ 线偏振光垂直通过1/2波片，入射偏振光偏振方向和波片光轴$Delta theta_3 = 30 degree$，旋转检偏器，研究光强变化规律

  半波片光轴方位角$theta_3 = #data-2.theta degree$

  #table(
    columns: (1fr,) * 6,
    $theta_2 slash degree$,
    $P slash upright("mW")$,
    $theta_2 slash degree$,
    $P slash upright("mW")$,
    $theta_2 slash degree$,
    $P slash upright("mW")$,
    ..fill-table(
      data-2.coord.map(((th, p)) => (str(th), float-to-str(p, 3))),
      3,
      ("", ""),
    ).join(),
  )

  #figure(
    caption: [线偏振光垂直通过1/2波片，光强变化规律],
    {
      import "@preview/cetz:0.4.2": canvas, draw
      set text(size: 10pt)
      canvas({
        import draw: *

        let mean-p = mean(data-1.p, data-2.p)
        let data-factor = 1.5 / mean-p

        let r-count = 4
        let r-step = calc.ceil(calc.max(..data-1.p, ..data-2.p) * data-factor * 1.05) / 4
        let r-max = r-count * r-step

        let axis-count = 12
        for i in range(axis-count) {
          line((0, 0), (360deg / axis-count * i, r-max), stroke: gray)
          line((0, 0), (360deg / axis-count * (i + 0.5), r-max), stroke: (dash: "dashed", paint: gray))
          content((360deg / axis-count * i, r-max + 0.4), str(360 / axis-count * i))
        }
        for i in range(r-count) {
          circle((0, 0), radius: (i + 1) * r-step, stroke: if i + 1 == r-count { black } else { gray })
        }
        for i in range(r-count) {
          content((360deg / axis-count * (axis-count / 4 + 0.55), (i + 1) * r-step + 0.2), text(
            size: 7pt,
            fill: luma(30%),
            float-to-str((i + 1) * r-step / data-factor, 3),
          ))
        }
        content((360deg / axis-count * (axis-count / 4 + 0.55), r-count * r-step + 0.6), text(
          size: 8pt,
          fill: luma(20%),
          $P slash upright("mV")$,
        ))

        line(..data-1.coord.map(((th, p)) => (th * 1deg, p * data-factor)))
        for (th, p) in data-1.coord {
          circle((th * 1deg, p * data-factor), radius: 0.065, fill: black, stroke: none)
        }
        line(
          ..data-2.coord.map(((th, p)) => (th * 1deg, p * data-factor)),
          stroke: red,
        )
        for (th, p) in data-2.coord {
          circle((th * 1deg, p * data-factor), radius: 0.065, fill: red, stroke: none)
        }
        // legends
        line((r-max - 1, r-max), (r-max, r-max))
        circle((r-max - 0.5, r-max), radius: 0.06, fill: black, stroke: none)
        content((r-max + 0.22, r-max), $0 degree$)
        line((r-max - 1, r-max - 0.5), (r-max, r-max - 0.5), stroke: red)
        circle((r-max - 0.5, r-max - 0.5), radius: 0.06, fill: red, stroke: none)
        content((r-max + 0.3, r-max - 0.5), $30 degree$)
      })
    },
  )

  从数据可见，透射光强仍随检偏器转动呈周期变化，有两次消光。这说明透过1/2波片后的光仍然是线偏振光，只是偏振方向发生了改变。

+ 观察并研究1/2波片对线偏振光的作用

  半波片光轴的相对位置为$theta_3 = #data-3.theta-3 degree$，消光时检偏器刻度盘初始读数$theta_2 = #data-3.theta-2 degree$。

  #table(
    columns: (auto,) + (1fr,) * 6,
    [半波片转过角度$Delta theta_3 slash degree$],
    ..range(6).map(i => str((i + 1) * 15)),
    [检偏器转过角度$Delta theta_2 slash degree$],
    ..data-3.theta.map(str),
  )

  现象：当线偏振光通过1/2波片时，波片每转过15°，检偏器大约就转过30°。
  原因是：当平面偏振光通过1/2波片后，产生的仍是平面偏振光，但它与原入射光的夹角为$2 theta$，其振动面转过了$2 theta$。

+ 观察并研究1/4波片对线偏振光的作用

  + 确定1/4波片光轴方向

    使两偏振片正交，在中间插入1/4波片并旋转一周，观察到有4次消光。
    1/4波片光轴的相对位置为$theta_4 = #data-4-1.map(it => $it degree$).join($, med$)$，
    相邻位置相差约90°，
    消光说明当线偏振光垂直照射1/4波片时，透射光的偏振特效仍为线偏振光。

  + 1/4波片偏离主轴30°时的光强变化规律

    将1/4波片偏离光轴$theta_4 = 30 degree$，破坏消光现象；
    旋转检偏器一周，观察到光强呈周期变化，有两次极大值和两次极小值，
    但没有消光现象，说明此时透过1/4波片的光为椭圆偏振光。

    #table(
      columns: (auto, 1fr, 1fr) * 2,
      "极大点", "1", "2", "极小点", "1", "2",
      [位置$theta slash degree$],
      ..data-4-2.max.map(((th, p)) => str(th)),
      [位置$theta slash degree$],
      ..data-4-2.min.map(((th, p)) => str(th)),
      [光强$P slash upright("mW")$],
      ..data-4-2.max.map(((th, p)) => float-to-str(p, 3)),
      [光强$P slash upright("mW")$],
      ..data-4-2.min.map(((th, p)) => float-to-str(p, 3)),
    )

  综合（1）和（2）实验现象，说明线偏振光垂直照射在1/4波片后，
  $theta_4$等于不同的值时，透射光可能为线偏振光、圆偏振光或椭圆偏振光。

== 结果与讨论

*实验结果总结：*
+ 旋转检偏器时，激光光强表现出周期性变化，出现消光现象，因此实验光源为近似线偏振光。
+ 线偏振光经过检偏器，透射光强随检偏器角度变化符合余弦平方规律，验证了马吕斯定律。
+ 线偏振光经过1/2波片后，透射光仍可被检偏器完全消光，说明透射光仍然是线偏振光；
  同时满足$Delta theta_2 = 2 Delta theta_3$，验证了1/2波片会使偏振方向旋转两倍夹角。
+ 线偏振光经过1/4波片后，当入射偏振方向沿其主轴时，透射光仍为线偏振光；
  当偏离主轴约30°时，透射光不能完全消光，透射光变为椭圆偏振光；
  $theta_4$等于不同的值时，透射光可能为线偏振光、圆偏振光或椭圆偏振光。

本实验较系统地研究了偏振片、1/2波片和1/4波片对光偏振状态的影响，实验现象与理论结果基本一致。
通过本实验，不仅验证了偏振光的基本规律，也进一步加深了对波片调控光偏振状态机制的理解。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
