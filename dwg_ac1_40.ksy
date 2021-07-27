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
      - id: dwgview1
        size: 8
      - id: dwgview2
        size: 8
      - id: unknown5
        size: 8
      - id: dwgview3
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
      ## XXX Could be ffff
      - id: unknown6
        size: 2
      ## 0x00b2
      ## XXX Could be ffff
      - id: fill
        type: s2
      - id: txt_size
        size: 8
      - id: trace_width
        size: 8
      ## 0x00c4
      - id: actual_layer
        type: s2
      ## 0x00c6
      - id: actual_color
        type: s2
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
      ## 0x01d8
      - id: units_type
        type: s2
        enum: unit_types
      ## 0x01da
      - id: number_of_digits
        type: s2
      - id: unknown12
        size: 4
      ## 0x01e0
      - id: axis
        type: s2
      ## 0x01e2-0x01e9
      - id: axis_value
        size: 8
      ## 0.25
      - id: unknown13
        size: 8
      ## 0.1
      - id: unknown14
        size: 8
      ## 0x8
      - id: unknown15
        size: 8
  entity:
    seq:
      ## 1 - line
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
  entity_line:
    seq:
      - id: entity_layer
        type: s2
      ## line x1
      - id: line_x1
        size: 8
      ## line y1
      - id: line_y1
        size: 8
      ## line x2
      - id: line_x2
        size: 8
      ## line y2
      - id: line_y2
        size: 8
  entity_point:
    seq:
      - id: entity_layer
        type: s2
      - id: point_x
        size: 8
      - id: point_y
        size: 8
  entity_circle:
    seq:
      - id: entity_layer
        type: s2
      ## circle x1
      - id: circle_x1
        size: 8
      ## circle y1
      - id: circle_y1
        size: 8
      ## circle x2
      - id: circle_x2
        size: 8
      ## circle y2
      - id: circle_y2
        size: 8
  entity_text:
    seq:
      - id: entity_layer
        type: s2
      - id: text_x
        size: 8
      - id: text_y
        size: 8
      ## TODO opravdu?
      - id: text_height
        size: 8
      ## TODO opravdu?
      - id: text_angle
        size: 8
      - id: text_size
        type: s2
      - id: text_value
        size: text_size
  entity_arc:
    seq:
      - id: entity_layer
        type: s2
      - id: arc_x
        size: 8
      - id: arc_y
        size: 8
      - id: arc_radius
        size: 8
      - id: arc_angle_from
        size: 8
      - id: arc_angle_to
        size: 8
enums:
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
  entities:
    1: line
    2: point
    3: circle
    7: text
    8: arc
