----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs
-- Engineer: 		Eduardo Avelar
-- Create Date:   15:52:40 10/12/2018 
-- Design Name: 	Leitura de Encoder e Display
-- Module Name:   binary_to_bcd_digit.vhd - logic 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY binary_to_bcd_digit IS
	PORT(
		clk		:	IN			STD_LOGIC;								-- Clock do sistema
		reset_n	:	IN			STD_LOGIC;								-- Reset Assíncrono
		ena		:	IN			STD_LOGIC;								-- Habilita o funcionamento
		binary	:	IN			STD_LOGIC;								-- Bit deslocado para digito
		c_out		:	BUFFER	STD_LOGIC;								-- Bit de Carry out
		bcd		:	BUFFER	STD_LOGIC_VECTOR(3 DOWNTO 0)		-- Resultado da conversão BCD
		);	
		
END binary_to_bcd_digit;

ARCHITECTURE logic OF binary_to_bcd_digit IS
	SIGNAL	prev_ena	:	STD_LOGIC;	-- Monitora quando o enable foi acionado
BEGIN
	-- Executa o "carry-out" quando o valor do registro exceder o valor 4
	c_out <= bcd(3) OR (bcd(2) AND bcd(1)) OR (bcd(2) AND bcd(0));  

	PROCESS(reset_n, clk) -- Inicia o processo sensível ao reset_n e clk
	BEGIN
		IF(reset_n = '0') THEN								--	Confirmação do reset assíncrono
			prev_ena <= '0';									-- Apaga o "histórico" do enable
			bcd <= "0000";										-- Apaga a saída
		ELSIF(clk'EVENT AND clk = '1') THEN				-- Borda de subida do clock do sistema
			prev_ena <= ena;									-- Acompanha a última ativação
			IF(ena = '1') THEN								-- Operação habilitada
				IF(prev_ena = '0') THEN						-- Primeiro ciclo apos a habilitação
					bcd <= "0000";								-- Inicializa o registrador
				ELSIF(c_out = '1') THEN						-- Valor do registro escedeu o valor 4
					bcd(0) <= binary;							-- Deslocao novo bit para dentro do primeiro registro
					bcd(1) <= NOT bcd(0);					-- Configura o segundo registrador para ajustar o valro
					bcd(2) <= NOT (bcd(1) XOR bcd(0));	-- Configura o terceiro registrador para ajustar o valro
					bcd(3) <= bcd(3) AND bcd(0);			-- Configura o quarto registrador para ajustar o valro
				ELSE												-- Valor do registrador não é maior do que 4
					bcd <= bcd(2 DOWNTO 0) & binary;		-- Desloca valores do registro e atualiza para o novo valor do bit
				END IF;
			END IF;
		END IF;
	END PROCESS;
END logic;