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
  color: blue,
  body,
) => {
  // metadata
  [
    #metadata(course)<course>
    #metadata(instructors)<instructors>
  ]

  // doc
  set document(title: course, author: instructors)
  set page(height: auto, margin: 2em)
  set text(hyphenate: true, lang: "ja", size: size, font: font)
  set par(spacing: 1em, first-line-indent: (amount: 1.5em, all: true), hanging-indent: 1.5em)
  set enum(indent: 2em)
  set list(indent: 2em)

  show heading: it => {
    set text(size: size, fill: white, weight: "regular")

    set align(center)
    block(inset: 0.5em, width: 100%, fill: color)[
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

/* よくありそうな項目 */

// R3入学生 など
#let h_target = {
  [
    #heading("対象学生")
  ]
}

// 対象学生の項目を参照 など
#let h_other_facluty = {
  [
    #heading("他学部学生の履修の可否")
  ]
}

#let h_contact = {
  [
    #heading("連絡先")
  ]
}

// 事前にアポイントメントを取ってください など
#let h_office_hour = {
  [
    #heading("オフィスアワー")
  ]
}

//
#let h_summary = {
  [
    #heading("授業の概要")
  ]
}

//
#let h_goal = {
  [
    #heading("到達目標")
  ]
}

//
#let h_plan = {
  [
    #heading("授業計画")
  ]
}

#let h_self_study = {
  [
    #heading("授業時間外の学習(予習･復習)方法(成績評価への反映についても含む)")
  ]
}

#let h_format = (lecture_rate, peer, ask, think, check, announce) => {
  [
    #heading("授業形態・学習方法")

    #v(0.2em)
    (1) 授業形態-全授業時間に対する[講義形式]:[講義形式以外]の実施割合 \
    #v(0.4em)
    #lecture_rate % : #{ 100 - lecture_rate } %

    #v(1em)
    (2) 授業形態-授業全体の中のアクティブ･ラーニングの内容 \

    #set list(indent: 4em)
    - 協働的活動(ペア･グループワーク､ディスカッション､プレゼンテーションなど)

      #peer

    #v(1em)

    - 対話的活動(教員からの問いかけ､質疑応答など)

      #ask

    #v(1em)
    - 思考活動(クリティカル･シンキングの実行､問いを立てるなど)

      #think

    #v(1em)
    - 理解の確認･促進(問題演習､小テスト､小レポート､授業の振り返りなど)

      #check

    #v(1em)

    (4)授業形態-履修者への連絡事項
    #v(0.2em)
    #h(1em)  #announce
    #v(1em)
  ]
}

#let h_support = (media, lms, ta, announce) => {
  [
    #heading("使用メディア･機器･人的支援の活用")
    (1-1)視聴覚メディア(PowerPointのスライド､CD､DVDなど)

    #h(1em) #media

    #v(1em)
    (1-2)学習管理システム(Moodleなど)

    #h(1em) #lms

    #v(1em)
    (1-3)人的支援(ゲストスピーカー､TA､ボランティアなど)

    #h(1em) #ta

    #v(1em)
    (2)履修者への連絡事項

    #h(1em) #announce

    #v(1em)
  ]
}

#let h_reference = {
  [
    #heading("参考書")
  ]
}

//
#let h_score_eval = {
  [
    #heading("成績評価")
  ]
}

#let h_require = {
  [
    #heading("受講要件")
  ]
}

#let h_remarks = {
  [
    #heading("備考/履修上の注意")
  ]
}
