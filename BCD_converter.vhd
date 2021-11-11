----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs	
-- Engineer: 		Eduardo Avelar	
-- Create Date:   14:38:28 04/15/2017 
-- Design Name: 	Leitura de Encoder e Display
-- Module Name:   BCD_converter - Behavioral 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY BCD_converter IS
	GENERIC(
		bits		:	INTEGER := 13;		-- Tamanho total da contagem dos pulsos ( 0 a 8191)
		digits	:	INTEGER := 4      -- Numero de d�gitos do dislay
		);		
	PORT(
		clk		:	IN		STD_LOGIC;											-- Clock do sistema (50MHz)
		reset_n	:	IN		STD_LOGIC;											-- Reset Assincrono - LOW
		ena		:	IN		STD_LOGIC;											-- Habilita contagem
		binary	:	IN		STD_LOGIC_VECTOR(bits-1 DOWNTO 0);			-- N�mero bin�rio para convers�o
		busy		:	OUT	STD_LOGIC;											-- Indica convers�o em progresso
		bcd		:	OUT	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0));	-- Resultado da convers�o em BCD
END BCD_converter;

ARCHITECTURE logic OF BCD_converter IS
	TYPE		machine IS(idle, convert);												-- Esdados da m�quina de estados
	SIGNAL	state     			:  machine;											-- Delara��o da maquina de estados
	SIGNAL	binary_reg			:	STD_LOGIC_VECTOR(bits-1 DOWNTO 0);		-- Declaracao de um sinal para registrar o numero bin�rio de entrada
	SIGNAL	bcd_reg				:	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0);	-- Registrador do n�mero BCD
	SIGNAL	converter_ena		:	STD_LOGIC;										-- Sinal para sinalizar a convers�o habilitada
	SIGNAL	converter_inputs	:	STD_LOGIC_VECTOR(digits DOWNTO 0);		-- Entradas para o digito do BCD

	-- Instancia o componente de convers�o 
	COMPONENT binary_to_bcd_digit IS
		PORT(
			clk		:	IN			STD_LOGIC;
			reset_n	:	IN			STD_LOGIC;
			ena		:	IN			STD_LOGIC;
			binary	:	IN			STD_LOGIC;
			c_out		:	BUFFER	STD_LOGIC;
			bcd		:	BUFFER	STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT binary_to_bcd_digit;
	
BEGIN

	PROCESS(reset_n, clk)
		
	VARIABLE bit_count :	INTEGER RANGE 0 TO bits+1 := 0;  -- Vari�vel para armazenar a contagem dos bits	
	
	BEGIN
		IF(reset_n = '0') THEN						-- Ativa��o do Reset Ass�ncrono
			bit_count := 0;							-- Apaga a vari�vel
			busy <= '1';								-- Indica que n�o est� dispon�vel
			converter_ena <= '0';					-- Desabilita a convers�o
			bcd <= (OTHERS => '0');					-- Apaga o valor BCD
			state <= idle;								-- Reinicia a m�quina de estados
			
		ELSIF(clk'EVENT AND clk = '1') THEN		-- Sensibilidade a boarda de subida do clock
			-- Teste dos estados da m�quina de estados
			CASE state IS
				WHEN idle =>							-- Estado Ocupado
					IF(ena = '1') THEN				-- Se convers�o habilitada
						busy <= '1';					-- Indica que a convers�o esta em processo
						converter_ena <= '1';		-- Habilita a convers�o
						binary_reg <= binary;		-- Repassa o numero bin�rio para o registrador
						bit_count := 0;				-- Apaga o contador de bits
						state <= convert;				-- Passa para o proximo estado 
					ELSE									-- Se a convers�o n�o est� habilitada
						busy <= '0';					-- Mostra que n�o est� em processo de convers�o
						converter_ena <= '0';		-- Desabilita a convers�o
						state <= idle;					-- Permanece no estado de ocupado
					END IF;
				
				WHEN convert =>														-- Estado de convers�o
					IF(bit_count < bits+1) THEN									-- Nem todos os bits foram contabilizados ainda
						bit_count := bit_count + 1;								-- Incrementa o contador de bits
						converter_inputs(0) <= binary_reg(bits-1);			-- Desloca o proximo bit para a convers�o
						binary_reg <= binary_reg(bits-2 DOWNTO 0) & '0';	-- Desloca o registrador de numeros bin�rios
						state <= convert;												-- Permanece no estado de convers�o
					ELSE																	-- Se todos os bits foram deslocados
						busy <= '0';													-- Indica que a convers�o finalizou
						converter_ena <= '0';										-- Desabilita o conversor
						bcd <= bcd_reg;												-- Resultado da conver�o
						state <= idle;													-- Retorna ao estado de ocupado
					END IF;			
			END CASE;	
		END IF;
	END PROCESS;
	
	-- Instancia o conversor para o numero especifico de bits e realiza conex�o das portas
	bcd_digits: FOR i IN 1 to digits GENERATE 
	digit_0: binary_to_bcd_digit
				PORT MAP (
							clk 		=> clk, 
							reset_n 	=> reset_n, 
							ena 		=> converter_ena, 
							binary 	=> converter_inputs(i-1), 
							c_out 	=> converter_inputs(i), 
							bcd 		=> bcd_reg(i*4-1 DOWNTO i*4-4)
							); 			
	END GENERATE;
END logic;
