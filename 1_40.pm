# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package CAD::Format::DWG::1_40;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $UNIT_TYPES_SCIENTIFIC = 1;
our $UNIT_TYPES_DECIMAL = 2;
our $UNIT_TYPES_ENGINEERING = 3;
our $UNIT_TYPES_ARCHITECTURAL = 4;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = CAD::Format::DWG::1_40::Header->new($self->{_io}, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package CAD::Format::DWG::1_40::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(6), 0, 0));
    $self->{zeros} = $self->{_io}->read_bytes(5);
    $self->{unknown1} = $self->{_io}->read_bytes(1);
    $self->{insertion_base_x} = $self->{_io}->read_bytes(8);
    $self->{insertion_base_y} = $self->{_io}->read_bytes(8);
    $self->{unknown2} = $self->{_io}->read_bytes(12);
    $self->{number_of_entities} = $self->{_io}->read_s2le();
    $self->{drawing_first_x} = $self->{_io}->read_bytes(8);
    $self->{drawing_first_y} = $self->{_io}->read_bytes(8);
    $self->{unknown3} = $self->{_io}->read_bytes(8);
    $self->{drawing_second_x} = $self->{_io}->read_bytes(8);
    $self->{drawing_second_y} = $self->{_io}->read_bytes(8);
    $self->{unknown4} = $self->{_io}->read_bytes(8);
    $self->{limits_min_x} = $self->{_io}->read_bytes(8);
    $self->{limits_min_y} = $self->{_io}->read_bytes(8);
    $self->{limits_max_x} = $self->{_io}->read_bytes(8);
    $self->{limits_max_y} = $self->{_io}->read_bytes(8);
    $self->{unknown5a} = $self->{_io}->read_bytes(8);
    $self->{unknown5b} = $self->{_io}->read_bytes(8);
    $self->{unknown5c} = $self->{_io}->read_bytes(8);
    $self->{unknown5d} = $self->{_io}->read_bytes(8);
    $self->{snap} = $self->{_io}->read_s2le();
    $self->{snap_resolution} = $self->{_io}->read_bytes(8);
    $self->{grid} = $self->{_io}->read_s2le();
    $self->{grid_value} = $self->{_io}->read_bytes(8);
    $self->{ortho} = $self->{_io}->read_s2le();
    $self->{unknown6} = $self->{_io}->read_bytes(2);
    $self->{fill} = $self->{_io}->read_s2le();
    $self->{unknown7} = $self->{_io}->read_bytes(8);
    $self->{unknown8} = $self->{_io}->read_bytes(8);
    $self->{actual_layer} = $self->{_io}->read_s2le();
    $self->{actual_color} = $self->{_io}->read_s2le();
    $self->{unknown9} = $self->{_io}->read_bytes(272);
    $self->{units_type} = $self->{_io}->read_s2le();
    $self->{number_of_digits} = $self->{_io}->read_s2le();
    $self->{unknown10} = $self->{_io}->read_bytes(4);
    $self->{axis} = $self->{_io}->read_s2le();
    $self->{axis_value} = $self->{_io}->read_bytes(8);
}

sub layer {
    my ($self) = @_;
    return $self->{layer} if ($self->{layer});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(202);
    $self->{layer} = CAD::Format::DWG::1_40::LayerType->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{layer};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub zeros {
    my ($self) = @_;
    return $self->{zeros};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub insertion_base_x {
    my ($self) = @_;
    return $self->{insertion_base_x};
}

sub insertion_base_y {
    my ($self) = @_;
    return $self->{insertion_base_y};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub number_of_entities {
    my ($self) = @_;
    return $self->{number_of_entities};
}

sub drawing_first_x {
    my ($self) = @_;
    return $self->{drawing_first_x};
}

sub drawing_first_y {
    my ($self) = @_;
    return $self->{drawing_first_y};
}

sub unknown3 {
    my ($self) = @_;
    return $self->{unknown3};
}

sub drawing_second_x {
    my ($self) = @_;
    return $self->{drawing_second_x};
}

sub drawing_second_y {
    my ($self) = @_;
    return $self->{drawing_second_y};
}

sub unknown4 {
    my ($self) = @_;
    return $self->{unknown4};
}

sub limits_min_x {
    my ($self) = @_;
    return $self->{limits_min_x};
}

sub limits_min_y {
    my ($self) = @_;
    return $self->{limits_min_y};
}

sub limits_max_x {
    my ($self) = @_;
    return $self->{limits_max_x};
}

sub limits_max_y {
    my ($self) = @_;
    return $self->{limits_max_y};
}

sub unknown5a {
    my ($self) = @_;
    return $self->{unknown5a};
}

sub unknown5b {
    my ($self) = @_;
    return $self->{unknown5b};
}

sub unknown5c {
    my ($self) = @_;
    return $self->{unknown5c};
}

sub unknown5d {
    my ($self) = @_;
    return $self->{unknown5d};
}

sub snap {
    my ($self) = @_;
    return $self->{snap};
}

sub snap_resolution {
    my ($self) = @_;
    return $self->{snap_resolution};
}

sub grid {
    my ($self) = @_;
    return $self->{grid};
}

sub grid_value {
    my ($self) = @_;
    return $self->{grid_value};
}

sub ortho {
    my ($self) = @_;
    return $self->{ortho};
}

sub unknown6 {
    my ($self) = @_;
    return $self->{unknown6};
}

sub fill {
    my ($self) = @_;
    return $self->{fill};
}

sub unknown7 {
    my ($self) = @_;
    return $self->{unknown7};
}

sub unknown8 {
    my ($self) = @_;
    return $self->{unknown8};
}

sub actual_layer {
    my ($self) = @_;
    return $self->{actual_layer};
}

sub actual_color {
    my ($self) = @_;
    return $self->{actual_color};
}

sub unknown9 {
    my ($self) = @_;
    return $self->{unknown9};
}

sub units_type {
    my ($self) = @_;
    return $self->{units_type};
}

sub number_of_digits {
    my ($self) = @_;
    return $self->{number_of_digits};
}

sub unknown10 {
    my ($self) = @_;
    return $self->{unknown10};
}

sub axis {
    my ($self) = @_;
    return $self->{axis};
}

sub axis_value {
    my ($self) = @_;
    return $self->{axis_value};
}

########################################################################
package CAD::Format::DWG::1_40::LayerType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{layer} = $self->{_io}->read_s1();
    $self->{color} = $self->{_io}->read_s1();
}

sub layer {
    my ($self) = @_;
    return $self->{layer};
}

sub color {
    my ($self) = @_;
    return $self->{color};
}

1;
