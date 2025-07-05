// Copyright (c) 2025 hinshiba.
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

#let syllabus = (
  // header
  course: "基本的なTypst",
  course_en: "Basic Typst",
  year: "2025",
  faclty: "工学部 工学科 AA系 BBコース",
  // header2
  classification: "教養教育科目",
  term: "集中/その他", // 第 n 学期
  numbering: "00A00",
  room: "第1号館 第2講義室",
  attribute: "必修",
  is_online: false,
  credits: 1, ///単位数
  period: "月曜 1~2限",
  instructors: "瀕死 (@hinshiba)",
  // format
  size: 12pt,
  font: "Harano Aji Gothic",
  paper: "a4",
  color: "blue",
  body,
) => {
  // metadata
  [
    #metadata(course)<course>
    #metadata(instructors)<instructors>
  ]

  // doc
  set document(title: course, author: instructors)
  set page(paper: paper, margin: 2em)
  set text(hyphenate: true, lang: "ja", size: size, font: font)
  set par(spacing: 1em, first-line-indent: (amount: 4em, all: true))

  show heading: it => {
    set text(size: size, fill: white, weight: "regular")

    set align(center)
    block(inset: 0.5em, width: 100%, fill: blue)[
      #set align(left)
      #h(0.6em)
      #it.body
    ]
  }

  // header
  show selector.or(..range(2, 12).map(y => grid.cell.where(y: y))): it => {
    if calc.even(it.y) {
      // 太線側
      heading(it.body)
    } else {
      block(inset: 0.7em, width: 100%, fill: silver)[
        #set align(left)
        #h(0.3em)
        #it.body
      ]
    }
  }


  grid(
    columns: (5fr, 1fr, 1fr, 3fr, 2fr),
    rows: (auto, auto),
    gutter: 0.5pt,
    stroke: black,
    grid.cell(colspan: 5)[
      #block(inset: 0.7em, width: 100%, fill: rgb(0xf0, 0xf0, 0xff, 0xff))[
        #set align(left)
        #h(0.3em)
        #year 年度 #h(1em) #term #h(3em) #faclty
      ]
    ],
    grid.cell(colspan: 5)[
      #block(inset: 0.7em, width: 100%, fill: rgb(0xf0, 0xf0, 0xff, 0xff))[
        #set align(right)
        #rect(width: 90%, height: 3em, stroke: (left: black))[
          #set align(left)
          #set text(size: 1.2em)
          #h(2em)
          #course \
          #h(2em)
          #course_en]
      ]
    ],
    grid.cell(colspan: 4)[科目区分], grid.cell(colspan: 1)[学期],
    grid.cell(colspan: 4)[#classification], grid.cell(colspan: 1)[#term],

    grid.cell(colspan: 3)[ナンバリングコード], grid.cell(colspan: 2)[教室],
    grid.cell(colspan: 3)[#numbering], grid.cell(colspan: 2)[#room],

    grid.cell(colspan: 2)[必修･選択の別], grid.cell(colspan: 3)[メディア授業科目],
    grid.cell(colspan: 2)[#attribute], grid.cell(colspan: 3)[#is_online],

    grid.cell(colspan: 1)[単位数], grid.cell(colspan: 4)[曜日・時限],
    grid.cell(colspan: 1)[#credits], grid.cell(colspan: 4)[#period],
    grid.cell(colspan: 5)[
      担当教員 (ID)
    ],
    grid.cell(colspan: 5)[
      #instructors
    ],
  )

  body
}
