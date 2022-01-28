// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module mean_shift_accel_rgb2hsv_9_550_598_1_s_xf_cv_icvSaturate8u_cv1 (
address0, ce0, q0, reset,clk);

parameter DataWidth = 8;
parameter AddressWidth = 10;
parameter AddressRange = 769;

input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./mean_shift_accel_rgb2hsv_9_550_598_1_s_xf_cv_icvSaturate8u_cv1.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[address0];
    end
end



endmodule
