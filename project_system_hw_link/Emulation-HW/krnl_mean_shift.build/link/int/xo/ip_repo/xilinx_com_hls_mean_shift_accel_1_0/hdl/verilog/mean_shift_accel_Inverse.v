// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mean_shift_accel_Inverse (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x,
        ap_return_0,
        ap_return_1,
        ap_ext_blocking_n,
        ap_str_blocking_n,
        ap_int_blocking_n
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [14:0] x;
output  [31:0] ap_return_0;
output  [7:0] ap_return_1;
output   ap_ext_blocking_n;
output   ap_str_blocking_n;
output   ap_int_blocking_n;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] ap_return_0;
reg[7:0] ap_return_1;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [11:0] xf_cv_division_lut_address0;
reg    xf_cv_division_lut_ce0;
wire   [15:0] xf_cv_division_lut_q0;
wire   [3:0] tmpx_fu_174_p1;
reg   [3:0] tmpx_reg_408;
wire   [31:0] zext_ln3026_fu_179_p1;
reg   [31:0] zext_ln3026_reg_413;
wire   [2:0] trunc_ln_fu_183_p4;
reg   [2:0] trunc_ln_reg_418;
wire   [3:0] tmpx_3_fu_194_p4;
reg   [3:0] tmpx_3_reg_423;
wire   [3:0] tmpx_4_fu_205_p4;
reg   [3:0] tmpx_4_reg_428;
wire   [0:0] icmp_ln3033_fu_216_p2;
reg   [0:0] icmp_ln3033_reg_433;
wire   [0:0] icmp_ln3036_fu_222_p2;
reg   [0:0] icmp_ln3036_reg_437;
wire   [0:0] icmp_ln3050_fu_228_p2;
reg   [0:0] icmp_ln3050_reg_441;
wire   [0:0] icmp_ln3064_fu_234_p2;
reg   [0:0] icmp_ln3064_reg_445;
wire   [0:0] grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_return;
reg   [0:0] targetBlock_reg_449;
wire    ap_CS_fsm_state2;
wire   [4:0] B_L_fu_292_p2;
reg   [4:0] B_L_reg_454;
wire    ap_CS_fsm_state3;
wire   [0:0] grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_return;
reg   [0:0] targetBlock1_reg_461;
wire    ap_CS_fsm_state4;
wire   [0:0] grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_return;
reg   [0:0] targetBlock3_reg_466;
wire    ap_CS_fsm_state5;
wire   [0:0] grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_return;
reg   [0:0] targetBlock2_reg_471;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_done;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_idle;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_ready;
wire   [2:0] grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_tmp_8_out;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_tmp_8_out_ap_vld;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_ext_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_str_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_int_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_done;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_idle;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_ready;
wire   [2:0] grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_tmp_9_out;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_tmp_9_out_ap_vld;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_ext_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_str_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_int_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_done;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_idle;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_ready;
wire   [2:0] grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_tmp_11_out;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_tmp_11_out_ap_vld;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_ext_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_str_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_int_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_done;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_idle;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_ready;
wire   [2:0] grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_tmp_10_out;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_tmp_10_out_ap_vld;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_ext_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_str_blocking_n;
wire    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_int_blocking_n;
wire   [2:0] select_ln3081_fu_276_p3;
reg   [2:0] ap_phi_mux_pos_phi_fu_100_p8;
wire   [2:0] select_ln3067_fu_265_p3;
wire   [2:0] select_ln3053_fu_254_p3;
wire   [2:0] select_ln3039_fu_243_p3;
reg   [3:0] ap_phi_mux_block_phi_fu_113_p8;
wire   [5:0] sub_ln3102_fu_352_p2;
reg   [5:0] ap_phi_mux_phi_ln3105_phi_fu_131_p4;
reg   [5:0] phi_ln3105_reg_127;
wire    ap_CS_fsm_state8;
reg   [15:0] ap_phi_mux_retval_0_phi_fu_142_p4;
reg   [15:0] retval_0_reg_138;
reg    grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start_reg;
reg   [2:0] tmp_8_loc_fu_74;
reg    grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start_reg;
reg   [2:0] tmp_9_loc_fu_70;
reg    grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start_reg;
reg   [2:0] tmp_11_loc_fu_66;
reg    grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start_reg;
reg   [2:0] tmp_10_loc_fu_62;
wire   [63:0] zext_ln3101_fu_344_p1;
wire   [4:0] zext_ln3023_1_fu_288_p1;
wire   [4:0] zext_ln3023_fu_284_p1;
wire   [4:0] add_ln3097_fu_303_p2;
wire  signed [31:0] sext_ln3097_fu_308_p1;
wire   [31:0] shl_ln3097_fu_312_p2;
wire   [0:0] icmp_ln3096_fu_298_p2;
wire   [10:0] tmp_s_fu_317_p4;
wire   [10:0] tmp_1_fu_327_p4;
wire   [10:0] select_ln3096_fu_336_p3;
wire   [5:0] zext_ln3102_fu_349_p1;
wire   [31:0] zext_ln3105_fu_359_p1;
wire   [7:0] zext_ln3105_1_fu_363_p1;
reg   [31:0] ap_return_0_preg;
reg   [7:0] ap_return_1_preg;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
reg    ap_ext_blocking_sub_n;
reg    ap_wait_0;
reg    ap_sub_ext_blocking_0;
reg    ap_wait_1;
reg    ap_sub_ext_blocking_1;
reg    ap_wait_2;
reg    ap_sub_ext_blocking_2;
reg    ap_wait_3;
reg    ap_sub_ext_blocking_3;
reg    ap_str_blocking_sub_n;
reg    ap_sub_str_blocking_0;
reg    ap_sub_str_blocking_1;
reg    ap_sub_str_blocking_2;
reg    ap_sub_str_blocking_3;
reg    ap_int_blocking_sub_n;
reg    ap_sub_int_blocking_0;
reg    ap_sub_int_blocking_1;
reg    ap_sub_int_blocking_2;
reg    ap_sub_int_blocking_3;
reg    ap_condition_166;
reg    ap_condition_170;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start_reg = 1'b0;
#0 grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start_reg = 1'b0;
#0 grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start_reg = 1'b0;
#0 grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start_reg = 1'b0;
#0 ap_return_0_preg = 32'd0;
#0 ap_return_1_preg = 8'd0;
end

