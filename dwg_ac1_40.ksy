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
        contents: [0x41, 0x43, 0x31, 0x2e, 0x34, 0x30]
      - id: zeros
        size: 6
      - id: insertion_base_x
        type: f8
        doc: 0x000c-0x0013
      - id: insertion_base_y
        type: f8
        doc: 0x0014-0x001b
      - id: insertion_base_z
        type: f8
        doc: 0x001c-0x0023
      - id: number_of_bytes
        type: s4
      - id: number_of_entities
        type: s2
        doc: 0x0028-0x0029
      - id: drawing_first_x
        type: f8
      - id: drawing_first_y
        type: f8
      - id: drawing_first_z
        type: f8
      - id: drawing_second_x
        type: f8
      - id: drawing_second_y
        type: f8
      - id: drawing_second_z
        type: f8
      - id: limits_min_x
        type: f8
        doc: 0x005a-0x0061
      - id: limits_min_y
        type: f8
        doc: 0x0062-0x0069
      - id: limits_max_x
        type: f8
        doc: 0x006a-0x0071
      - id: limits_max_y
        type: f8
        doc: 0x0072-0x0079
      - id: view_ctrl_x
        type: f8
      - id: view_ctrl_y
        type: f8
      - id: view_ctrl_z
        type: f8
      - id: view_size
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
      - id: grid_unit
        size: 8
        doc: 0x00a6-0x00ad
      - id: ortho
        type: s2
        doc: 0x00ae-0x00af
      - id: unknown1
        size: 2
        doc: XXX could be ffff, regen mode as in AC1003?
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
      - id: unknown2
        size: 2
      - id: layers
        type: s2
        repeat: expr
        repeat-expr: 127
      - id: dim_arrowsize
        size: 8
      - id: unknown3
        size: 8
        doc: dim?
      - id: linear_units_format
        type: s2
        enum: unit_types
        doc: 0x01d8-0x01d9, $LUNITS
      - id: linear_units_precision
        type: s2
        doc: 0x01da-0x01db, $LUPREC
      - id: dim_text_within_dimension
        type: s2
      - id: dim_text_outside_of_dimension
        type: s2
      - id: axis
        type: s2
        doc: 0x01e0-0x01e1
      - id: axis_value
        size: 8
        doc: 0x01e2-0x01e9
      - id: unknown4
        size: 8
        doc: Default value is 0.25
      - id: unknown5
        size: 8
        doc: Default value is 0.1
      - id: fillet_radius
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
            'entities::block_begin': entity_block_begin
            'entities::block_end': entity_block_end
            'entities::block_insert' : entity_block_insert
            'entities::circle': entity_circle
            'entities::line': entity_line
            'entities::load': entity_load
            'entities::point': entity_point
            'entities::repeat_begin': entity_repeat_begin
            'entities::repeat_end': entity_repeat_end
            'entities::shape': entity_shape
            'entities::solid': entity_solid
            'entities::text': entity_text
            'entities::trace': entity_trace
            _: entity_tmp
  entity_arc:
    seq:
      - id: layer
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
  entity_block_begin:
    seq:
      - id: layer
        type: s2
      - id: size
        type: s2
      - id: value
        size: size
      - id: x
        size: 8
      - id: y
        size: 8
  entity_block_end:
    seq:
      - id: layer
        type: s2
  entity_block_insert:
    seq:
      - id: layer
        type: s2
      - id: size
        type: s2
      - id: value
        size: size
      - id: x
        size: 8
      - id: y
        size: 8
      - id: x_scale
        size: 8
      - id: y_scale
        size: 8
      - id: rotation_angle
        size: 8
  entity_circle:
    seq:
      - id: layer
        type: s2
      - id: x
        size: 8
      - id: y
        size: 8
      - id: radius
        size: 8
  entity_line:
    seq:
      - id: layer
        type: s2
      - id: x1
        size: 8
      - id: y1
        size: 8
      - id: x2
        size: 8
      - id: y2
        size: 8
  entity_load:
    seq:
      - id: layer
        type: s2
      - id: size
        type: s2
      - id: value
        size: size
  entity_point:
    seq:
      - id: layer
        type: s2
      - id: x
        type: f8
      - id: y
        type: f8
  entity_repeat_begin:
    seq:
      - id: layer
        type: s2
  entity_repeat_end:
    seq:
      - id: layer
        type: s2
      - id: columns
        type: s2
      - id: rows
        type: s2
      - id: column_distance
        size: 8
      - id: row_distance
        size: 8
  entity_shape:
    seq:
      - id: layer
        type: s2
      - id: x
        size: 8
      - id: y
        size: 8
      - id: height
        size: 8
      - id: angle
        size: 8
      - id: item_num
        type: s2
  entity_solid:
    seq:
      - id: layer
        type: s2
      - id: from_x
        size: 8
      - id: from_y
        size: 8
      - id: from_and_x
        size: 8
      - id: from_and_y
        size: 8
      - id: to_x
        size: 8
      - id: to_y
        size: 8
      - id: to_and_x
        size: 8
      - id: to_and_y
        size: 8
  entity_text:
    seq:
      - id: layer
        type: s2
      - id: x
        type: f8
      - id: y
        type: f8
      - id: height
        type: f8
      - id: angle
        type: f8
      - id: size
        type: s2
      - id: value
        size: size
  entity_tmp:
    doc: Removed after redraw
    seq:
      - id: layer
        type: s2
      - id: x1
        size: 8
      - id: y1
        size: 8
      - id: x2
        size: 8
      - id: y2
        size: 8
  entity_trace:
    seq:
      - id: layer
        type: s2
      - id: from_x
        size: 8
      - id: from_y
        size: 8
      - id: from_and_x
        size: 8
      - id: from_and_y
        size: 8
      - id: to_x
        size: 8
      - id: to_y
        size: 8
      - id: to_and_x
        size: 8
      - id: to_and_y
        size: 8
enums:
  entities:
    1: line
    2: point
    3: circle
    4: shape
    5: repeat_begin
    6: repeat_end
    7: text
    8: arc
    9: trace
    10: load
    11: solid
    12: block_begin
    13: block_end
    14: block_insert
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
