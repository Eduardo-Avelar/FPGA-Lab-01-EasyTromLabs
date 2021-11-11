----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs
-- Engineer: 		Eduardo Avelar
-- Create Date:   15:52:40 10/12/2018 
-- Design Name: 	Leitura de Encoder e Display
-- Module Name:   Encoder_Rotativo_Teste - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL;

entity Encoder_Rotativo_Teste is
    Port ( 	rotary_a 				: in  	STD_LOGIC;
				rotary_b 				: in  	STD_LOGIC;
				reset_n					: IN		STD_LOGIC;								-- Reset Assincrono - LOW
				ena						: IN		STD_LOGIC;								-- Habilita contagem
				rotate_counter_out	: out  	STD_LOGIC_VECTOR (12 downto 0);
				clk 						: in  	STD_LOGIC
			 );
end Encoder_Rotativo_Teste;

architecture Behavioral of Encoder_Rotativo_Teste is

-- Sinais utilizados para detectar o movimento do encoder
signal   rotary_a_in 		: std_logic;
signal   rotary_b_in 		: std_logic;
signal   rotary_in 			: std_logic_vector(1 downto 0);
signal   rotary_q1 			: std_logic;
signal   rotary_q2 			: std_logic;
signal   delay_rotary_q1 	: std_logic;
signal   delay_rotary_q2 	: std_logic;
signal   rotary_event 		: std_logic;
signal   rotary_right 		: std_logic;
signal   rotate_counter 	: std_logic_vector(12 downto 0) := (others =>'0');

begin

	rotary_filter: process(clk)
	 begin						
		if (clk'event and clk = '1')  then
			
		--Sincroniza a entrada do sinal no domínio do tempo.
			rotary_a_in <= rotary_a;
			rotary_b_in <= rotary_b;

		--Concatena os sinais de entrada para facilitar a comparação.
			rotary_in <= rotary_b_in & rotary_a_in;
			
		-- Testa os sinais de acordo com a concatenação acima processada
			case rotary_in is
				when "00" 		=> rotary_q1 <= '0';         
										rotary_q2 <= rotary_q2;											
				when "01" 		=> rotary_q1 <= rotary_q1;
										rotary_q2 <= '0';
				when "10" 		=> rotary_q1 <= rotary_q1;
										rotary_q2 <= '1';
				when "11" 		=> rotary_q1 <= '1';
										rotary_q2 <= rotary_q2;
				when others 	=> rotary_q1 <= rotary_q1;
										rotary_q2 <= rotary_q2;
			 end case;
		end if;
	end process rotary_filter;
	 -- Realiza um "pipeline" dos sinais Q1 e Q2, logo poderemos detectar qualquer mudanca de estado
	 -- Qualquer mudança é considerada um movimento de rotação do eixo.
	 --
	 -- A direção de rotação é indicado pelos sinais:
	 --    q1 mudando de Low para High quando q2 está em low
	 --       ou
	 --    q1 mudando de High para Low quando q2 está em high
	 --       ou
	 --    q2 mudando de Low para High quando q1 esta em high
	 --       ou
	 --    q2 mudando de High para Low quando q1 é Low
	 -- Resumindo, se nenhuma das situações acima forem verdadeiras então a rotação está para o sentido contrário

	 shaft_direction: process(clk)
	 begin
		if (clk'event and clk='1') then

		  delay_rotary_q1 <= rotary_q1;
		  delay_rotary_q2 <= rotary_q2;

		  rotary_event <= (rotary_q1 xor delay_rotary_q1) or (rotary_q2 xor delay_rotary_q2);

		  rotary_right <=   ( (not delay_rotary_q1) and      rotary_q1  and (not rotary_q2) )
							  or (      delay_rotary_q1  and (not rotary_q1) and      rotary_q2  )
							  or ( (not delay_rotary_q2) and      rotary_q2  and      rotary_q1  )
							  or (      delay_rotary_q2  and (not rotary_q2) and (not rotary_q1) );
		end if;
	 end process shaft_direction;

	 --   Um simples contador binário é utilizado para armazenar uma mudanca de rotação
	 --   Para a esquerda, o contador é decrementado.
	 --   Para a direita, o contador é incrementado.
	 position_counter: process(clk, ena, reset_n)
	 begin
		
		if (reset_n = '0') then
			rotate_counter <= (others =>'0');
			  
			elsif (clk'event and clk='1') then
				if (ena = '1') then
					if (rotary_event = '1') then
						if (rotary_right = '1') then
						rotate_counter <= rotate_counter + 1;
						else
						rotate_counter <= rotate_counter - 1;
						end if;			 
					end if;
				end if;			  
			end if; 
		rotate_counter_out <= rotate_counter;
	 end process position_counter;
	 
end Behavioral;
