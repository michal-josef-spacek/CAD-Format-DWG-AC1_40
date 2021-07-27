meta:
  id: dwg_0140
  title: AutoCAD drawing (AC1.40)
  application: AutoCAD
  file-extension:
    - dwg
  license: CC0-1.0
  xref:
    justsolve: DWG
    pronom:
      fmt: 24
    mime:
      - application/x-dwg
      - image/vnd.dwg
    wikidata: Q27863111
  endian: le
seq:
  - id: header
    type: header
  - id: entities
    type: entity
    repeat: expr
    repeat-expr: header.number_of_entities
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
      - id: insertion_base_x
        size: 8
        doc: 0x000c-0x0013
      - id: insertion_base_y
        size: 8
        doc: 0x0014-0x001b
      - id: unknown2
        size: 12
      - id: number_of_entities
        type: s2
        doc: 0x0028-0x0029
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
      - id: limits_min_x
        size: 8
        doc: 0x005a-0x0061
      - id: limits_min_y
        size: 8
        doc: 0x0062-0x0069
      - id: limits_max_x
        size: 8
        doc: 0x006a-0x0071
      - id: limits_max_y
        size: 8
        doc: 0x0072-0x0079
      - id: dwgview1
        size: 8
      - id: dwgview2
        size: 8
      - id: unknown5
        size: 8
      - id: dwgview3
        size: 8
      - id: snap
        type: s2
        doc: 0x009a-0x009b
      - id: snap_resolution
        size: 8
        doc: 0x009c-0x00a3
      - id: grid
        type: s2
        doc: 0x00a4-0x00a5
      - id: grid_value
        size: 8
        doc: 0x00a6-0x00ad
      - id: ortho
        type: s2
        doc: 0x00ae-0x00af
      - id: unknown6
        size: 2
        doc: XXX could be ffff
      - id: fill
        type: s2
        doc: 0x00b2-0x00b3 (XXX could be ffff)
      - id: text_size
        size: 8
      - id: trace_width
        size: 8
      - id: actual_layer
        type: s2
        doc: 0x00c4-0x00c5
      - id: actual_color
        type: s2
        doc: 0x00c6-0x00c7
      - id: unknown9
        size: 2
      - id: layers
        type: s2
        repeat: expr
        repeat-expr: 127
      - id: unknown10
        size: 8
      - id: unknown11
        size: 8
      - id: units_type
        type: s2
        enum: unit_types
        doc: 0x01d8-0x01d9
      - id: number_of_digits
        type: s2
        doc: 0x01da-0x01db
      - id: unknown12
        size: 4
      - id: axis
        type: s2
        doc: 0x01e0-0x01e1
      - id: axis_value
        size: 8
        doc: 0x01e2-0x01e9
      - id: unknown13
        size: 8
        doc: XXX Value is 0.25 somewhere
      - id: unknown14
        size: 8
        doc: XXX Value is 0.1 somewhere
      - id: unknown15
        size: 8
  entity:
    seq:
      - id: entity_type
        type: s2
        enum: entities
      - id: data
        type:
          switch-on: entity_type
          cases:
            'entities::arc': entity_arc
            'entities::circle': entity_circle
            'entities::line': entity_line
            'entities::point': entity_point
            'entities::text': entity_text
  entity_arc:
    seq:
      - id: entity_layer
        type: s2
      - id: x
        size: 8
      - id: y
        size: 8
      - id: radius
        size: 8
      - id: angle_from
        size: 8
      - id: angle_to
        size: 8
  entity_circle:
    seq:
      - id: layer
        type: s2
      ## circle x1
      - id: x1
        size: 8
      ## circle y1
      - id: y1
        size: 8
      ## circle x2
      - id: x2
        size: 8
      ## circle y2
      - id: y2
        size: 8
  entity_line:
    seq:
      - id: layer
        type: s2
      ## line x1
      - id: x1
        size: 8
      ## line y1
      - id: y1
        size: 8
      ## line x2
      - id: x2
        size: 8
      ## line y2
      - id: y2
        size: 8
  entity_point:
    seq:
      - id: layer
        type: s2
      - id: x
        size: 8
      - id: y
        size: 8
  entity_text:
    seq:
      - id: layer
        type: s2
      - id: x
        size: 8
      - id: y
        size: 8
      ## TODO opravdu?
      - id: height
        size: 8
      ## TODO opravdu?
      - id: angle
        size: 8
      - id: size
        type: s2
      - id: value
        size: size
enums:
  entities:
    1: line
    2: point
    3: circle
    7: text
    8: arc
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
