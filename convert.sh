#!/bin/sh

KSY_FILE=dwg_ac1_40.ksy
OUTPUT_PM_FILE=1_40.pm

ksc -t perl $KSY_FILE
mv Dwg0140.pm $OUTPUT_PM_FILE
sed -i s/Dwg0140/CAD::Format::DWG::1_40/g $OUTPUT_PM_FILE
