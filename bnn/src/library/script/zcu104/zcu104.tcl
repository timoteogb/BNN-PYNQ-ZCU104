# Add Zynq MPSoC IP
set zynq_ultra_ps_e_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.2 zynq_ultra_ps_e_0 ]

# Apply preset values to the PS configuration. Change clock frequency. Add HP0 Slave AXI connection
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]
set_property -dict [list CONFIG.PSU__USE__S_AXI_GP2 {1} CONFIG.PSU__USE__M_AXI_GP1 {0} CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {300}] [get_bd_cells zynq_ultra_ps_e_0]
