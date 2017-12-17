vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../EX4_2.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

