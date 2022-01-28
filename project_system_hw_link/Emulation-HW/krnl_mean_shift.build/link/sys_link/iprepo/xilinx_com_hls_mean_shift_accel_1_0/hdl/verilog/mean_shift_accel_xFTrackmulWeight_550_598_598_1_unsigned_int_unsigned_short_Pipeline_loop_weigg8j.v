// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module mean_shift_accel_xFTrackmulWeight_550_598_598_1_unsigned_int_unsigned_short_Pipeline_loop_weigg8j (
address0, ce0, q0, reset,clk);

parameter DataWidth = 4;
parameter AddressWidth = 7;
parameter AddressRange = 100;

input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./mean_shift_accel_xFTrackmulWeight_550_598_598_1_unsigned_int_unsigned_short_Pipeline_loop_weigg8j.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[address0];
    end
end



endmodule

