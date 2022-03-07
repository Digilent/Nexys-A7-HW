# You must provide all the delay numbers
# CCLK delay is 0.5, 7.5 ns min/max for Artix-7; refer to ds181_Artix_7_Data_Sheet.pdf
# Consider the max delay for worst case analysis
# Following are the SPI device parameters

# Max Tco
# Min Tco

# Setup time requirement
# Hold time requirement
# Following are the board/trace delay numbers
# Assumption is that all Data lines are matched

### End of user provided delay numbers
# this is to ensure min routing delay from SCK generation to STARTUP input
# User should change this value based on the results
# having more delay on this net reduces the Fmax
set_max_delay -datapath_only -from [get_pins -hier *SCK_O_reg_reg/C] -to [get_pins -hier *USRCCLKO] 1.500

set_min_delay -from [get_pins -hier *SCK_O_reg_reg/C] -to [get_pins -hier *USRCCLKO] 0.100
# Following command creates a divide by 2 clock
# It also takes into account the delay added by STARTUP block to route the CCLK
create_generated_clock -name clk_sck -source [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk] -edges {3 5 7} -edge_shift {7.500 7.500 7.500} [get_pins -hierarchical *USRCCLKO]
# Data is captured into FPGA on the second rising edge of ext_spi_clk after the SCK falling edge
# Data is driven by the FPGA on every alternate rising_edge of ext_spi_clk
set_input_delay -clock clk_sck -clock_fall -max 7.450 [get_ports qspi_flash_io*_io]
set_input_delay -clock clk_sck -clock_fall -min 1.450 [get_ports qspi_flash_io*_io]
set_multicycle_path -setup -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] 2

set_multicycle_path -hold -end -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] 1
# Data is captured into SPI on the following rising edge of SCK
# Data is driven by the IP on alternate rising_edge of the ext_spi_clk
set_output_delay -clock clk_sck -max 2.050 [get_ports qspi_flash_io*_io]
set_output_delay -clock clk_sck -min -2.950 [get_ports qspi_flash_io*_io]
set_multicycle_path -setup -start -from [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] -to clk_sck 2
set_multicycle_path -hold -from [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] -to clk_sck 1

#set_property MARK_DEBUG true [get_nets design_1_i/mig_7series_0/u_design_1_mig_7series_0_1_mig/sys_rst]
set_property MARK_DEBUG true [get_nets design_1_i/mig_7series_0/u_design_1_mig_7series_0_1_mig/u_ddr2_infrastructure/pll_locked_i]
set_property MARK_DEBUG true [get_nets design_1_i/mig_7series_0/mmcm_locked]
set_property MARK_DEBUG true [get_nets design_1_i/rst_mig_7series_0_81M/U0/ext_reset_in]
set_property MARK_DEBUG true [get_nets {design_1_i/rst_mig_7series_0_81M/U0/peripheral_aresetn[0]}]
set_property MARK_DEBUG true [get_nets design_1_i/rst_mig_7series_0_81M/U0/mb_reset]
set_property MARK_DEBUG true [get_nets {design_1_i/rst_mig_7series_0_81M/U0/bus_struct_reset[0]}]

set_property MARK_DEBUG true [get_nets design_1_i/mig_7series_0_ui_clk_sync_rst]
#set_property MARK_DEBUG true [get_nets design_1_i/ARESETN_1_0]
#set_property MARK_DEBUG true [get_nets design_1_i/mig_7series_0/ui_clk_sync_rst]

set_property MARK_DEBUG true [get_nets reset_0_IBUF]
set_property MARK_DEBUG false [get_nets {design_1_i/mig_7series_0/u_design_1_mig_7series_0_1_mig/u_iodelay_ctrl/AS[0]}]



set_property MARK_DEBUG true [get_nets {design_1_i/rst_mig_7series_0_81M/U0/interconnect_aresetn[0]}]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/mdm_1/U0/No_Dbg_Reg_Access.BUFG_DRCK/Dbg_Clk_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/rst_mig_7series_0_81M/U0/interconnect_aresetn[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/rst_mig_7series_0_81M/U0/bus_struct_reset[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/rst_mig_7series_0_81M/U0/peripheral_aresetn[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list design_1_i/rst_mig_7series_0_81M/U0/ext_reset_in]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list design_1_i/rst_mig_7series_0_81M/U0/mb_reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list design_1_i/mig_7series_0_ui_clk_sync_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/mig_7series_0/mmcm_locked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/mig_7series_0/u_design_1_mig_7series_0_1_mig/u_ddr2_infrastructure/pll_locked_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list reset_0_IBUF]]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_Dbg_Clk_0]
