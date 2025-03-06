transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux {C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux/_1_bit_8e1_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLL2_level.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLL1_level.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLA32bitMSB.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLA16bitMSB.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLA16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLA4bitMSB.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/CLA4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/Alu1BitMSB.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/CLA/Alu1Bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3 {C:/Users/goktu/Desktop/1Projects/Organization/hw3/mips.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux {C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux/mux2x1bit32.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux {C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux/mux2x1bit5.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux {C:/Users/goktu/Desktop/1Projects/Organization/hw3/mux/mux2x1bit1.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/others {C:/Users/goktu/Desktop/1Projects/Organization/hw3/others/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu {C:/Users/goktu/Desktop/1Projects/Organization/hw3/alu/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/others {C:/Users/goktu/Desktop/1Projects/Organization/hw3/others/shift_left_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/others {C:/Users/goktu/Desktop/1Projects/Organization/hw3/others/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/others {C:/Users/goktu/Desktop/1Projects/Organization/hw3/others/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/others {C:/Users/goktu/Desktop/1Projects/Organization/hw3/others/alu_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/memory {C:/Users/goktu/Desktop/1Projects/Organization/hw3/memory/memory_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/memory {C:/Users/goktu/Desktop/1Projects/Organization/hw3/memory/instruction_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/memory {C:/Users/goktu/Desktop/1Projects/Organization/hw3/memory/register_block.v}

vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/tests_banch {C:/Users/goktu/Desktop/1Projects/Organization/hw3/tests_banch/tb_mips.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_mips

add wave *
view structure
view signals
run -all
