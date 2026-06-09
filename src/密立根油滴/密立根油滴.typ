#import "/template.typ": *

// === 请填入你的信息 ===
#show: report.with(
  experiment-name: "元电荷测定——密立根油滴实验",
  author: "小花梨",
  student-number: "29010001",
  major-class: "物理1",
  experiment-class: "AB12",
  group-number: "1A",
  teacher: "大花梨",
)

#let data-image = "数据-密立根油滴.jpg"

// === 请填入你的数据 ===
// data-x：油滴的数据
// U：平衡法电压
// U1：动态法电压
// t-g：平衡法测量的下落时间
// t-l：动态法测量的上升时间
#let data-1 = (
  U: 205,
  U1: 417,
  t-g: (17.60, 17.40, 17.10, 17.51, 17.29, 16.69),
  t-l: (16.20, 16.91, 15.49, 15.57, 16.40, 15.98),
)

#let data-2 = (
  U: 212,
  U1: 425,
  t-g: (25.55, 25.85, 25.97, 25.60, 25.50, 26.41),
  t-l: (23.61, 25.27, 24.19, 24.00, 24.91, 24.60),
)

#let data-3 = (
  U: 210,
  U1: 421,
  t-g: (25.29, 26.75, 26.98, 26.44, 25.27, 25.10),
  t-l: (24.85, 25.61, 24.87, 25.26, 24.66, 25.58),
)
// === END ===

#show: preview-section

== 预习要点

#grid(
  columns: (1fr, 1fr),
  [
    *实验目的：*
    + 学习密立根油滴实验的设计思想
    + 熟悉测量元电荷的方法
    + 验证电荷不连续性特征
    + 掌握转换测量的实验方法
  ],
figure(caption: "电场中油滴受力情况", image("fig1.png", width: 60%))
)

- 静态平衡测量法

  平衡时
  $m g = q E + F_"f"$，即$4/3 pi r^3 rho_0 g = q E + 4/3 pi r^3 rho' g$，\
  电荷测量公式
  $q = (18 pi eta^(3 slash 2)) / sqrt(2 g rho) dot d / U dot (l / t_"g")^(3 slash 2)$。

- 动态非平衡测量法

  平衡时
  $q E + F_"f" = m g + 6 pi eta r v_1$，\
  电荷测量公式
  $q = (18 pi d l) / sqrt(2 g rho) ( 1 / t_"l" + 1 / t_"g" ) ( l / t_"g" )^(1 slash 2) eta^(3 slash 2) 1/U_1$。

- 黏度修正

  修正油滴半径$r_0 = sqrt((9 eta v_"g") / (2 g rho))$，\
  平衡法测量的电荷量
  $q = (18 pi eta^(3 slash 2)) / sqrt(2 g rho) dot d / U dot (l / t_"g")^(3 / 2) slash.big ( 1 + b/(p r_0) )^(3 / 2)$，\
  动态法测量的电荷量
  $q = (18 pi d l) / sqrt(2 g rho) ( 1 / t_"l" + 1 / t_"g" ) ( l / t_"g" )^(1 / 2) eta^(3 / 2) 1/U_1 slash.big ( 1 + b/(p r_0) )^(3 / 2)$。

== 注意事项

+ 调整仪器时，如果打开有机玻璃油雾室，必须关掉电源
+ 喷油时，不要喷得太多，否则会堵塞小孔
+ 对选定油滴进行跟踪测量过程中，应随时调节显微镜镜筒的位置，对油滴聚焦，以保证油滴处于清晰状态

#show: report-section

== 实验目的

+ 学习密立根油滴实验的设计思想
+ 熟悉测量元电荷的方法
+ 验证电荷不连续性特征
+ 掌握转换测量的实验方法

== 实验原理

利用带电的微小油滴在均匀电场中运动的受力分析，
可将对油滴所带的微观电荷量q的测量转化为对油滴宏观运动速度的测量。

+ 静态平衡测量法

  #figure(caption: "电场中油滴受力情况", image("fig1.png", width: 35%)) <force>

  如#[@force]所示，一带电油滴在水平的平行板均匀电场中平衡时有$m g = q E + F_"f"$，即$q = (m g - F_"f") / E$。
  因表面张力作用，油滴呈小球状，
  重力为$m g = 4/3 pi r^3 rho_0 g$，
  浮力为$F_"f" = 4/3 pi r^3 rho' g$，
  其中$r$为油滴半径，$rho_0$为油滴密度，$rho'$为空气密度。

  当平行板未加电压，油滴在重力作用下降落时，
  除受空气浮力作用外，还受到空气对油滴的黏性力作用，
  $F_"r" = 6 pi eta r v$，
  其中$eta$为空气的黏度，$v$为油滴运动速度。
  当空气的黏性力、浮力和油滴的重力平衡时，油滴做匀速运动，
  有$F_"r" = 6 pi eta r v_"g" = 4/3 pi rho r^3 g$，
  其中$rho = rho_0 - rho'$
  从而可求得油滴半径$r = sqrt((9 eta v_"g") / (2 rho g))$。

  当平行板电压为零时，油滴做匀速运动的速度$v_"g" = l slash t_"g"$。
  由此，只需测量油滴运动的位移$l$ 和所需时间$t_"g"$，
  可得
  $q = (18 pi eta^(3 slash 2)) / sqrt(2 g rho) dot d / U dot (l / t_"g")^(3 slash 2)$。

