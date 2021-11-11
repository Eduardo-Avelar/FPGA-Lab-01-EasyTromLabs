----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs
-- Engineer: 		Eduardo Avelar
-- Create Date:   11:35:04 10/13/2018 
-- Design Name: 	Leitura de Encoder e Display
-- Module Name:   Encoder_Counter - Behavioral  
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL;

entity Encoder_Counter is
    Port ( 
			fpga_clk 		: 	in  	STD_LOGIC;		-- Sinal de entrada do clock (MHz)
         encoder_A 		: 	in  	STD_LOGIC;		-- Sinal de entrada do encoder A
         encoder_B 		: 	in  	STD_LOGIC; 		-- Sinal de entrada do encoder B
			reset_mod		:	IN		STD_LOGIC;		-- Reset em n�vel baixo e assincrono
			ena_mod			:	IN		STD_LOGIC;		-- Habilita a convers�o
     		busy_mod			:	OUT	STD_LOGIC;		-- Indica conversao em processo
			milhar_mod	 	: 	out  	STD_LOGIC_VECTOR (3 downto 0); 	-- D�gito Milhar do m�dulo Nexys 2
         centenas_mod	: 	out  	STD_LOGIC_VECTOR (3 downto 0); 	-- D�gito Centena do m�dulo Nexys 2
         dezenas_mod		: 	out  	STD_LOGIC_VECTOR (3 downto 0);  	-- D�gito Dezena do m�dulo Nexys 2
         unidades_mod	: 	out  	STD_LOGIC_VECTOR (3 downto 0));  -- D�gito Unidade do m�dulo Nexys 2			
end Encoder_Counter;

architecture Behavioral of Encoder_Counter is

component BCD_converter IS
	GENERIC(
			bits		:	INTEGER := 13;		-- Tamanho dos bits de contagem dos pulsos 0 - 12 = 1 a 8192 ou 0 a 8191
			digits	:	INTEGER := 4 );	-- Numero de digitos no display do m�dulo				
	PORT(
			clk		:	IN		STD_LOGIC;										-- Clock do sistema ( MHz)
			reset_n	:	IN		STD_LOGIC;										-- Reset em n�vel baixo
			ena		:	IN		STD_LOGIC;										-- Habilita a convers�o
			binary	:	IN		STD_LOGIC_VECTOR(bits-1 DOWNTO 0);		-- N�mero bin�rio para converter para BCD
			busy		:	OUT	STD_LOGIC;										-- Indica convers�o habilitada e em processo cont�nuo
			bcd		:	OUT	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0));-- Resultado da conversao BCD
END component;

component Encoder_Rotativo_Teste is
    Port ( 	
			rotary_a 				: in  	STD_LOGIC;
			rotary_b 				: in  	STD_LOGIC;
			reset_n					: IN		STD_LOGIC;	-- Reset Assincrono - LOW
			ena						: IN		STD_LOGIC;	-- Habilita contagem
			rotate_counter_out	: out  	STD_LOGIC_VECTOR (12 downto 0);
			clk 						: in  	STD_LOGIC );
end component;

signal encoderOut : std_logic_vector(12 downto 0); -- Sinal para conex�o entre m�dulos
signal bcd 			: STD_LOGIC_VECTOR(15 DOWNTO 0);	-- Sinal para conex�o entre modulos armezanamento do resultado da convers�o

begin
	unidades_mod 	<= bcd(3 downto 0);
	dezenas_mod 	<= bcd(7 downto 4);
	centenas_mod 	<= bcd(11 downto 8);
	milhar_mod 		<= bcd(15 downto 12);

	-- Realiza a conex�o entre os m�dulos
	BCDConv : BCD_converter port map(
							clk 		=> fpga_clk,
							reset_n 	=> reset_mod, 
							ena 		=> ena_mod, 
							binary 	=> encoderOut, 
							busy 		=> busy_mod, 
							bcd 		=> bcd );
							
	-- Realiza a conex�o entre os m�dulos						
	Encoder_value	: Encoder_Rotativo_Teste port map(
							clk 						=> fpga_clk,
							rotary_a 				=> encoder_A, 
							rotary_b 				=> encoder_B,
							reset_n					=> reset_mod,
							ena						=> ena_mod,
							rotate_counter_out 	=> encoderOut );
end Behavioral;