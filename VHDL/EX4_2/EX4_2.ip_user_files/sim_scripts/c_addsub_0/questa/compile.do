vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../EX4_2.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

