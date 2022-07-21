set_multicycle_path -setup -from [get_pins dig02/CLK] -to [get_pins {dig*_reg[*]/D}] 10000000
set_multicycle_path -hold -from [get_pins dig02/CLK] -to [get_pins {dig*_reg[*]/D}] 9999999