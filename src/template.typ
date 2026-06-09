#import "@preview/cuti:0.4.0": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/itemize:0.2.0": default-enum-list
#import "@preview/cjk-unbreak:0.2.3": remove-cjk-break-space
#import "@preview/lilaq:0.6.0" as lq

#let global-info = state("info", (:))
#let section = state("section", "report")

#let default-font = ("Dream Han Serif",)

#let basic-style(body, font: default-font) = {
  set text(lang: "zh", region: "cn", font: font, size: 12pt)
  set par(leading: 1.2em, spacing: 1.2em, justify: true, linebreaks: "optimized")
  set page(
    margin: 1.7cm,
    footer: {
      set text(size: 10pt)
      context align(center, counter(page).display())
    },
  )
  set underline(offset: 0.1em, evade: false)
  set heading(numbering: numbly(none, "{2:一}、"))
  show heading: it => {
    show h.where(amount: 0.3em): none
    it
    v(1.2em, weak: true)
  }
  set enum(numbering: numbly("{1}.", "({2})"), full: true)
  show math.equation: set text(font: (
    "New Computer Modern Math",
    ..font,
  ))
  show table: it => figure(it)

  show heading: it => {
    if it.level == 1 {
      set text(size: 14pt)
      it
      v(8pt)
    } else { it }
  }
  show: remove-cjk-break-space

  show: default-enum-list
  show math.equation.where(block: false): math.display
  show math.equation.where(block: false): it => h(0.25em, weak: true) + it + h(0.25em, weak: true)
  show math.equation: set text(top-edge: "bounds", bottom-edge: "bounds")

  set par(first-line-indent: (amount: 2em, all: true))
  set enum(indent: 2em)
  set table(
    inset: 8pt,
    align: center + horizon,
  )

  body
}

#let report(
  body,
  font: default-font,
  experiment-name: none,
  author: "",
  student-number: none,
  major-class: none,
  experiment-class: none,
  group-number: none,
  teacher: none,
) = {
  global-info.update((
    experiment-name: experiment-name,
    author: author,
    student-number: student-number,
    major-class: major-class,
    experiment-class: experiment-class,
    group-number: group-number,
    teacher: teacher,
  ))

  show: basic-style.with(font: font)

  set document(title: experiment-name, author: author)

  set page(
    foreground: if sys.inputs.at("sample", default: "") == "T" {
      text(30pt, rgb("#239dad"))[*实验报告样例\ 仅供学习参考，请勿照抄！*]
    },
  )

  body
}

#let header() = context {
  pagebreak(weak: true)
  counter(heading).update(0)

  set par(first-line-indent: 0pt)

  let experiment-name = global-info.get().at("experiment-name")
  let author = global-info.get().at("author")
  let student-number = global-info.get().at("student-number")
  let major-class = global-info.get().at("major-class")
  let experiment-class = global-info.get().at("experiment-class")
  let group-number = global-info.get().at("group-number")
  let teacher = global-info.get().at("teacher")

  let show-diving-line = false

  if experiment-name != none {
    show: show-cn-fakebold
    set text(font: "KaiTi", size: 20pt, weight: "bold")
    align(center, {
      [实验名称]
      h(1em)
      text(experiment-name, tracking: 0.02em)
    })
    show-diving-line = true
  }

  let info = (
    "姓名": author,
    "学号": student-number,
    "专业班": major-class,
    "实验班": experiment-class,
    "组号": group-number,
    "教师": teacher,
  )
    .pairs()
    .filter(((_, v)) => v != none)
    .to-dict()

  if info.len() > 0 {
    set text(size: 11pt)

    for (key, value) in info {
      key
      box(width: 1fr, stroke: (bottom: 0.5pt), outset: (bottom: 3pt))
      box(underline(offset: 3pt, value))
      box(width: 1fr, stroke: (bottom: 0.5pt), outset: (bottom: 3pt))
    }

    show-diving-line = true
  }

  if show-diving-line {
    line(length: 100%, stroke: 1pt)
  }
}