mean_shift_accel_Inverse_xf_cv_division_lut #(
    .DataWidth( 16 ),
    .AddressRange( 2049 ),
    .AddressWidth( 12 ))
xf_cv_division_lut_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(xf_cv_division_lut_address0),
    .ce0(xf_cv_division_lut_ce0),
    .q0(xf_cv_division_lut_q0)
);

mean_shift_accel_Inverse_Pipeline_VITIS_LOOP_3039_1 grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start),
    .ap_done(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_done),
    .ap_idle(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_idle),
    .ap_ready(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_ready),
    .zext_ln3036(trunc_ln_reg_418),
    .tmp_8_out(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_tmp_8_out),
    .tmp_8_out_ap_vld(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_tmp_8_out_ap_vld),
    .ap_return(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_return),
    .ap_ext_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_ext_blocking_n),
    .ap_str_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_str_blocking_n),
    .ap_int_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_int_blocking_n)
);

mean_shift_accel_Inverse_Pipeline_VITIS_LOOP_3053_2 grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start),
    .ap_done(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_done),
    .ap_idle(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_idle),
    .ap_ready(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_ready),
    .tmpx_8(tmpx_3_reg_423),
    .tmp_9_out(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_tmp_9_out),
    .tmp_9_out_ap_vld(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_tmp_9_out_ap_vld),
    .ap_return(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_return),
    .ap_ext_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_ext_blocking_n),
    .ap_str_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_str_blocking_n),
    .ap_int_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_int_blocking_n)
);

mean_shift_accel_Inverse_Pipeline_VITIS_LOOP_3067_3 grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start),
    .ap_done(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_done),
    .ap_idle(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_idle),
    .ap_ready(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_ready),
    .tmpx_9(tmpx_4_reg_428),
    .tmp_11_out(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_tmp_11_out),
    .tmp_11_out_ap_vld(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_tmp_11_out_ap_vld),
    .ap_return(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_return),
    .ap_ext_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_ext_blocking_n),
    .ap_str_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_str_blocking_n),
    .ap_int_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_int_blocking_n)
);

