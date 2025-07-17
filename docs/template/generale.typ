
#let docStyle(doc) = {
  set heading(numbering: "1.")
  set text(
    font: "Cambria",
    size: 12pt
  )
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
  pagebreak()
}

#let documentTitle(title) = {
  set align(center)
  set text(
    fill: blue,
    size: 45pt,
    weight: "regular",
  )
  [#title]
}

#let indiceDoc() = {
show outline: it => if query(it.target) != () { it }
if outline() != () [
  #outline(
    title: [Indice],
    depth: 3
  )
  #pagebreak(weak: true)
]
if outline() != () [
  #outline(
  target: figure,
  title: [Lista delle immagini],
  )
  #pagebreak(weak: true)
]

}

#let bestPractices(body) = {
  show heading: set text(blue, style: "italic")
  set text(blue, style: "italic")
  [#body]
}

