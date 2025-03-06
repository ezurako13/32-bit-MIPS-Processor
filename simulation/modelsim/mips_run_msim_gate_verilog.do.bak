transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {mips.vo}

vlog -vlog01compat -work work +incdir+C:/Users/goktu/Desktop/1Projects/Organization/hw3/tests_banch {C:/Users/goktu/Desktop/1Projects/Organization/hw3/tests_banch/tb_mips.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L cyclonev_ver -L lpm_ver -L sgate_ver -L cyclonev_hssi_ver -L altera_mf_ver -L cyclonev_pcie_hip_ver -L gate_work -L work -voptargs="+acc"  tb_mips

add wave *
view structure
view signals
run -all
