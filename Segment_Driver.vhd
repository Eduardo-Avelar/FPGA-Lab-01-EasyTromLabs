----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs
-- Engineer: 		Eduardo Avelar
-- Create Date:   14:59:26 04/12/2017 
-- Design Name: 	Leitura de Encoder e Display	
-- Module Name:   Segment_Driver - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- declaração do módulo para comandar o display de 7 segmentos
entity Segment_Driver is
    Port ( display_A : in  STD_LOGIC_VECTOR (3 downto 0);
           display_B : in  STD_LOGIC_VECTOR (3 downto 0);
           display_C : in  STD_LOGIC_VECTOR (3 downto 0);
           display_D : in  STD_LOGIC_VECTOR (3 downto 0);
           segA 		: out  STD_LOGIC;
           segB 		: out  STD_LOGIC;
           segC 		: out  STD_LOGIC;
           segD 		: out  STD_LOGIC;
           segE 		: out  STD_LOGIC;
           segF 		: out  STD_LOGIC;
           segG 		: out  STD_LOGIC;
           Select_Display_A : out  STD_LOGIC;
           Select_Display_B : out  STD_LOGIC;
           Select_Display_C : out  STD_LOGIC;
           Select_Display_D : out  STD_LOGIC;
           clk : in  STD_LOGIC
			  );
end Segment_Driver;

architecture Behavioral of Segment_Driver is

	-- Declaração do component do módulo "Segment Decoder"
	-- As componentes são delcrações para uso de módulos externos a esta entidade
	-- Deve-se instanciar todas as entradas e saídas utilizadas na entidade a que se refere
	component Segment_Decoder_Module
		Port( 
			  Digit 		: in  STD_LOGIC_VECTOR (3 downto 0);
           segment_A : out  STD_LOGIC;
           segment_B : out  STD_LOGIC;
           segment_C : out  STD_LOGIC;
           segment_D : out  STD_LOGIC;
           segment_E : out  STD_LOGIC;
           segment_F : out  STD_LOGIC;
           segment_G : out  STD_LOGIC
			  );
	end component;
		
	component Clock_Divider
    Port ( 
			  clk 		: in  STD_LOGIC;
           enable 	: in  STD_LOGIC;
           reset 		: in  STD_LOGIC;
           data_clk 	: out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	end component;
	
-- Declaração de 3 sinais internos para apanhar os valores de um módulo para o outro
signal temperary_data : std_logic_vector (3 downto 0);
signal clock_word : std_logic_vector (15 downto 0);
signal slow_clock  : std_logic;

begin

	-- Instancia o component
	-- Nesta ação, estamos passando os dados que entram no módulo "Segment Decoder" atravez da entrada "Digit"
	-- par o sinal interno que irá repassar ao módulo "Segment Driver". O mesmo ocorre com as saídaso 
		uut: Segment_Decoder_Module port map (		
									Digit => temperary_data,
									segment_A => segA,
									segment_B => segB,
									segment_C => segC,
									segment_D => segD,
									segment_E => segE,
									segment_F => segF,
									segment_G => segG );

	-- O propósito to modulo Clock_Divider é reduzir o clock do FPGA
		uut1: Clock_Divider port map(
								clk => clk,
								enable => '1', -- Estes sianis já estão recebendo o valor 1 e 0
								reset => '0',  -- respeciivamente - "Hard Coding"
								data_clk => clock_word );
								
		-- O sinal Slow Clock irá receber o bit numero 15 do valor do clock provindo do modulo
		-- clock divider
		slow_clock <= clock_word(15);
		
		-- Processo que gera um "MUX" para seleção do display de acordo o sinal de clock do divisor
		process(slow_clock)		
			variable display_selection : std_logic_vector (1 downto 0);
			begin
				
				if slow_clock'event and slow_clock = '1' then
				
					case display_selection is
						when "00" => temperary_data <= display_A;
								select_display_A <= '0';
								select_display_B <= '1';
								select_display_C <= '1';
								select_display_D <= '1';							
								display_selection := display_selection + '1';
						
						when "01" => temperary_data <= display_B;
								select_display_A <= '1';
								select_display_B <= '0';
								select_display_C <= '1';
								select_display_D <= '1';							
								display_selection := display_selection + '1';
						
						when "10" => temperary_data <= display_C;
								select_display_A <= '1';
								select_display_B <= '1';
								select_display_C <= '0';
								select_display_D <= '1';								
								display_selection := display_selection + '1';
						
						when others  => temperary_data <= display_D;
								select_display_A <= '1';
								select_display_B <= '1';
								select_display_C <= '1';
								select_display_D <= '0';							
								display_selection := display_selection + '1';
					end case;
				end if;
			end process;
end Behavioral;

