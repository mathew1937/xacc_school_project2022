// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module mean_shift_accel_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [63:0]                   img_inp,
    output wire [63:0]                   tlx,
    output wire [63:0]                   tly,
    output wire [63:0]                   obj_height,
    output wire [63:0]                   obj_width,
    output wire [63:0]                   dx,
    output wire [63:0]                   dy,
    output wire [63:0]                   track,
    output wire [7:0]                    frame_status,
    output wire [7:0]                    no_objects,
    output wire [7:0]                    no_of_iterations,
    output wire [31:0]                   rows,
    output wire [31:0]                   cols,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    output wire                          ap_continue,
    input  wire                          ap_idle,
    output wire                          event_start
);
//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of img_inp
//        bit 31~0 - img_inp[31:0] (Read/Write)
// 0x14 : Data signal of img_inp
//        bit 31~0 - img_inp[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of tlx
//        bit 31~0 - tlx[31:0] (Read/Write)
// 0x20 : Data signal of tlx
//        bit 31~0 - tlx[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of tly
//        bit 31~0 - tly[31:0] (Read/Write)
// 0x2c : Data signal of tly
//        bit 31~0 - tly[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of obj_height
//        bit 31~0 - obj_height[31:0] (Read/Write)
// 0x38 : Data signal of obj_height
//        bit 31~0 - obj_height[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of obj_width
//        bit 31~0 - obj_width[31:0] (Read/Write)
// 0x44 : Data signal of obj_width
//        bit 31~0 - obj_width[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of dx
//        bit 31~0 - dx[31:0] (Read/Write)
// 0x50 : Data signal of dx
//        bit 31~0 - dx[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of dy
//        bit 31~0 - dy[31:0] (Read/Write)
// 0x5c : Data signal of dy
//        bit 31~0 - dy[63:32] (Read/Write)
// 0x60 : reserved
// 0x64 : Data signal of track
//        bit 31~0 - track[31:0] (Read/Write)
// 0x68 : Data signal of track
//        bit 31~0 - track[63:32] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of frame_status
//        bit 7~0 - frame_status[7:0] (Read/Write)
//        others  - reserved
// 0x74 : reserved
// 0x78 : Data signal of no_objects
//        bit 7~0 - no_objects[7:0] (Read/Write)
//        others  - reserved
// 0x7c : reserved
// 0x80 : Data signal of no_of_iterations
//        bit 7~0 - no_of_iterations[7:0] (Read/Write)
//        others  - reserved
// 0x84 : reserved
// 0x88 : Data signal of rows
//        bit 31~0 - rows[31:0] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of cols
//        bit 31~0 - cols[31:0] (Read/Write)
// 0x94 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL                 = 8'h00,
    ADDR_GIE                     = 8'h04,
    ADDR_IER                     = 8'h08,
    ADDR_ISR                     = 8'h0c,
    ADDR_IMG_INP_DATA_0          = 8'h10,
    ADDR_IMG_INP_DATA_1          = 8'h14,
    ADDR_IMG_INP_CTRL            = 8'h18,
    ADDR_TLX_DATA_0              = 8'h1c,
    ADDR_TLX_DATA_1              = 8'h20,
    ADDR_TLX_CTRL                = 8'h24,
    ADDR_TLY_DATA_0              = 8'h28,
    ADDR_TLY_DATA_1              = 8'h2c,
    ADDR_TLY_CTRL                = 8'h30,
    ADDR_OBJ_HEIGHT_DATA_0       = 8'h34,
    ADDR_OBJ_HEIGHT_DATA_1       = 8'h38,
    ADDR_OBJ_HEIGHT_CTRL         = 8'h3c,
    ADDR_OBJ_WIDTH_DATA_0        = 8'h40,
    ADDR_OBJ_WIDTH_DATA_1        = 8'h44,
    ADDR_OBJ_WIDTH_CTRL          = 8'h48,
    ADDR_DX_DATA_0               = 8'h4c,
    ADDR_DX_DATA_1               = 8'h50,
    ADDR_DX_CTRL                 = 8'h54,
    ADDR_DY_DATA_0               = 8'h58,
    ADDR_DY_DATA_1               = 8'h5c,
    ADDR_DY_CTRL                 = 8'h60,
    ADDR_TRACK_DATA_0            = 8'h64,
    ADDR_TRACK_DATA_1            = 8'h68,
    ADDR_TRACK_CTRL              = 8'h6c,
    ADDR_FRAME_STATUS_DATA_0     = 8'h70,
    ADDR_FRAME_STATUS_CTRL       = 8'h74,
    ADDR_NO_OBJECTS_DATA_0       = 8'h78,
    ADDR_NO_OBJECTS_CTRL         = 8'h7c,
    ADDR_NO_OF_ITERATIONS_DATA_0 = 8'h80,
    ADDR_NO_OF_ITERATIONS_CTRL   = 8'h84,
    ADDR_ROWS_DATA_0             = 8'h88,
    ADDR_ROWS_CTRL               = 8'h8c,
    ADDR_COLS_DATA_0             = 8'h90,
    ADDR_COLS_CTRL               = 8'h94,
    WRIDLE                       = 2'd0,
    WRDATA                       = 2'd1,
    WRRESP                       = 2'd2,
    WRRESET                      = 2'd3,
    RDIDLE                       = 2'd0,
    RDDATA                       = 2'd1,
    RDRESET                      = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_event_start = 1'b0;
    reg                           int_ap_idle;
    reg                           int_ap_continue;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    reg                           auto_restart_done = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [63:0]                   int_img_inp = 'b0;
    reg  [63:0]                   int_tlx = 'b0;
    reg  [63:0]                   int_tly = 'b0;
    reg  [63:0]                   int_obj_height = 'b0;
    reg  [63:0]                   int_obj_width = 'b0;
    reg  [63:0]                   int_dx = 'b0;
    reg  [63:0]                   int_dy = 'b0;
    reg  [63:0]                   int_track = 'b0;
    reg  [7:0]                    int_frame_status = 'b0;
    reg  [7:0]                    int_no_objects = 'b0;
    reg  [7:0]                    int_no_of_iterations = 'b0;
    reg  [31:0]                   int_rows = 'b0;
    reg  [31:0]                   int_cols = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[4] <= int_ap_continue;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_IMG_INP_DATA_0: begin
                    rdata <= int_img_inp[31:0];
                end
                ADDR_IMG_INP_DATA_1: begin
                    rdata <= int_img_inp[63:32];
                end
                ADDR_TLX_DATA_0: begin
                    rdata <= int_tlx[31:0];
                end
                ADDR_TLX_DATA_1: begin
                    rdata <= int_tlx[63:32];
                end
                ADDR_TLY_DATA_0: begin
                    rdata <= int_tly[31:0];
                end
                ADDR_TLY_DATA_1: begin
                    rdata <= int_tly[63:32];
                end
                ADDR_OBJ_HEIGHT_DATA_0: begin
                    rdata <= int_obj_height[31:0];
                end
                ADDR_OBJ_HEIGHT_DATA_1: begin
                    rdata <= int_obj_height[63:32];
                end
                ADDR_OBJ_WIDTH_DATA_0: begin
                    rdata <= int_obj_width[31:0];
                end
                ADDR_OBJ_WIDTH_DATA_1: begin
                    rdata <= int_obj_width[63:32];
                end
                ADDR_DX_DATA_0: begin
                    rdata <= int_dx[31:0];
                end
                ADDR_DX_DATA_1: begin
                    rdata <= int_dx[63:32];
                end
                ADDR_DY_DATA_0: begin
                    rdata <= int_dy[31:0];
                end
                ADDR_DY_DATA_1: begin
                    rdata <= int_dy[63:32];
                end
                ADDR_TRACK_DATA_0: begin
                    rdata <= int_track[31:0];
                end
                ADDR_TRACK_DATA_1: begin
                    rdata <= int_track[63:32];
                end
                ADDR_FRAME_STATUS_DATA_0: begin
                    rdata <= int_frame_status[7:0];
                end
                ADDR_NO_OBJECTS_DATA_0: begin
                    rdata <= int_no_objects[7:0];
                end
                ADDR_NO_OF_ITERATIONS_DATA_0: begin
                    rdata <= int_no_of_iterations[7:0];
                end
                ADDR_ROWS_DATA_0: begin
                    rdata <= int_rows[31:0];
                end
                ADDR_COLS_DATA_0: begin
                    rdata <= int_cols[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt        = int_gie & (|int_isr);
assign event_start      = int_event_start;
assign ap_start         = int_ap_start;
assign task_ap_done     = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready    = ap_ready && !int_auto_restart;
assign ap_continue      = int_ap_continue || auto_restart_status;
assign img_inp          = int_img_inp;
assign tlx              = int_tlx;
assign tly              = int_tly;
assign obj_height       = int_obj_height;
assign obj_width        = int_obj_width;
assign dx               = int_dx;
assign dy               = int_dy;
assign track            = int_track;
assign frame_status     = int_frame_status;
assign no_objects       = int_no_objects;
assign no_of_iterations = int_no_of_iterations;
assign rows             = int_rows;
assign cols             = int_cols;
// int_event_start
always @(posedge ACLK) begin
    if (ARESET)
        int_event_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_event_start <= 1'b1;
        else
            int_event_start <= 1'b0; // self clear
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_task_ap_done <= task_ap_done;
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_ap_continue
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_continue <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[4])
            int_ap_continue <= 1'b1;
        else
            int_ap_continue <= 1'b0; // self clear
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// auto_restart_done
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_done <= 1'b0;
    else if (ACLK_EN) begin
        if (auto_restart_status && (ap_idle && !int_ap_idle))
            auto_restart_done <= 1'b1;
        else if (int_ap_continue)
            auto_restart_done <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_img_inp[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_img_inp[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IMG_INP_DATA_0)
            int_img_inp[31:0] <= (WDATA[31:0] & wmask) | (int_img_inp[31:0] & ~wmask);
    end
end

// int_img_inp[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_img_inp[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IMG_INP_DATA_1)
            int_img_inp[63:32] <= (WDATA[31:0] & wmask) | (int_img_inp[63:32] & ~wmask);
    end
end

// int_tlx[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_tlx[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TLX_DATA_0)
            int_tlx[31:0] <= (WDATA[31:0] & wmask) | (int_tlx[31:0] & ~wmask);
    end
end

// int_tlx[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_tlx[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TLX_DATA_1)
            int_tlx[63:32] <= (WDATA[31:0] & wmask) | (int_tlx[63:32] & ~wmask);
    end
end

// int_tly[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_tly[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TLY_DATA_0)
            int_tly[31:0] <= (WDATA[31:0] & wmask) | (int_tly[31:0] & ~wmask);
    end
end

// int_tly[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_tly[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TLY_DATA_1)
            int_tly[63:32] <= (WDATA[31:0] & wmask) | (int_tly[63:32] & ~wmask);
    end
end

// int_obj_height[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_height[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OBJ_HEIGHT_DATA_0)
            int_obj_height[31:0] <= (WDATA[31:0] & wmask) | (int_obj_height[31:0] & ~wmask);
    end
end

// int_obj_height[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_height[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OBJ_HEIGHT_DATA_1)
            int_obj_height[63:32] <= (WDATA[31:0] & wmask) | (int_obj_height[63:32] & ~wmask);
    end
end

// int_obj_width[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_width[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OBJ_WIDTH_DATA_0)
            int_obj_width[31:0] <= (WDATA[31:0] & wmask) | (int_obj_width[31:0] & ~wmask);
    end
end

// int_obj_width[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_width[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OBJ_WIDTH_DATA_1)
            int_obj_width[63:32] <= (WDATA[31:0] & wmask) | (int_obj_width[63:32] & ~wmask);
    end
end

// int_dx[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dx[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DX_DATA_0)
            int_dx[31:0] <= (WDATA[31:0] & wmask) | (int_dx[31:0] & ~wmask);
    end
end

// int_dx[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_dx[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DX_DATA_1)
            int_dx[63:32] <= (WDATA[31:0] & wmask) | (int_dx[63:32] & ~wmask);
    end
end

// int_dy[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dy[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DY_DATA_0)
            int_dy[31:0] <= (WDATA[31:0] & wmask) | (int_dy[31:0] & ~wmask);
    end
end

// int_dy[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_dy[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DY_DATA_1)
            int_dy[63:32] <= (WDATA[31:0] & wmask) | (int_dy[63:32] & ~wmask);
    end
end

// int_track[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_track[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TRACK_DATA_0)
            int_track[31:0] <= (WDATA[31:0] & wmask) | (int_track[31:0] & ~wmask);
    end
end

// int_track[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_track[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TRACK_DATA_1)
            int_track[63:32] <= (WDATA[31:0] & wmask) | (int_track[63:32] & ~wmask);
    end
end

// int_frame_status[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_frame_status[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_FRAME_STATUS_DATA_0)
            int_frame_status[7:0] <= (WDATA[31:0] & wmask) | (int_frame_status[7:0] & ~wmask);
    end
end

// int_no_objects[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_no_objects[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NO_OBJECTS_DATA_0)
            int_no_objects[7:0] <= (WDATA[31:0] & wmask) | (int_no_objects[7:0] & ~wmask);
    end
end

// int_no_of_iterations[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_no_of_iterations[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NO_OF_ITERATIONS_DATA_0)
            int_no_of_iterations[7:0] <= (WDATA[31:0] & wmask) | (int_no_of_iterations[7:0] & ~wmask);
    end
end

// int_rows[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rows[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROWS_DATA_0)
            int_rows[31:0] <= (WDATA[31:0] & wmask) | (int_rows[31:0] & ~wmask);
    end
end

// int_cols[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_cols[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COLS_DATA_0)
            int_cols[31:0] <= (WDATA[31:0] & wmask) | (int_cols[31:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
