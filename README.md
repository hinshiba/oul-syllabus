# u-syllabus

syllabus at like the Okayama University.

岡山大学のシラバスのようなスタイル．

勉強会の告知などに．

## Usage

`example/example.typ`を編集するところから始めましょう．

### Import

`u-syllabus.typ`をダウンロードするかローカルにインストールしてください．

#### Download File

作成するドキュメントと同じフォルダに`u-syllabus.typ`を配置し，先頭に追記します．

```typst
#import "u-syllabus.typ": *
```

#### Local Install

`{data-dir}/typst/packages/local/u-syllabus/0.1.0`の下にこのリポジトリのファイルを配置してください．
先頭に追記します．

```typst
#import "@local/u-syllabus:0.1.0": *
```

### Call Style

`import`の後に配置します．

```typst
#show: syllabus.with(
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
)
```

### Heading

汎用的な見出しは登録してあります．

```typst
#h_target

#h_format(50, "なし", "わずか", "半分以下", "半分以上", "かなりあり")
```

そうでない見出しも`=`によって作成できます．

## Changelog

### v0.1.0

初期リリース