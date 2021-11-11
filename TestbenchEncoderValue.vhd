--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:31:58 10/25/2018
-- Design Name:   
-- Module Name:   C:/Users/eduar/OneDrive/Documents/Tutoriais_Blog/FPGA/Leitura_Encoder_e_Display_7_Segmentos/TestbenchEncoderValue.vhd
-- Project Name:  Leitura_Encoder_e_Display_7_Segmentos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Encoder_Rotativo_Teste
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
 
ENTITY TestbenchEncoderValue IS
END TestbenchEncoderValue;
 
ARCHITECTURE behavior OF TestbenchEncoderValue IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder_Rotativo_Teste
    PORT(
         rotary_a : IN  std_logic;
         rotary_b : IN  std_logic;
         reset_n : IN  std_logic;
         ena : IN  std_logic;
         rotate_counter_out : OUT  std_logic_vector(12 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rotary_a : std_logic := '0';
   signal rotary_b : std_logic := '0';
   signal reset_n : std_logic := '0';
   signal ena : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal rotate_counter_out : std_logic_vector(12 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder_Rotativo_Teste PORT MAP (
          rotary_a => rotary_a,
          rotary_b => rotary_b,
          reset_n => reset_n,
          ena => ena,
          rotate_counter_out => rotate_counter_out,
          clk => clk
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
      --wait for 100 ns;	

      --wait for clk_period*10;

      -- insert stimulus here 
		ena <= '1';
		reset_n <= '1';
		
		rotary_b <= '1';
		wait for 5 ns;
		rotary_a <= '1';
		wait for 5 ns;
		rotary_b <= '0';
		wait for 5 ns;
		rotary_a <= '0';
		wait for 5 ns;

      --wait;
   end process;

END;