+ 动态非平衡测量法

  在平行板上加电压$U_1$，带电油滴将向上做加速运动，
  直到油滴所受各力达平衡后，将以速度$v_1 = l slash t_"l"$匀速上升，此时油滴受力为
  $q E + F_"f" = m g + 6 pi eta r v_1$，
  可得
  $q = (18 pi d l) / sqrt(2 g rho) ( 1 / t_"l" + 1 / t_"g" ) ( l / t_"g" )^(1 slash 2) eta^(3 slash 2) 1/U_1$。

3. 对黏度的修正

  由于油滴甚小，其直径可和空气分子的平均自由程相比拟，
  所以不能再将空气看成是连续介质，油滴所受黏性力必将减小，
  黏度应修正为$eta' = eta slash.big ( 1 + b/(p r) )$，
  式中，修正系数 $b = 8.22 times 10^(-3) "m"·"Pa"$，$p$为大气压强。

  修正油滴半径$r_0 = sqrt((9 eta v_"g") / (2 g rho))$，
  平衡法测量的电荷量
  $
    q = (18 pi eta^(3 slash 2)) / sqrt(2 g rho) dot d / U dot (l / t_"g")^(3 / 2) slash.big ( 1 + b/(p r_0) )^(3 / 2) ，
  $
  #h(-2em)动态法测量的电荷量
  $
    q = (18 pi d l) / sqrt(2 g rho) ( 1 / t_"l" + 1 / t_"g" ) ( l / t_"g" )^(1 / 2) eta^(3 / 2) 1/U_1 slash.big ( 1 + b/(p r_0) )^(3 / 2) 。
  $

== 仪器

密立根油滴仪、油壶、油、电子显示屏

== 实验内容与步骤

+ 调整仪器，使仪器放平稳，调水平。

+ 练习测量：练习控制油滴，练习测量油滴运动的时间，练习选择油滴。

+ 正式测量：测量油滴匀速下降一段距离$l$所需时间$t_g$时，应先让油滴下降一段距离后再测量时间。对同一颗油滴应进行6次测量，而且每次测量都要调平衡电压。若油滴逐渐变得模糊，要微调测量显微镜跟踪油滴，防止油滴丢失。用同样方法分别对3颗油滴进行测量。再用动态法对每一颗油滴进行上升实验，记录上升一段与下降距离相同的距离的时间以及上升电压。

== 数据记录与处理

#let calculate-q = data => {
  let l = 1.6e-3
  let rho = 981 - 1.293
  let g = 9.794
  let p = 101325
  let d = 5e-3
  let eta = 1.83e-5
  let pi = calc.pi
  let b = 8.22e-3

  let t-g-mean = mean(data.t-g)
  let t-l-mean = mean(data.t-l)
  let U = data.U
  let U1 = data.U1

  let v-g = l / t-g-mean
  let v-1 = l / t-l-mean

  let r-0 = calc.sqrt((9 * eta * v-g) / (2 * g * rho))

  let q-1 = (
    (18 * pi * calc.pow(eta, 3 / 2))
      / calc.sqrt(2 * g * rho)
      * d
      / U
      * calc.pow(v-g, 3 / 2)
      / calc.pow(1 + b / (p * r-0), 3 / 2)
  )

  let q-2 = (
    (18 * pi * d * l)
      / calc.sqrt(2 * g * rho)
      * (1 / t-l-mean + 1 / t-g-mean)
      * calc.sqrt(v-g)
      * calc.pow(eta, 3 / 2)
      / U1
      / calc.pow(1 + b / (p * r-0), 3 / 2)
  )

  (r-0, q-1, q-2)
}

