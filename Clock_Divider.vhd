----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs	
-- Engineer: 		Eduardo Avelar	
-- Create Date:   14:46:31 04/12/2017 
-- Design Name: 	Leitura de Encoder e Display
-- Module Name:   Clock_Divider - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Clock_Divider is
    Port ( 
			clk 		: in  STD_LOGIC;
         enable 	: in  STD_LOGIC;
         reset 	: in  STD_LOGIC;
         data_clk : out  STD_LOGIC_VECTOR (15 downto 0)
			);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

begin
	-- Processo que � sensitivo ao clock e ao sinal de reset
	process(clk, reset)
	
	-- declara uma vari�vel de 16 bits que incrementa em cada ciclo de clock
	variable count : std_logic_vector (15 downto 0):= (others =>'0');
	begin
		-- Se a entrada Reset for 1, o contador deve ser zerado
		if reset ='1' then
			count := (others =>'0');
			
		-- Se o enable � 1 e h� um evento no sinal de clock para 1
		elsif enable = '1' and clk'event and clk = '1' then
			count := count + 1; 		-- Incrementa o contador
		end if;
		
		data_clk <= count; 			-- A vari�vel count � passada para a sa�da de clock

	end process;

end Behavioral;

