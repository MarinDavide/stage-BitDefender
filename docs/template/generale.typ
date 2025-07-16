
#let docStyle(doc) = {
  set heading(numbering: "1.")
  set text(
    font: "Cambria",
    size: 12pt
  )
  set page(numbering: "1")
  show heading: set text(navy)
  show link: underline

  [#doc]
}

#let versionTable(
  content: ("",),
) = {
  table(
    columns: (1fr, 1fr, 1fr, 2fr),
    align: center,
    inset: 5pt,
    stroke: 1pt,
    table.header([*Versione*], [*Data*], [*Redattore*], [*Descrizione*]),
    ..content
  )
}

#let documentTitle(
  content: "",
) = {

  text(
    fill: blue,
    size: 45pt,
    weight: "regular",
    ..content
  )

}

#let bestPractices(body) = {
  show heading: set text(blue, style: "italic")
  set text(blue, style: "italic")
  [#body]
}
