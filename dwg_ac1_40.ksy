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
        size: 1
      ## 0x000c-0x0013
      - id: insertion_base_x
        size: 8
      ## 0x0014-0x001b
      - id: insertion_base_y
        size: 8
      - id: unknown2
        size: 12
      ## 0x0028
      - id: number_of_entities
        type: s2
      - id: drawing_first_x
        size: 8
      - id: drawing_first_y
        size: 8
      - id: unknown3
        size: 8
      - id: drawing_second_x
        size: 8
      - id: drawing_second_y
        size: 8
      - id: unknown4
        size: 8
      # 0x005a-0x0061
      - id: limits_min_x
        size: 8
      # 0x0062-0x0069
      - id: limits_min_y
        size: 8
      # 0x006a-0x0071
      - id: limits_max_x
        size: 8
      # 0x0072-0x0079
      - id: limits_max_y
        size: 8
      - id: unknown5a
        size: 8
      - id: unknown5b
        size: 8
      - id: unknown5c
        size: 8
      - id: unknown5d
        size: 8
      ## 0x009a
      - id: snap
        type: s2
      ## 0x009c-0x00a3
      - id: snap_resolution
        size: 8
      ## 0x00a4
      - id: grid
        type: s2
      ## 0x00a6-0x00ad
      - id: grid_value
        size: 8
      ## 0x00ae
      - id: ortho
        type: s2
      - id: unknown6
        size: 2
      ## 0x00b2
      - id: fill
        type: s2
      - id: unknown7
        size: 8
      - id: unknown8
        size: 8
      ## 0x00c4
      - id: actual_layer
        type: s2
      ## 0x00c6
      - id: actual_color
        type: s2
      ## TODO Layers
      - id: unknown9
        size: 272
      ## 0x01d8
      - id: units_type
        type: s2
        enum: unit_types
      ## 0x01da
      - id: number_of_digits
        type: s2
      - id: unknown10
        size: 4
      ## 0x01e0
      - id: axis
        type: s2
      ## 0x01e2-0x01e9
      - id: axis_value
        size: 8
    instances:
      layer:
        pos: 202
        type: layer_type
  layer_type:
    seq:
      - id: layer
        type: s1
      - id: color
        type: s1
enums:
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
