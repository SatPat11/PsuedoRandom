# Configuration for LFSR AXI design
set ::env(DESIGN_NAME) "lfsr_axi_top"
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Clock configuration
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk"

# Design constraints
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 100.0 100.0"
set ::env(FP_CORE_UTIL) 50
set ::env(FP_ASPECT_RATIO) 1
set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_PDN_CORE_RING_VWIDTH) 1.6
set ::env(FP_PDN_CORE_RING_HWIDTH) 1.6
set ::env(FP_PDN_CORE_RING_VOFFSET) 6
set ::env(FP_PDN_CORE_RING_HOFFSET) 6

# Cell padding for better routing
set ::env(CELL_PAD) 2

# Standard cell library
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# DRC settings
set ::env(RUN_DRC) 1
set ::env(DRC_EXCLUDE_CELL_LIST) ""

# LVS settings
set ::env(RUN_LVS) 1

# Magic settings
set ::env(RUN_MAGIC) 1
set ::env(RUN_MAGIC_DRC) 1

# Placement settings
set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.55
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

# CTS settings
set ::env(CTS_TARGET_SKEW) 200
set ::env(CTS_TOLERANCE) 100

# Routing settings
set ::env(ROUTING_STRATEGY) 0
set ::env(RT_MAX_LAYER) "met4"

# Fill settings
set ::env(FILL_INSERTION) 1

# Tap cell settings
set ::env(FP_TAP_HORIZONTAL_HALO) 10
set ::env(FP_TAP_VERTICAL_HALO) 10

# Power pins
set ::env(VDD_PINS) [list VPWR VPB]
set ::env(GND_PINS) [list VGND VNB VSUBS]

# Additional optimizations
set ::env(SYNTH_SIZING) 1
set ::env(SYNTH_BUFFERING) 1
set ::env(SYNTH_STRATEGY) "AREA 0"

# GLB resizer settings
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1

# Diode insertion
set ::env(DIODE_INSERTION_STRATEGY) 4
