// 設計書.typ で使う共通スタイル・部品をまとめたテンプレート。
// 設計書.typ 側では #import "template.typ": * して使うだけでよい。

#let doc(title: "", subtitle: "", meta: "", body) = {
  set page(
    paper: "a4",
    margin: (x: 20mm, top: 24mm, bottom: 22mm),
    header: context {
      if counter(page).get().first() > 1 [
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          text(size: 8.5pt, fill: rgb("#64748b"))[#title],
          text(size: 8.5pt, fill: rgb("#64748b"))[TUS Computer Basic Class]
        )
        #v(-4pt)
        #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      ]
    },
    footer: context {
      align(center)[
        #text(size: 9pt, fill: rgb("#64748b"))[#counter(page).get().first() / #counter(page).final().first()]
      ]
    }
  )

  set text(
    font: ("Hiragino Sans", "Hiragino Kaku Gothic ProN"),
    size: 9.5pt,
    lang: "ja"
  )

  set par(justify: true, leading: 0.75em)
  set heading(numbering: "1.1")

  align(center)[
    #v(10pt)
    #text(size: 20pt, weight: "bold", fill: rgb("#0f172a"))[#title] \
    #v(4pt)
    #text(size: 11pt, fill: rgb("#475569"))[#subtitle] \
    #v(6pt)
    #text(size: 9pt, fill: rgb("#64748b"))[#meta]
    #v(10pt)
    #line(length: 100%, stroke: 1.2pt + rgb("#2563eb"))
  ]

  v(8pt)
  outline(indent: 1.5em)
  v(12pt)

  body
}

// 強調したい注意事項・仕様要件を枠で囲む。
#let callout(title: "", body, color: rgb("#2563eb")) = block(
  width: 100%,
  stroke: (left: 3pt + color),
  fill: rgb("#f8fafc"),
  inset: (x: 11pt, y: 9pt),
  radius: (right: 4pt),
  [
    #if title != "" [
      #text(weight: "bold", fill: color, size: 9.5pt)[#title]
      #v(3pt)
    ]
    #text(size: 9pt)[#body]
  ]
)

// 検討メモ（疑問点）と設計結論をQ&A形式で示す。
#let qna-box(q, a) = block(
  width: 100%,
  stroke: 0.8pt + rgb("#e2e8f0"),
  fill: rgb("#f8fafc"),
  radius: 6pt,
  inset: 10pt,
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 8pt,
      text(weight: "bold", fill: rgb("#ea580c"))[Q (検討メモ):],
      text(weight: "bold", fill: rgb("#1e293b"))[#q]
    )
    #v(4pt)
    #line(length: 100%, stroke: 0.4pt + rgb("#e2e8f0"))
    #v(4pt)
    #grid(
      columns: (auto, 1fr),
      gutter: 8pt,
      text(weight: "bold", fill: rgb("#0284c7"))[A (設計結論):],
      text(fill: rgb("#334155"))[#a]
    )
  ]
)