#let display = data => {
  let Vl = 1.6e-3
  let Vrho = 981 - 1.293
  let Vg = 9.794
  let Vp = 101325
  let Vd = 5e-3
  let Veta = 1.83e-5
  let Vpi = calc.pi
  let Vb = 8.22e-3

  let t-g-mean = mean(data.t-g)
  let t-l-mean = mean(data.t-l)
  let U = data.U
  let U1 = data.U1

  let v-g = Vl / t-g-mean
  let v-1 = Vl / t-l-mean

  $U_"平衡" = #data.U unit.V, quad U_"上升" = #data.U1 unit.V。$

  table(
    columns: (auto,) + (1fr,) * 7,
    "物理量", ..range(1, 7).map(str), "平均值",
    [平衡法$t_"g" slash unit.s$], ..data.t-g.map(x => float-to-str(x, 2)), float-to-str(t-g-mean, 2),
    [动态法$t_"l" slash unit.s$], ..data.t-l.map(x => float-to-str(x, 2)), float-to-str(t-l-mean, 2),
  )

  let (r-0, q-1, q-2) = calculate-q(data)

  [
    $v_"g" = l slash t_"g" = #sci-notation(Vl, 1) div #float-to-str(t-g-mean, 2) = #sci-notation(v-g, 2) unit.mps$

    $r_0 = sqrt((9 eta v_"g") / (2 g rho)) = sqrt((9 times #sci-notation(Veta, 2) times #sci-notation(v-g, 2)) / (2 times Vg times #sci-notation(Vrho, 2))) = #sci-notation(r-0, 2) unit.m$

    - 平衡法

      $q &= (18 pi eta^(3 slash 2)) / sqrt(2 g rho) dot d / U dot (l / t_"g")^(3 slash 2) slash.big ( 1 + b/(p r_0) )^(3 / 2) \
      &= (18 pi times (#sci-notation(Veta, 2))^(3 slash 2)) / sqrt(2 times Vg times #sci-notation(Vrho, 2)) dot Vd / #U dot (Vl / #float-to-str(t-g-mean, 2))^(3 slash 2) slash.big ( 1 + Vb / (Vp times #sci-notation(r-0, 2)) )^(3 / 2) \
      &= #sci-notation(q-1, 3) unit.C ，$

      #let e1 = q-1 / calc.round(q-1 / 1.602e-19)

      $n = [q slash e] approx #float-to-str(q-1 / 1.602e-19, 1) approx #float-to-str(q-1 / 1.602e-19, 0)$，
      $e = q slash n = #sci-notation(e1, 3) unit.C$，
      $E% = #float-to-str(calc.abs(e1 - 1.602e-19) / 1.602e-19 * 100, 2) %$。

    - 动态法

      $q &= (18 pi d l) / sqrt(2 g rho) ( 1 / t_"l" + 1 / t_"g" ) ( l / t_"g" )^(1 slash 2) eta^(3 slash 2) 1/U_1 slash.big ( 1 + b/(p r_0) )^(3 / 2) \
      &= #scale(x: 93%, reflow: true, $(18 pi times Vd times Vl) / sqrt(2 times Vg times #sci-notation(Vrho, 1))$)
      ( 1 / #float-to-str(t-l-mean, 2) + 1 / #float-to-str(t-g-mean, 2) )
      sqrt(Vl / #float-to-str(t-g-mean, 2))
      div #U1 times
      ( #scale(x: 94%, reflow: true, $Veta / (1 + Vb / (Vp times #sci-notation(r-0, 2)))$) )^(3 / 2) \
      &= #sci-notation(q-2, 3) unit.C ，$

      #let e2 = q-2 / calc.round(q-2 / 1.602e-19)

      $n = [q slash e] approx #float-to-str(q-2 / 1.602e-19, 1) approx #float-to-str(q-2 / 1.602e-19, 0)$，
      $e = q slash n = #sci-notation(e2, 3) unit.C$，
      $E% = #float-to-str(calc.abs(e2 - 1.602e-19) / 1.602e-19 * 100, 2) %$。
  ]
}

下落距离$l = 0.16 unit.cm$。

+ 油滴1

  #display(data-1)

+ 油滴2

  #display(data-2)

+ 油滴3

  #display(data-3)

== 结果与讨论

通过本次实验，理解了密立根油滴实验的设计思想，学习了元电荷的测量方法。本次实验中，由于不够熟练，我花了大半时间寻找合适的油滴，最终找到了合适的油滴完成了实验。

实验得到的元电荷量有些许误差，可能导致误差的原因有：选取的油滴质量偏大；计时误差偏大；静态法测量时，油滴不能很好平衡在上方，增大了误差。

== 分析讨论题

- *若平行板不水平，对测量有何影响？*

  若平行板不水平，会导致电场力与重力不在同一直线上，会使油滴上升时间偏大。

- *如何选择合适的油滴进行测量？*

  平衡电压在190V至250V之间；下落时间在10s至25s左右。

- *实验上怎样做才能保证油滴做匀速运动？*

  撤去平衡电压，让油滴下落一段距离再开始计时。

- *怎样判断油滴所带电荷量的改变？*

  若油滴通过同一距离所用的时间有明显的改变，说明油滴所带电荷量改变了。

#{
  if type(data-image) != array {
    data-image = (data-image,)
  }
  appendix(title: "原始数据记录", data-image.map(image).join())
}
