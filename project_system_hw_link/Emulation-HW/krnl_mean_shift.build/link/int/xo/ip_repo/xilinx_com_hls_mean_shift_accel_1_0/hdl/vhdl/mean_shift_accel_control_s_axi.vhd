-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mean_shift_accel_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 8;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    img_inp               :out  STD_LOGIC_VECTOR(63 downto 0);
    tlx                   :out  STD_LOGIC_VECTOR(63 downto 0);
    tly                   :out  STD_LOGIC_VECTOR(63 downto 0);
    obj_height            :out  STD_LOGIC_VECTOR(63 downto 0);
    obj_width             :out  STD_LOGIC_VECTOR(63 downto 0);
    dx                    :out  STD_LOGIC_VECTOR(63 downto 0);
    dy                    :out  STD_LOGIC_VECTOR(63 downto 0);
    track                 :out  STD_LOGIC_VECTOR(63 downto 0);
    frame_status          :out  STD_LOGIC_VECTOR(7 downto 0);
    no_objects            :out  STD_LOGIC_VECTOR(7 downto 0);
    no_of_iterations      :out  STD_LOGIC_VECTOR(7 downto 0);
    rows                  :out  STD_LOGIC_VECTOR(31 downto 0);
    cols                  :out  STD_LOGIC_VECTOR(31 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_continue           :out  STD_LOGIC;
    ap_idle               :in   STD_LOGIC;
    event_start           :out  STD_LOGIC
);
end entity mean_shift_accel_control_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : Control signals
--        bit 0  - ap_start (Read/Write/COH)
--        bit 1  - ap_done (Read)
--        bit 2  - ap_idle (Read)
--        bit 3  - ap_ready (Read/COR)
--        bit 4  - ap_continue (Read/Write/SC)
--        bit 7  - auto_restart (Read/Write)
--        others - reserved
-- 0x04 : Global Interrupt Enable Register
--        bit 0  - Global Interrupt Enable (Read/Write)
--        others - reserved
-- 0x08 : IP Interrupt Enable Register (Read/Write)
--        bit 0  - enable ap_done interrupt (Read/Write)
--        bit 1  - enable ap_ready interrupt (Read/Write)
--        others - reserved
-- 0x0c : IP Interrupt Status Register (Read/TOW)
--        bit 0  - ap_done (COR/TOW)
--        bit 1  - ap_ready (COR/TOW)
--        others - reserved
-- 0x10 : Data signal of img_inp
--        bit 31~0 - img_inp[31:0] (Read/Write)
-- 0x14 : Data signal of img_inp
--        bit 31~0 - img_inp[63:32] (Read/Write)
-- 0x18 : reserved
-- 0x1c : Data signal of tlx
--        bit 31~0 - tlx[31:0] (Read/Write)
-- 0x20 : Data signal of tlx
--        bit 31~0 - tlx[63:32] (Read/Write)
-- 0x24 : reserved
-- 0x28 : Data signal of tly
--        bit 31~0 - tly[31:0] (Read/Write)
-- 0x2c : Data signal of tly
--        bit 31~0 - tly[63:32] (Read/Write)
-- 0x30 : reserved
-- 0x34 : Data signal of obj_height
--        bit 31~0 - obj_height[31:0] (Read/Write)
-- 0x38 : Data signal of obj_height
--        bit 31~0 - obj_height[63:32] (Read/Write)
-- 0x3c : reserved
-- 0x40 : Data signal of obj_width
--        bit 31~0 - obj_width[31:0] (Read/Write)
-- 0x44 : Data signal of obj_width
--        bit 31~0 - obj_width[63:32] (Read/Write)
-- 0x48 : reserved
-- 0x4c : Data signal of dx
--        bit 31~0 - dx[31:0] (Read/Write)
-- 0x50 : Data signal of dx
--        bit 31~0 - dx[63:32] (Read/Write)
-- 0x54 : reserved
-- 0x58 : Data signal of dy
--        bit 31~0 - dy[31:0] (Read/Write)
-- 0x5c : Data signal of dy
--        bit 31~0 - dy[63:32] (Read/Write)
-- 0x60 : reserved
-- 0x64 : Data signal of track
--        bit 31~0 - track[31:0] (Read/Write)
-- 0x68 : Data signal of track
--        bit 31~0 - track[63:32] (Read/Write)
-- 0x6c : reserved
-- 0x70 : Data signal of frame_status
--        bit 7~0 - frame_status[7:0] (Read/Write)
--        others  - reserved
-- 0x74 : reserved
-- 0x78 : Data signal of no_objects
--        bit 7~0 - no_objects[7:0] (Read/Write)
--        others  - reserved
-- 0x7c : reserved
-- 0x80 : Data signal of no_of_iterations
--        bit 7~0 - no_of_iterations[7:0] (Read/Write)
--        others  - reserved
-- 0x84 : reserved
-- 0x88 : Data signal of rows
--        bit 31~0 - rows[31:0] (Read/Write)
-- 0x8c : reserved
-- 0x90 : Data signal of cols
--        bit 31~0 - cols[31:0] (Read/Write)
-- 0x94 : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of mean_shift_accel_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL                 : INTEGER := 16#00#;
    constant ADDR_GIE                     : INTEGER := 16#04#;
    constant ADDR_IER                     : INTEGER := 16#08#;
    constant ADDR_ISR                     : INTEGER := 16#0c#;
    constant ADDR_IMG_INP_DATA_0          : INTEGER := 16#10#;
    constant ADDR_IMG_INP_DATA_1          : INTEGER := 16#14#;
    constant ADDR_IMG_INP_CTRL            : INTEGER := 16#18#;
    constant ADDR_TLX_DATA_0              : INTEGER := 16#1c#;
    constant ADDR_TLX_DATA_1              : INTEGER := 16#20#;
    constant ADDR_TLX_CTRL                : INTEGER := 16#24#;
    constant ADDR_TLY_DATA_0              : INTEGER := 16#28#;
    constant ADDR_TLY_DATA_1              : INTEGER := 16#2c#;
    constant ADDR_TLY_CTRL                : INTEGER := 16#30#;
    constant ADDR_OBJ_HEIGHT_DATA_0       : INTEGER := 16#34#;
    constant ADDR_OBJ_HEIGHT_DATA_1       : INTEGER := 16#38#;
    constant ADDR_OBJ_HEIGHT_CTRL         : INTEGER := 16#3c#;
    constant ADDR_OBJ_WIDTH_DATA_0        : INTEGER := 16#40#;
    constant ADDR_OBJ_WIDTH_DATA_1        : INTEGER := 16#44#;
    constant ADDR_OBJ_WIDTH_CTRL          : INTEGER := 16#48#;
    constant ADDR_DX_DATA_0               : INTEGER := 16#4c#;
    constant ADDR_DX_DATA_1               : INTEGER := 16#50#;
    constant ADDR_DX_CTRL                 : INTEGER := 16#54#;
    constant ADDR_DY_DATA_0               : INTEGER := 16#58#;
    constant ADDR_DY_DATA_1               : INTEGER := 16#5c#;
    constant ADDR_DY_CTRL                 : INTEGER := 16#60#;
    constant ADDR_TRACK_DATA_0            : INTEGER := 16#64#;
    constant ADDR_TRACK_DATA_1            : INTEGER := 16#68#;
    constant ADDR_TRACK_CTRL              : INTEGER := 16#6c#;
    constant ADDR_FRAME_STATUS_DATA_0     : INTEGER := 16#70#;
    constant ADDR_FRAME_STATUS_CTRL       : INTEGER := 16#74#;
    constant ADDR_NO_OBJECTS_DATA_0       : INTEGER := 16#78#;
    constant ADDR_NO_OBJECTS_CTRL         : INTEGER := 16#7c#;
    constant ADDR_NO_OF_ITERATIONS_DATA_0 : INTEGER := 16#80#;
    constant ADDR_NO_OF_ITERATIONS_CTRL   : INTEGER := 16#84#;
    constant ADDR_ROWS_DATA_0             : INTEGER := 16#88#;
    constant ADDR_ROWS_CTRL               : INTEGER := 16#8c#;
    constant ADDR_COLS_DATA_0             : INTEGER := 16#90#;
    constant ADDR_COLS_CTRL               : INTEGER := 16#94#;
    constant ADDR_BITS         : INTEGER := 8;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_event_start     : STD_LOGIC := '0';
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_continue     : STD_LOGIC;
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC := '0';
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_img_inp         : UNSIGNED(63 downto 0) := (others => '0');
    signal int_tlx             : UNSIGNED(63 downto 0) := (others => '0');
    signal int_tly             : UNSIGNED(63 downto 0) := (others => '0');
    signal int_obj_height      : UNSIGNED(63 downto 0) := (others => '0');
    signal int_obj_width       : UNSIGNED(63 downto 0) := (others => '0');
    signal int_dx              : UNSIGNED(63 downto 0) := (others => '0');
    signal int_dy              : UNSIGNED(63 downto 0) := (others => '0');
    signal int_track           : UNSIGNED(63 downto 0) := (others => '0');
    signal int_frame_status    : UNSIGNED(7 downto 0) := (others => '0');
    signal int_no_objects      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_no_of_iterations : UNSIGNED(7 downto 0) := (others => '0');
    signal int_rows            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_cols            : UNSIGNED(31 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(4) <= int_ap_continue;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when ADDR_IMG_INP_DATA_0 =>
                        rdata_data <= RESIZE(int_img_inp(31 downto 0), 32);
                    when ADDR_IMG_INP_DATA_1 =>
                        rdata_data <= RESIZE(int_img_inp(63 downto 32), 32);
                    when ADDR_TLX_DATA_0 =>
                        rdata_data <= RESIZE(int_tlx(31 downto 0), 32);
                    when ADDR_TLX_DATA_1 =>
                        rdata_data <= RESIZE(int_tlx(63 downto 32), 32);
                    when ADDR_TLY_DATA_0 =>
                        rdata_data <= RESIZE(int_tly(31 downto 0), 32);
                    when ADDR_TLY_DATA_1 =>
                        rdata_data <= RESIZE(int_tly(63 downto 32), 32);
                    when ADDR_OBJ_HEIGHT_DATA_0 =>
                        rdata_data <= RESIZE(int_obj_height(31 downto 0), 32);
                    when ADDR_OBJ_HEIGHT_DATA_1 =>
                        rdata_data <= RESIZE(int_obj_height(63 downto 32), 32);
                    when ADDR_OBJ_WIDTH_DATA_0 =>
                        rdata_data <= RESIZE(int_obj_width(31 downto 0), 32);
                    when ADDR_OBJ_WIDTH_DATA_1 =>
                        rdata_data <= RESIZE(int_obj_width(63 downto 32), 32);
                    when ADDR_DX_DATA_0 =>
                        rdata_data <= RESIZE(int_dx(31 downto 0), 32);
                    when ADDR_DX_DATA_1 =>
                        rdata_data <= RESIZE(int_dx(63 downto 32), 32);
                    when ADDR_DY_DATA_0 =>
                        rdata_data <= RESIZE(int_dy(31 downto 0), 32);
                    when ADDR_DY_DATA_1 =>
                        rdata_data <= RESIZE(int_dy(63 downto 32), 32);
                    when ADDR_TRACK_DATA_0 =>
                        rdata_data <= RESIZE(int_track(31 downto 0), 32);
                    when ADDR_TRACK_DATA_1 =>
                        rdata_data <= RESIZE(int_track(63 downto 32), 32);
                    when ADDR_FRAME_STATUS_DATA_0 =>
                        rdata_data <= RESIZE(int_frame_status(7 downto 0), 32);
                    when ADDR_NO_OBJECTS_DATA_0 =>
                        rdata_data <= RESIZE(int_no_objects(7 downto 0), 32);
                    when ADDR_NO_OF_ITERATIONS_DATA_0 =>
                        rdata_data <= RESIZE(int_no_of_iterations(7 downto 0), 32);
                    when ADDR_ROWS_DATA_0 =>
                        rdata_data <= RESIZE(int_rows(31 downto 0), 32);
                    when ADDR_COLS_DATA_0 =>
                        rdata_data <= RESIZE(int_cols(31 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_gie and (int_isr(0) or int_isr(1));
    event_start          <= int_event_start;
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    ap_continue          <= int_ap_continue or auto_restart_status;
    img_inp              <= STD_LOGIC_VECTOR(int_img_inp);
    tlx                  <= STD_LOGIC_VECTOR(int_tlx);
    tly                  <= STD_LOGIC_VECTOR(int_tly);
    obj_height           <= STD_LOGIC_VECTOR(int_obj_height);
    obj_width            <= STD_LOGIC_VECTOR(int_obj_width);
    dx                   <= STD_LOGIC_VECTOR(int_dx);
    dy                   <= STD_LOGIC_VECTOR(int_dy);
    track                <= STD_LOGIC_VECTOR(int_track);
    frame_status         <= STD_LOGIC_VECTOR(int_frame_status);
    no_objects           <= STD_LOGIC_VECTOR(int_no_objects);
    no_of_iterations     <= STD_LOGIC_VECTOR(int_no_of_iterations);
    rows                 <= STD_LOGIC_VECTOR(int_rows);
    cols                 <= STD_LOGIC_VECTOR(int_cols);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_event_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_event_start <= '1';
                else
                    int_event_start <= '0'; -- self clear
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_task_ap_done <= task_ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_continue <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(4) = '1') then
                    int_ap_continue <= '1';
                else
                    int_ap_continue <= '0'; -- self clear
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_done <= '0';
            elsif (ACLK_EN = '1') then
                if (auto_restart_status = '1' and (ap_idle = '1' and int_ap_idle = '0')) then
                    auto_restart_done <= '1';
                elsif (int_ap_continue = '1') then
                    auto_restart_done <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IMG_INP_DATA_0) then
                    int_img_inp(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_img_inp(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IMG_INP_DATA_1) then
                    int_img_inp(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_img_inp(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TLX_DATA_0) then
                    int_tlx(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_tlx(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TLX_DATA_1) then
                    int_tlx(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_tlx(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TLY_DATA_0) then
                    int_tly(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_tly(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TLY_DATA_1) then
                    int_tly(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_tly(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OBJ_HEIGHT_DATA_0) then
                    int_obj_height(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_obj_height(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OBJ_HEIGHT_DATA_1) then
                    int_obj_height(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_obj_height(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OBJ_WIDTH_DATA_0) then
                    int_obj_width(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_obj_width(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OBJ_WIDTH_DATA_1) then
                    int_obj_width(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_obj_width(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DX_DATA_0) then
                    int_dx(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dx(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DX_DATA_1) then
                    int_dx(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dx(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DY_DATA_0) then
                    int_dy(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dy(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DY_DATA_1) then
                    int_dy(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dy(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TRACK_DATA_0) then
                    int_track(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_track(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TRACK_DATA_1) then
                    int_track(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_track(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_FRAME_STATUS_DATA_0) then
                    int_frame_status(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_frame_status(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NO_OBJECTS_DATA_0) then
                    int_no_objects(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_no_objects(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NO_OF_ITERATIONS_DATA_0) then
                    int_no_of_iterations(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_no_of_iterations(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ROWS_DATA_0) then
                    int_rows(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_rows(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COLS_DATA_0) then
                    int_cols(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_cols(31 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
