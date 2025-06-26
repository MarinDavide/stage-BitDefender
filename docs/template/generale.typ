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
