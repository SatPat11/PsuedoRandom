SIM ?= icarus
TOPLEVEL_LANG = verilog
VERILOG_SOURCES = $(PWD)/lfsr.v
lfsr:
	rm -rf sim_build
	$(MAKE) sim MODULE=lfsr TOPLEVEL=tb_lfsr_axi_cocotb 
include $(shell cocotb-config --makefile)/Makefile.sim
