## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

## Switches
#set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
#set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PACKAGE_PIN V15 [get_ports {tune[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {tune[5]}]
#set_property PACKAGE_PIN W14 [get_ports {tune[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {tune[6]}]
#set_property PACKAGE_PIN W13 [get_ports {tune[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {tune[7]}]
#set_property PACKAGE_PIN V2 [get_ports {quality[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {quality[0]}]
#set_property PACKAGE_PIN T3 [get_ports {quality[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {quality[1]}]
#set_property PACKAGE_PIN T2 [get_ports {quality[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {}]
#set_property PACKAGE_PIN R3 [get_ports ]
#set_property IOSTANDARD LVCMOS33 [get_ports ]
#set_property PACKAGE_PIN W2 [get_ports ]
#set_property IOSTANDARD LVCMOS33 [get_ports ]
#set_property PACKAGE_PIN U1 [get_ports ]
#set_property IOSTANDARD LVCMOS33 [get_ports ]	
#set_property PACKAGE_PIN T1 [get_ports {speed[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {speed[1]}]
#set_property PACKAGE_PIN R2 [get_ports {speed[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {speed[0]}]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
#set_property PACKAGE_PIN W18 [get_ports {stop_front}]
#set_property IOSTANDARD LVCMOS33 [get_ports {stop_front}]
set_property PACKAGE_PIN U15 [get_ports {rxdata[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[0]}]
set_property PACKAGE_PIN U14 [get_ports {rxdata[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[1]}]
set_property PACKAGE_PIN V14 [get_ports {rxdata[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[2]}]
set_property PACKAGE_PIN V13 [get_ports {rxdata[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[3]}]
set_property PACKAGE_PIN V3 [get_ports {rxdata[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[4]}]
set_property PACKAGE_PIN W3 [get_ports {rxdata[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[5]}]
set_property PACKAGE_PIN U3 [get_ports {rxdata[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[6]}]
set_property PACKAGE_PIN P3 [get_ports {rxdata[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rxdata[7]}]
set_property PACKAGE_PIN N3 [get_ports {stop_back}]
set_property IOSTANDARD LVCMOS33 [get_ports {stop_back}]
set_property PACKAGE_PIN P1 [get_ports {stop_front}]
set_property IOSTANDARD LVCMOS33 [get_ports {stop_front}]
set_property PACKAGE_PIN L1 [get_ports mode]
set_property IOSTANDARD LVCMOS33 [get_ports mode]


##7 segment display
#set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
#set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
#set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
#set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
#set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
#set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
#set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]
#set_property IOSTANDARD LVCMOS33 [get_ports dp]

#set_property PACKAGE_PIN U2 [get_ports {an[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
#set_property PACKAGE_PIN U4 [get_ports {an[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
#set_property PACKAGE_PIN V4 [get_ports {an[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
#set_property PACKAGE_PIN W4 [get_ports {an[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
#btnC
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
#btnU
#set_property PACKAGE_PIN T18 [get_ports ]
#set_property IOSTANDARD LVCMOS33 [get_ports ]
#btnL
#set_property PACKAGE_PIN W19 [get_ports btnL]
#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
#btnR
#set_property PACKAGE_PIN T17 [get_ports btnR]
#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#btnD
#set_property PACKAGE_PIN U17 [get_ports rst]
#set_property IOSTANDARD LVCMOS33 [get_ports rst]



##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports left_light]
set_property IOSTANDARD LVCMOS33 [get_ports left_light]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {echo_back}]
set_property IOSTANDARD LVCMOS33 [get_ports {echo_back}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {trig_back}]
set_property IOSTANDARD LVCMOS33 [get_ports {trig_back}]
##Sch name = JA4
#set_property PACKAGE_PIN G2 [get_ports servo]
#set_property IOSTANDARD LVCMOS33 [get_ports servo]
##Sch name = JA7
#set_property PACKAGE_PIN H1 [get_ports right_motor]
#set_property IOSTANDARD LVCMOS33 [get_ports right_motor]
##Sch name = JA8
#set_property PACKAGE_PIN K2 [get_ports {right[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {right[1]}]
##Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {right[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {right[0]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports echo_front]
#set_property IOSTANDARD LVCMOS33 [get_ports echo_front]

##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports left_motor]
set_property IOSTANDARD LVCMOS33 [get_ports left_motor]
##Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {left[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {left[1]}]
##Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {left[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {left[0]}]
##Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports trig_front]
set_property IOSTANDARD LVCMOS33 [get_ports trig_front]
##Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports right_motor]
set_property IOSTANDARD LVCMOS33 [get_ports right_motor]
##Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {right[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {right[1]}]
##Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {right[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {right[0]}]
##Sch name = JB10
set_property PACKAGE_PIN C16 [get_ports echo_front]
set_property IOSTANDARD LVCMOS33 [get_ports echo_front]



##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {right_light}]
set_property IOSTANDARD LVCMOS33 [get_ports {right_light}]
##Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {echo_back}]
#set_property IOSTANDARD LVCMOS33 [get_ports {echo_back}]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {trig_back}]
#set_property IOSTANDARD LVCMOS33 [get_ports {trig_back}]
##Sch name = JC4
#set_property PACKAGE_PIN P18 [get_ports {JC[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
##Sch name = JC7
#set_property PACKAGE_PIN L17 [get_ports {JC[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[4]}]
##Sch name = JC8
#set_property PACKAGE_PIN M19 [get_ports {JC[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[5]}]
##Sch name = JC9
#set_property PACKAGE_PIN P17 [get_ports {JC[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx}]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
