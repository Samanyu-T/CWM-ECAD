##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]

set_property rst_n BD21 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]
set_property PULLUP true [get_ports reset_n]

set_property heating AU22 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property cooling AT22 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property temperature_0 BC21 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property temperature_1 BB21 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property temperature_2 BA20 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property temperature_3 AL20 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property temperature_4 AT20 [get_ports {led}]
set_property IOSTANDARD LVCMOS15 [get_ports {led}]

set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################



