--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:20 10/13/2018
-- Design Name:   
-- Module Name:   C:/Users/eduar/OneDrive/Documents/Tutoriais_Blog/FPGA/Leitura_Encoder_e_Display_7_Segmentos/Test_Bench_BCD_converter.vhd
-- Project Name:  Leitura_Encoder_e_Display_7_Segmentos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD_converter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Bench_BCD_converter IS
END Test_Bench_BCD_converter;
 
ARCHITECTURE behavior OF Test_Bench_BCD_converter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD_converter
    PORT(
			clk	: in std_logic;	
         binIN : IN  std_logic_vector(12 downto 0);
         milhar : OUT  std_logic_vector(3 downto 0);
         centenas : OUT  std_logic_vector(3 downto 0);
         dezenas : OUT  std_logic_vector(3 downto 0);
         unidades : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal binIN : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal milhar : std_logic_vector(3 downto 0);
   signal centenas : std_logic_vector(3 downto 0);
   signal dezenas : std_logic_vector(3 downto 0);
   signal unidades : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD_converter PORT MAP (
          binIN => binIN,
          milhar => milhar,
          centenas => centenas,
          dezenas => dezenas,
          unidades => unidades
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		binIN <= binIN + '1';
		wait for 10 ns;	
      --wait;
   end process;

END;
