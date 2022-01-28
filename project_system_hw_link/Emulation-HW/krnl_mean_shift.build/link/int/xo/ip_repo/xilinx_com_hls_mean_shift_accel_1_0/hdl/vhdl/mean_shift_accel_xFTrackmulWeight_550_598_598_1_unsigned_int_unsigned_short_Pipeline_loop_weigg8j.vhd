-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity mean_shift_accel_xFTrackmulWeight_550_598_598_1_unsigned_int_unsigned_short_Pipeline_loop_weigg8j is 
    generic(
             DataWidth     : integer := 4; 
             AddressWidth     : integer := 7; 
             AddressRange    : integer := 100
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of mean_shift_accel_xFTrackmulWeight_550_598_598_1_unsigned_int_unsigned_short_Pipeline_loop_weigg8j is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "0000", 1 to 3=> "0001", 4 to 8=> "0010", 9 to 15=> "0011", 16 to 24=> "0100", 
    25 to 35=> "0101", 36 to 48=> "0110", 49 to 63=> "0111", 64 to 80=> "1000", 81 to 99=> "1001" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(address0_tmp)); 
        end if;
    end if;
end process;

end rtl;