mean_shift_accel_Inverse_Pipeline_VITIS_LOOP_3081_4 grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start),
    .ap_done(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_done),
    .ap_idle(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_idle),
    .ap_ready(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_ready),
    .tmpx_7(tmpx_reg_408),
    .tmp_10_out(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_tmp_10_out),
    .tmp_10_out_ap_vld(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_tmp_10_out_ap_vld),
    .ap_return(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_return),
    .ap_ext_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_ext_blocking_n),
    .ap_str_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_str_blocking_n),
    .ap_int_blocking_n(grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_int_blocking_n)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
                ap_return_0_preg[0] <= 1'b0;
        ap_return_0_preg[1] <= 1'b0;
        ap_return_0_preg[2] <= 1'b0;
        ap_return_0_preg[3] <= 1'b0;
        ap_return_0_preg[4] <= 1'b0;
        ap_return_0_preg[5] <= 1'b0;
        ap_return_0_preg[6] <= 1'b0;
        ap_return_0_preg[7] <= 1'b0;
        ap_return_0_preg[8] <= 1'b0;
        ap_return_0_preg[9] <= 1'b0;
        ap_return_0_preg[10] <= 1'b0;
        ap_return_0_preg[11] <= 1'b0;
        ap_return_0_preg[12] <= 1'b0;
        ap_return_0_preg[13] <= 1'b0;
        ap_return_0_preg[14] <= 1'b0;
        ap_return_0_preg[15] <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
                        ap_return_0_preg[15 : 0] <= zext_ln3105_fu_359_p1[15 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
                ap_return_1_preg[0] <= 1'b0;
        ap_return_1_preg[1] <= 1'b0;
        ap_return_1_preg[2] <= 1'b0;
        ap_return_1_preg[3] <= 1'b0;
        ap_return_1_preg[4] <= 1'b0;
        ap_return_1_preg[5] <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
                        ap_return_1_preg[5 : 0] <= zext_ln3105_1_fu_363_p1[5 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln3036_fu_222_p2 == 1'd0) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start_reg <= 1'b1;
        end else if ((grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_ready == 1'b1)) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln3050_fu_228_p2 == 1'd0) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start_reg <= 1'b1;
        end else if ((grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_ready == 1'b1)) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln3064_fu_234_p2 == 1'd0) & (icmp_ln3050_fu_228_p2 == 1'd1) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start_reg <= 1'b1;
        end else if ((grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_ready == 1'b1)) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln3064_fu_234_p2 == 1'd1) & (icmp_ln3050_fu_228_p2 == 1'd1) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start_reg <= 1'b1;
        end else if ((grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_ready == 1'b1)) begin
            grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln3033_fu_216_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        retval_0_reg_138 <= 16'd65535;
    end else if (((icmp_ln3033_reg_433 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        retval_0_reg_138 <= xf_cv_division_lut_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        B_L_reg_454 <= B_L_fu_292_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln3033_reg_433 <= icmp_ln3033_fu_216_p2;
        tmpx_3_reg_423 <= {{x[11:8]}};
        tmpx_4_reg_428 <= {{x[7:4]}};
        tmpx_reg_408 <= tmpx_fu_174_p1;
        trunc_ln_reg_418 <= {{x[14:12]}};
        zext_ln3026_reg_413[14 : 0] <= zext_ln3026_fu_179_p1[14 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        icmp_ln3036_reg_437 <= icmp_ln3036_fu_222_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        icmp_ln3050_reg_441 <= icmp_ln3050_fu_228_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln3050_fu_228_p2 == 1'd1) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        icmp_ln3064_reg_445 <= icmp_ln3064_fu_234_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln3033_reg_433 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        phi_ln3105_reg_127 <= sub_ln3102_fu_352_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        targetBlock1_reg_461 <= grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        targetBlock2_reg_471 <= grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        targetBlock3_reg_466 <= grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        targetBlock_reg_449 <= grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state6) & (grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_tmp_10_out_ap_vld == 1'b1))) begin
        tmp_10_loc_fu_62 <= grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_tmp_10_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_tmp_11_out_ap_vld == 1'b1))) begin
        tmp_11_loc_fu_66 <= grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_tmp_11_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_tmp_8_out_ap_vld == 1'b1))) begin
        tmp_8_loc_fu_74 <= grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_tmp_8_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_tmp_9_out_ap_vld == 1'b1))) begin
        tmp_9_loc_fu_70 <= grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_tmp_9_out;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_wait_3 & ap_sub_ext_blocking_3) == 1'b1) & ((ap_wait_2 & ap_sub_ext_blocking_2) == 1'b1) & ((ap_wait_1 & ap_sub_ext_blocking_1) == 1'b1) & ((ap_wait_0 & ap_sub_ext_blocking_0) == 1'b1))) begin
        ap_ext_blocking_sub_n = 1'b0;
    end else begin
        ap_ext_blocking_sub_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_wait_3 & ap_sub_int_blocking_3) == 1'b1) & ((ap_wait_2 & ap_sub_int_blocking_2) == 1'b1) & ((ap_wait_1 & ap_sub_int_blocking_1) == 1'b1) & ((ap_wait_0 & ap_sub_int_blocking_0) == 1'b1))) begin
        ap_int_blocking_sub_n = 1'b0;
    end else begin
        ap_int_blocking_sub_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((icmp_ln3036_reg_437 == 1'd0)) begin
            ap_phi_mux_block_phi_fu_113_p8 = 4'd0;
        end else if (((icmp_ln3050_reg_441 == 1'd0) & (icmp_ln3036_reg_437 == 1'd1))) begin
            ap_phi_mux_block_phi_fu_113_p8 = 4'd4;
        end else if ((1'b1 == ap_condition_170)) begin
            ap_phi_mux_block_phi_fu_113_p8 = 4'd8;
        end else if ((1'b1 == ap_condition_166)) begin
            ap_phi_mux_block_phi_fu_113_p8 = 4'd12;
        end else begin
            ap_phi_mux_block_phi_fu_113_p8 = 'bx;
        end
    end else begin
        ap_phi_mux_block_phi_fu_113_p8 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln3033_reg_433 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_phi_mux_phi_ln3105_phi_fu_131_p4 = sub_ln3102_fu_352_p2;
    end else begin
        ap_phi_mux_phi_ln3105_phi_fu_131_p4 = phi_ln3105_reg_127;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((icmp_ln3036_reg_437 == 1'd0)) begin
            ap_phi_mux_pos_phi_fu_100_p8 = select_ln3039_fu_243_p3;
        end else if (((icmp_ln3050_reg_441 == 1'd0) & (icmp_ln3036_reg_437 == 1'd1))) begin
            ap_phi_mux_pos_phi_fu_100_p8 = select_ln3053_fu_254_p3;
        end else if ((1'b1 == ap_condition_170)) begin
            ap_phi_mux_pos_phi_fu_100_p8 = select_ln3067_fu_265_p3;
        end else if ((1'b1 == ap_condition_166)) begin
            ap_phi_mux_pos_phi_fu_100_p8 = select_ln3081_fu_276_p3;
        end else begin
            ap_phi_mux_pos_phi_fu_100_p8 = 'bx;
        end
    end else begin
        ap_phi_mux_pos_phi_fu_100_p8 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln3033_reg_433 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_phi_mux_retval_0_phi_fu_142_p4 = xf_cv_division_lut_q0;
    end else begin
        ap_phi_mux_retval_0_phi_fu_142_p4 = retval_0_reg_138;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_return_0 = zext_ln3105_fu_359_p1;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_return_1 = zext_ln3105_1_fu_363_p1;
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((((ap_wait_3 & ap_sub_str_blocking_3) == 1'b1) & ((ap_wait_2 & ap_sub_str_blocking_2) == 1'b1) & ((ap_wait_1 & ap_sub_str_blocking_1) == 1'b1) & ((ap_wait_0 & ap_sub_str_blocking_0) == 1'b1))) begin
        ap_str_blocking_sub_n = 1'b0;
    end else begin
        ap_str_blocking_sub_n = 1'b1;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_ext_blocking_n == 1'b0)) begin
        ap_sub_ext_blocking_0 = 1'b1;
    end else begin
        ap_sub_ext_blocking_0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_ext_blocking_n == 1'b0)) begin
        ap_sub_ext_blocking_1 = 1'b1;
    end else begin
        ap_sub_ext_blocking_1 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_ext_blocking_n == 1'b0)) begin
        ap_sub_ext_blocking_2 = 1'b1;
    end else begin
        ap_sub_ext_blocking_2 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_ext_blocking_n == 1'b0)) begin
        ap_sub_ext_blocking_3 = 1'b1;
    end else begin
        ap_sub_ext_blocking_3 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_int_blocking_n == 1'b0)) begin
        ap_sub_int_blocking_0 = 1'b1;
    end else begin
        ap_sub_int_blocking_0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_int_blocking_n == 1'b0)) begin
        ap_sub_int_blocking_1 = 1'b1;
    end else begin
        ap_sub_int_blocking_1 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_int_blocking_n == 1'b0)) begin
        ap_sub_int_blocking_2 = 1'b1;
    end else begin
        ap_sub_int_blocking_2 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_int_blocking_n == 1'b0)) begin
        ap_sub_int_blocking_3 = 1'b1;
    end else begin
        ap_sub_int_blocking_3 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_str_blocking_n == 1'b0)) begin
        ap_sub_str_blocking_0 = 1'b1;
    end else begin
        ap_sub_str_blocking_0 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_str_blocking_n == 1'b0)) begin
        ap_sub_str_blocking_1 = 1'b1;
    end else begin
        ap_sub_str_blocking_1 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_str_blocking_n == 1'b0)) begin
        ap_sub_str_blocking_2 = 1'b1;
    end else begin
        ap_sub_str_blocking_2 = 1'b0;
    end
end

always @ (*) begin
    if ((grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_str_blocking_n == 1'b0)) begin
        ap_sub_str_blocking_3 = 1'b1;
    end else begin
        ap_sub_str_blocking_3 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_ST_fsm_state2 == ap_CS_fsm)) begin
        ap_wait_0 = 1'b1;
    end else begin
        ap_wait_0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_ST_fsm_state4 == ap_CS_fsm)) begin
        ap_wait_1 = 1'b1;
    end else begin
        ap_wait_1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_ST_fsm_state5 == ap_CS_fsm)) begin
        ap_wait_2 = 1'b1;
    end else begin
        ap_wait_2 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_ST_fsm_state6 == ap_CS_fsm)) begin
        ap_wait_3 = 1'b1;
    end else begin
        ap_wait_3 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        xf_cv_division_lut_ce0 = 1'b1;
    end else begin
        xf_cv_division_lut_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((icmp_ln3064_fu_234_p2 == 1'd1) & (icmp_ln3050_fu_228_p2 == 1'd1) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else if (((icmp_ln3064_fu_234_p2 == 1'd0) & (icmp_ln3050_fu_228_p2 == 1'd1) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if (((icmp_ln3050_fu_228_p2 == 1'd0) & (icmp_ln3036_fu_222_p2 == 1'd1) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if (((icmp_ln3036_fu_222_p2 == 1'd0) & (icmp_ln3033_fu_216_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((icmp_ln3033_fu_216_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign B_L_fu_292_p2 = (zext_ln3023_1_fu_288_p1 + zext_ln3023_fu_284_p1);

assign add_ln3097_fu_303_p2 = ($signed(B_L_reg_454) + $signed(5'd31));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_condition_166 = ((icmp_ln3064_reg_445 == 1'd1) & (icmp_ln3050_reg_441 == 1'd1) & (icmp_ln3036_reg_437 == 1'd1));
end

always @ (*) begin
    ap_condition_170 = ((icmp_ln3064_reg_445 == 1'd0) & (icmp_ln3050_reg_441 == 1'd1) & (icmp_ln3036_reg_437 == 1'd1));
end

assign ap_ext_blocking_n = (ap_ext_blocking_sub_n & 1'b1);

assign ap_int_blocking_n = (ap_int_blocking_sub_n & 1'b1);

assign ap_str_blocking_n = (ap_str_blocking_sub_n & 1'b1);

assign grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start = grp_Inverse_Pipeline_VITIS_LOOP_3039_1_fu_150_ap_start_reg;

assign grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start = grp_Inverse_Pipeline_VITIS_LOOP_3053_2_fu_156_ap_start_reg;

assign grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start = grp_Inverse_Pipeline_VITIS_LOOP_3067_3_fu_162_ap_start_reg;

assign grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start = grp_Inverse_Pipeline_VITIS_LOOP_3081_4_fu_168_ap_start_reg;

assign icmp_ln3033_fu_216_p2 = ((x == 15'd0) ? 1'b1 : 1'b0);

assign icmp_ln3036_fu_222_p2 = ((trunc_ln_fu_183_p4 == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln3050_fu_228_p2 = ((tmpx_3_fu_194_p4 == 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln3064_fu_234_p2 = ((tmpx_4_fu_205_p4 == 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln3096_fu_298_p2 = ((B_L_reg_454 != 5'd0) ? 1'b1 : 1'b0);

assign select_ln3039_fu_243_p3 = ((targetBlock_reg_449[0:0] == 1'b1) ? 3'd0 : tmp_8_loc_fu_74);

assign select_ln3053_fu_254_p3 = ((targetBlock1_reg_461[0:0] == 1'b1) ? 3'd0 : tmp_9_loc_fu_70);

assign select_ln3067_fu_265_p3 = ((targetBlock3_reg_466[0:0] == 1'b1) ? 3'd0 : tmp_11_loc_fu_66);

assign select_ln3081_fu_276_p3 = ((targetBlock2_reg_471[0:0] == 1'b1) ? 3'd0 : tmp_10_loc_fu_62);

assign select_ln3096_fu_336_p3 = ((icmp_ln3096_fu_298_p2[0:0] == 1'b1) ? tmp_s_fu_317_p4 : tmp_1_fu_327_p4);

assign sext_ln3097_fu_308_p1 = $signed(add_ln3097_fu_303_p2);

assign shl_ln3097_fu_312_p2 = zext_ln3026_reg_413 << sext_ln3097_fu_308_p1;

assign sub_ln3102_fu_352_p2 = ($signed(6'd32) - $signed(zext_ln3102_fu_349_p1));

assign tmp_1_fu_327_p4 = {{x[14:4]}};

assign tmp_s_fu_317_p4 = {{shl_ln3097_fu_312_p2[14:4]}};

assign tmpx_3_fu_194_p4 = {{x[11:8]}};

assign tmpx_4_fu_205_p4 = {{x[7:4]}};

assign tmpx_fu_174_p1 = x[3:0];

assign trunc_ln_fu_183_p4 = {{x[14:12]}};

assign xf_cv_division_lut_address0 = zext_ln3101_fu_344_p1;

assign zext_ln3023_1_fu_288_p1 = ap_phi_mux_block_phi_fu_113_p8;

assign zext_ln3023_fu_284_p1 = ap_phi_mux_pos_phi_fu_100_p8;

assign zext_ln3026_fu_179_p1 = x;

assign zext_ln3101_fu_344_p1 = select_ln3096_fu_336_p3;

assign zext_ln3102_fu_349_p1 = B_L_reg_454;

assign zext_ln3105_1_fu_363_p1 = ap_phi_mux_phi_ln3105_phi_fu_131_p4;

assign zext_ln3105_fu_359_p1 = ap_phi_mux_retval_0_phi_fu_142_p4;

always @ (posedge ap_clk) begin
    zext_ln3026_reg_413[31:15] <= 17'b00000000000000000;
    ap_return_0_preg[31:16] <= 16'b0000000000000000;
    ap_return_1_preg[7:6] <= 2'b00;
end

endmodule //mean_shift_accel_Inverse