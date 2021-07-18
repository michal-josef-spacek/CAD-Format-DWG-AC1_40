meta:
  id: dwg_0140
  title: AutoCAD drawing (AC1.40)
  application: AutoCAD
  file-extension:
    - dwg
  license: CC0-1.0
  xref:
    justsolve: DWG
    loc: fdd/fdd000445
    pronom:
      fmt: 54
    mime:
      - application/x-dwg
      - image/vnd.dwg
    wikidata: Q1053358
  endian: le
doc: |
  AutoCAD 2D blueprint.
doc-ref: |
    https://github.com/LibreCAD/libdxfrw
    https://git.savannah.gnu.org/cgit/libredwg.git/tree/
    https://www.opendesign.com/files/guestdownloads/OpenDesign_Specification_for_.dwg_files.pdf
seq:
  - id: header
    type: header
types:
  header:
    seq:
      - id: magic
        size: 6
        type: strz
        encoding: ascii
      - id: zeros
        size: 5
      - id: unknown1
        size: 29
      ## 0x0028
      - id: number_of_entities
        type: s2
      - id: unknown2
        size: 112
      ## 0x009a
      - id: snap
        type: s1
      ## TODO Part of snap?
      - id: unknown3
        size: 1
      ## TODO How to decode?
      ## 0x009c-0x00a3
      - id: snap_value
        size: 8
      ## 0x00a4
      - id: grid
        type: s1
      - id: unknown4
        size: 9
      ## 0x00ae
      - id: ortho
        type: s1
      - id: unknown5
        size: 3
      ## 0x00b2
      - id: fill
        type: s1
      - id: unknown6
        size: 17
      ## 0x00c4
      - id: actual_layer
        type: s1
      - id: unknown7
        size: 1
      ## 0x00c6
      - id: actual_color
        type: s1
      ## TODO Layers
      - id: unknown8
        size: 273
      - id: units_type
        type: s1
