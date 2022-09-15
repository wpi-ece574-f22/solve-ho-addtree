define_corners wc typ bc
read_liberty -corner typ /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_100C_1v80.lib
read_liberty -corner wc /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__ss_100C_1v60.lib
read_liberty -corner bc /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_verilog addtree_gl.v
link_design addtree

create_clock -name clk -period 20 {clk}
set_input_delay -clock  clk 2 {reset}
set_input_delay -clock  clk 2 {a}
set_input_delay -clock  clk 2 {b}
set_input_delay -clock  clk 2 {c}
set_input_delay -clock  clk 2 {d}
set_output_delay -clock clk 2 {q}

for {set i 34} {$i < 64} {incr i} {
  set p [get_property [get_property [get_timing_edges -to q[$i]] from_pin] full_name]
  set_false_path -through [regsub /Q $p /D]
}

report_checks -corner wc
report_checks -corner typ
report_checks -corner bc

exit