#let appendix-counter = counter("appendix")

#let appendix(body, title: none) = {
  pagebreak(weak: true)
  appendix-counter.step()
  context heading(appendix-counter.display("附录1") + [ ] + h(0.75em) + title, numbering: none)
  body
}

#let preview-section(body) = {
  {
    show heading: none
    heading("预习报告", numbering: none)
  }

  section.update("preview")
  header()

  set par(first-line-indent: 0em)
  set enum(indent: 1em)

  body
}

#let report-section(body) = {
  {
    show heading: none
    heading("实验报告", numbering: none)
  }

  section.update("report")
  header()

  set par(first-line-indent: (amount: 2em, all: true))
  set enum(indent: 2em)

  body
}

// utils

#let unit = (
  "m": math.upright("m"),
  "dm": math.upright("dm"),
  "cm": math.upright("cm"),
  "mm": math.upright("mm"),
  "nm": math.upright("nm"),
  "kg": math.upright("kg"),
  "g": math.upright("g"),
  "μs": math.upright("μs"),
  "us": math.upright("μs"),
  "ms": math.upright("ms"),
  "s": math.upright("s"),
  "mps": math.upright("m") + $slash$ + math.upright("s"),
  "Hz": math.upright("Hz"),
  "kHz": math.upright("kHz"),
  "MHz": math.upright("MHz"),
  "mV": math.upright("mV"),
  "V": math.upright("V"),
  "mA": math.upright("mA"),
  "A": math.upright("A"),
  "mT": math.upright("mT"),
  "T": math.upright("T"),
  "C": math.upright("C"),
  "Omega": $upright(Omega)$,
)

#let pi = $upright(pi)$

#let mean = (..arr) => {
  let arr = arr.pos()
  arr.map(array.sum).sum() / arr.map(array.len).sum()
}

#let standard-deviation = arr => {
  calc.sqrt(arr.map(n => calc.pow(n - mean(arr), 2)).sum() / arr.len())
}

#let sample-standard-deviation = arr => {
  calc.sqrt(arr.map(n => calc.pow(n - mean(arr), 2)).sum() / (arr.len() - 1))
}

#let float-to-str(num, digits) = {
  if digits == auto { return str(num) }
  num = calc.round(num, digits: digits)
  let num-str = str(num)

  let integer-part = num-str
  let decimal-part = ""
  if num-str.find(".") != none {
    (integer-part, decimal-part) = num-str.split(".")
  }

  if decimal-part.len() < digits {
    decimal-part = decimal-part + "0" * (digits - decimal-part.len())
  }

  if digits > 0 {
    return integer-part + "." + decimal-part
  } else {
    return integer-part
  }
}

#let pow10 = n => $times 10^(#n)$

#let sci-notation(num, digits, exponent: auto) = {
  if exponent == auto {
    exponent = calc.floor(calc.log(num))
  }
  let mantissa = num / calc.pow(10, exponent)
  return $#float-to-str(mantissa, digits) pow10(exponent)$
}

#let hypot(..x) = calc.sqrt(x.pos().map(x => x * x).sum())

#let format-signed = (a, digits: 3) => {
  let str-a = float-to-str(a, digits)
  if str-a.match(regex("^0(\.0+)?$")) != none {
    $$
  } else if str-a.starts-with("−") {
    $- #str-a.trim("−")$
  } else {
    $+ #str-a$
  }
}

#let linear-fit(x, y) = {
  let n = x.len()
  let sum-x = x.sum()
  let sum-y = y.sum()
  let sum-xx = x.map(x => x * x).sum()
  let sum-xy = x.zip(y).map(((x, y)) => x * y).sum()

  let slope = (n * sum-xy - sum-x * sum-y) / (n * sum-xx - sum-x * sum-x)
  let intercept = (sum-y - slope * sum-x) / n

  (slope, intercept)
}
