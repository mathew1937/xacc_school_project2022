#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Jan 28 10:19:09 UTC 2022
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail

xv_cxl_lib_path="/opt/Xilinx/Vivado/2021.1/data/xsim"
export xv_cpt_lib_path="/opt/Xilinx/Vivado/2021.1/data/simmodels/xsim/2021.1/lnx64/6.2.0/systemc/protected"
xv_ext_lib_path="/opt/Xilinx/Vivado/2021.1/data/simmodels/xsim/2021.1/lnx64/6.2.0/ext"
xv_lib_path="/opt/Xilinx/Vivado/2021.1/lib/lnx64.o/Default:/opt/Xilinx/Vivado/2021.1/lib/lnx64.o"

xv_ref_path=${VIVADO_LOC:-"/opt/Xilinx/Vivado/2021.1"}
xv_lib_path="$xv_ref_path/lib/lnx64.o/Default:$xv_ref_path/lib/lnx64.o"

export LD_LIBRARY_PATH=$PWD:$xv_lib_path:$xv_ref_path/data/simmodels/xsim/2021.1/lnx64/6.2.0/ext/protobuf:$xv_ref_path/data/xsim/ip/xtlm:$xv_ref_path/data/xsim/ip/xtlm_simple_interconnect_v1_0:$xv_ref_path/data/xsim/ip/common_cpp_v1_0:$xv_ref_path/data/xsim/ip/emu_perf_common_v1_0:$LD_LIBRARY_PATH

# simulate design
echo "xsim emu_wrapper_behav -key {Behavioral:sim_1:Functional:emu_wrapper} -tclbatch emu_wrapper.tcl -protoinst "protoinst_files/bd_d216.protoinst" -protoinst "protoinst_files/pfm_dynamic.protoinst" -protoinst "protoinst_files/emu.protoinst" -log simulate.log $*"
xsim emu_wrapper_behav -key {Behavioral:sim_1:Functional:emu_wrapper} -tclbatch emu_wrapper.tcl -protoinst "protoinst_files/bd_d216.protoinst" -protoinst "protoinst_files/pfm_dynamic.protoinst" -protoinst "protoinst_files/emu.protoinst" -log simulate.log $*

