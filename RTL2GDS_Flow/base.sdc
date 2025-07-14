# SDC file for LFSR AXI design

# Create main clock
create_clock -name clk -period 10.0 [get_ports clk]

# Set clock uncertainty
set_clock_uncertainty 0.25 [all_clocks]

# Set clock transition
set_clock_transition 0.15 [all_clocks]

# Input delays (assume 30% of clock period for setup)
set input_delay_value 3.0
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports rst_n]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_awaddr*]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_awvalid]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_wdata*]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_wvalid]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_bready]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_araddr*]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_arvalid]
set_input_delay $input_delay_value -clock [get_clocks clk] [get_ports s_axi_rready]

# Output delays (assume 30% of clock period for setup)
set output_delay_value 3.0
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_awready]
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_wready]
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_bresp*]
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_bvalid]
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_arready]
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_rdata*]
set_output_delay $output_delay_value -clock [get_clocks clk] [get_ports s_axi_rvalid]

# Set driving cells for inputs
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin Y [all_inputs]

# Set load capacitance for outputs
set_load 0.1 [all_outputs]

# Set max transition
set_max_transition 1.5 [current_design]

# Set max fanout
set_max_fanout 10 [current_design]

# Set false paths for reset
set_false_path -from [get_ports rst_n]

# Clock groups (if needed for multiple clocks)
# set_clock_groups -asynchronous -group [get_clocks clk]

# Environmental conditions
set_operating_conditions -library sky130_fd_sc_hd__tt_025C_1v80
