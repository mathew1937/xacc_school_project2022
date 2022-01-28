// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mean_shift_accel_xFTrackmulHist_550_299_598_1_9_unsigned_int_unsigned_short_Pipeline_loop_hist_init (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        tmp_hist1_address0,
        tmp_hist1_ce0,
        tmp_hist1_we0,
        tmp_hist1_d0,
        tmp_hist2_address0,
        tmp_hist2_ce0,
        tmp_hist2_we0,
        tmp_hist2_d0,
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
output  [8:0] tmp_hist1_address0;
output   tmp_hist1_ce0;
output   tmp_hist1_we0;
output  [31:0] tmp_hist1_d0;
output  [8:0] tmp_hist2_address0;
output   tmp_hist2_ce0;
output   tmp_hist2_we0;
output  [31:0] tmp_hist2_d0;
output   ap_ext_blocking_n;
output   ap_str_blocking_n;
output   ap_int_blocking_n;

reg ap_idle;
reg tmp_hist1_ce0;
reg tmp_hist1_we0;
reg tmp_hist2_ce0;
reg tmp_hist2_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln226_fu_70_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [63:0] zext_ln227_fu_82_p1;
reg   [9:0] i_fu_30;
wire    ap_loop_init;
reg   [9:0] ap_sig_allocacmp_i_3;
wire   [9:0] i_4_fu_76_p2;
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
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln226_fu_70_p2 == 1'd0)) begin
            i_fu_30 <= i_4_fu_76_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_30 <= 10'd0;
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
    if (((ap_start_int == 1'b1) & (icmp_ln226_fu_70_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_3 = 10'd0;
    end else begin
        ap_sig_allocacmp_i_3 = i_fu_30;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_hist1_ce0 = 1'b1;
    end else begin
        tmp_hist1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln226_fu_70_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_hist1_we0 = 1'b1;
    end else begin
        tmp_hist1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_hist2_ce0 = 1'b1;
    end else begin
        tmp_hist2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln226_fu_70_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_hist2_we0 = 1'b1;
    end else begin
        tmp_hist2_we0 = 1'b0;
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

assign i_4_fu_76_p2 = (ap_sig_allocacmp_i_3 + 10'd1);

assign icmp_ln226_fu_70_p2 = ((ap_sig_allocacmp_i_3 == 10'd512) ? 1'b1 : 1'b0);

assign tmp_hist1_address0 = zext_ln227_fu_82_p1;

assign tmp_hist1_d0 = 32'd0;

assign tmp_hist2_address0 = zext_ln227_fu_82_p1;

assign tmp_hist2_d0 = 32'd0;

assign zext_ln227_fu_82_p1 = ap_sig_allocacmp_i_3;

endmodule //mean_shift_accel_xFTrackmulHist_550_299_598_1_9_unsigned_int_unsigned_short_Pipeline_loop_hist_init