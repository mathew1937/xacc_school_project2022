// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mean_shift_accel_Inverse_Pipeline_VITIS_LOOP_3053_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        tmpx_8,
        tmp_9_out,
        tmp_9_out_ap_vld,
        ap_return,
        ap_ext_blocking_n,
        ap_str_blocking_n,
        ap_int_blocking_n
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [3:0] tmpx_8;
output  [2:0] tmp_9_out;
output   tmp_9_out_ap_vld;
output  [0:0] ap_return;
output   ap_ext_blocking_n;
output   ap_str_blocking_n;
output   ap_int_blocking_n;

reg ap_idle;
reg[2:0] tmp_9_out;
reg tmp_9_out_ap_vld;
reg[0:0] ap_return;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln3059_fu_112_p2;
wire   [0:0] icmp_ln3053_fu_79_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [0:0] ap_phi_mux_UnifiedRetVal_phi_fu_63_p4;
reg   [2:0] tmp_1_fu_42;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_tmp;
wire   [2:0] tmp_10_fu_85_p2;
wire   [1:0] trunc_ln3053_fu_92_p1;
wire   [1:0] xor_ln3058_fu_96_p2;
wire   [3:0] zext_ln3058_fu_102_p1;
wire   [3:0] tmpx_fu_106_p2;
reg   [0:0] ap_return_preg;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_return_preg = 1'd0;
#0 ap_done_reg = 1'b0;
end

mean_shift_accel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 1'd0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1) & ((icmp_ln3053_fu_79_p2 == 1'd1) | (icmp_ln3059_fu_112_p2 == 1'd0)))) begin
            ap_return_preg <= ap_phi_mux_UnifiedRetVal_phi_fu_63_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if (((icmp_ln3053_fu_79_p2 == 1'd0) & (icmp_ln3059_fu_112_p2 == 1'd1))) begin
            tmp_1_fu_42 <= tmp_10_fu_85_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            tmp_1_fu_42 <= 3'd0;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1) & ((icmp_ln3053_fu_79_p2 == 1'd1) | (icmp_ln3059_fu_112_p2 == 1'd0)))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if (((icmp_ln3053_fu_79_p2 == 1'd0) & (icmp_ln3059_fu_112_p2 == 1'd0))) begin
            ap_phi_mux_UnifiedRetVal_phi_fu_63_p4 = 1'd0;
        end else if ((icmp_ln3053_fu_79_p2 == 1'd1)) begin
            ap_phi_mux_UnifiedRetVal_phi_fu_63_p4 = 1'd1;
        end else begin
            ap_phi_mux_UnifiedRetVal_phi_fu_63_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_UnifiedRetVal_phi_fu_63_p4 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1) & ((icmp_ln3053_fu_79_p2 == 1'd1) | (icmp_ln3059_fu_112_p2 == 1'd0)))) begin
        ap_return = ap_phi_mux_UnifiedRetVal_phi_fu_63_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_tmp = 3'd0;
    end else begin
        ap_sig_allocacmp_tmp = tmp_1_fu_42;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((icmp_ln3053_fu_79_p2 == 1'd1)) begin
            tmp_9_out = 3'd5;
        end else if (((icmp_ln3053_fu_79_p2 == 1'd0) & (icmp_ln3059_fu_112_p2 == 1'd0))) begin
            tmp_9_out = tmp_10_fu_85_p2;
        end else begin
            tmp_9_out = 'bx;
        end
    end else begin
        tmp_9_out = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln3053_fu_79_p2 == 1'd0) & (icmp_ln3059_fu_112_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((icmp_ln3053_fu_79_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        tmp_9_out_ap_vld = 1'b1;
    end else begin
        tmp_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_ext_blocking_n = (1'b1 & 1'b1);

assign ap_int_blocking_n = (1'b1 & 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_str_blocking_n = (1'b1 & 1'b1);

assign icmp_ln3053_fu_79_p2 = ((ap_sig_allocacmp_tmp == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln3059_fu_112_p2 = ((tmpx_fu_106_p2 == 4'd0) ? 1'b1 : 1'b0);

assign tmp_10_fu_85_p2 = (ap_sig_allocacmp_tmp + 3'd1);

assign tmpx_fu_106_p2 = tmpx_8 >> zext_ln3058_fu_102_p1;

assign trunc_ln3053_fu_92_p1 = ap_sig_allocacmp_tmp[1:0];

assign xor_ln3058_fu_96_p2 = (trunc_ln3053_fu_92_p1 ^ 2'd3);

assign zext_ln3058_fu_102_p1 = xor_ln3058_fu_96_p2;

endmodule //mean_shift_accel_Inverse_Pipeline_VITIS_LOOP_3053_2
