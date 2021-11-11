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
		digits	:	INTEGER := 4      -- Numero de dígitos do dislay
		);		
	PORT(
		clk		:	IN		STD_LOGIC;											-- Clock do sistema (50MHz)
		reset_n	:	IN		STD_LOGIC;											-- Reset Assincrono - LOW
		ena		:	IN		STD_LOGIC;											-- Habilita contagem
		binary	:	IN		STD_LOGIC_VECTOR(bits-1 DOWNTO 0);			-- Número binário para conversão
		busy		:	OUT	STD_LOGIC;											-- Indica conversão em progresso
		bcd		:	OUT	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0));	-- Resultado da conversão em BCD
END BCD_converter;

ARCHITECTURE logic OF BCD_converter IS
	TYPE		machine IS(idle, convert);												-- Esdados da máquina de estados
	SIGNAL	state     			:  machine;											-- Delaração da maquina de estados
	SIGNAL	binary_reg			:	STD_LOGIC_VECTOR(bits-1 DOWNTO 0);		-- Declaracao de um sinal para registrar o numero binário de entrada
	SIGNAL	bcd_reg				:	STD_LOGIC_VECTOR(digits*4-1 DOWNTO 0);	-- Registrador do número BCD
	SIGNAL	converter_ena		:	STD_LOGIC;										-- Sinal para sinalizar a conversão habilitada
	SIGNAL	converter_inputs	:	STD_LOGIC_VECTOR(digits DOWNTO 0);		-- Entradas para o digito do BCD

	-- Instancia o componente de conversão 
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
		
	VARIABLE bit_count :	INTEGER RANGE 0 TO bits+1 := 0;  -- Variável para armazenar a contagem dos bits	
	
	BEGIN
		IF(reset_n = '0') THEN						-- Ativação do Reset Assíncrono
			bit_count := 0;							-- Apaga a variável
			busy <= '1';								-- Indica que não está disponível
			converter_ena <= '0';					-- Desabilita a conversão
			bcd <= (OTHERS => '0');					-- Apaga o valor BCD
			state <= idle;								-- Reinicia a máquina de estados
			
		ELSIF(clk'EVENT AND clk = '1') THEN		-- Sensibilidade a boarda de subida do clock
			-- Teste dos estados da máquina de estados
			CASE state IS
				WHEN idle =>							-- Estado Ocupado
					IF(ena = '1') THEN				-- Se conversão habilitada
						busy <= '1';					-- Indica que a conversão esta em processo
						converter_ena <= '1';		-- Habilita a conversão
						binary_reg <= binary;		-- Repassa o numero binário para o registrador
						bit_count := 0;				-- Apaga o contador de bits
						state <= convert;				-- Passa para o proximo estado 
					ELSE									-- Se a conversão não está habilitada
						busy <= '0';					-- Mostra que não está em processo de conversão
						converter_ena <= '0';		-- Desabilita a conversão
						state <= idle;					-- Permanece no estado de ocupado
					END IF;
				
				WHEN convert =>														-- Estado de conversão
					IF(bit_count < bits+1) THEN									-- Nem todos os bits foram contabilizados ainda
						bit_count := bit_count + 1;								-- Incrementa o contador de bits
						converter_inputs(0) <= binary_reg(bits-1);			-- Desloca o proximo bit para a conversão
						binary_reg <= binary_reg(bits-2 DOWNTO 0) & '0';	-- Desloca o registrador de numeros binários
						state <= convert;												-- Permanece no estado de conversão
					ELSE																	-- Se todos os bits foram deslocados
						busy <= '0';													-- Indica que a conversão finalizou
						converter_ena <= '0';										-- Desabilita o conversor
						bcd <= bcd_reg;												-- Resultado da converão
						state <= idle;													-- Retorna ao estado de ocupado
					END IF;			
			END CASE;	
		END IF;
	END PROCESS;
	
	-- Instancia o conversor para o numero especifico de bits e realiza conexão das portas
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
