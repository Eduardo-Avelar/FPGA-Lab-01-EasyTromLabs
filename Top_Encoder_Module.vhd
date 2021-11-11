----------------------------------------------------------------------------------
-- Company: 		EasyTrom Labs
-- Engineer: 		Eduardo Avelar
-- Create Date:   11:54:20 10/13/2018 
-- Design Name: 	Leitura de Encoder e Display	
-- Module Name:   Top_Encoder_Module - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Encoder_Module is
    Port ( 
			top_enc_a		: in 		std_logic;	-- Entrada do canal A do encoder
			top_enc_b		: in 		std_logic;	-- Entrada do canal B do encoder
			top_clk 			: in  	STD_LOGIC;	-- Clock da placa 50 Mhz
			top_reset 		: in		STD_LOGIC;	-- Reset em nível baixo
			top_enable		: in		STD_LOGIC;	-- Habilita a conversão
     		top_busy			: out		STD_LOGIC;	-- Indica conversão em processo		
			top_selDispA	: out  	STD_LOGIC;	-- Pino de seleção do diaplay A
			top_selDispB 	: out  	STD_LOGIC;	-- 	''						''		B
			top_selDispC 	: out  	STD_LOGIC;	--		''						''		C
			top_selDispD 	: out  	STD_LOGIC;	--		''						''		D 	
			top_segA 		: out  	STD_LOGIC;	-- Pino do segmento 	A
			top_segB 		: out  	STD_LOGIC;	--  ''			''		B
			top_segC 		: out  	STD_LOGIC;	
			top_segD 		: out  	STD_LOGIC;
			top_segE 		: out  	STD_LOGIC;
			top_segF 		: out  	STD_LOGIC;	--		''			''		G
			top_segG 		: out  	STD_LOGIC );
			
end Top_Encoder_Module;

architecture Behavioral of Top_Encoder_Module is

component Encoder_Counter is
    Port ( 
			fpga_clk 		: 	in  	STD_LOGIC;		-- Sinal de entrada do clock (MHz)
         encoder_A 		: 	in  	STD_LOGIC;		-- Sinal de entrada do encoder A
         encoder_B 		: 	in  	STD_LOGIC; 		-- Sinal de entrada do encoder B
			reset_mod		:	IN		STD_LOGIC;		-- Reset em nível baixo
			ena_mod			:	IN		STD_LOGIC;		-- latches in new binary number and starts conversion
     		busy_mod			:	out	STD_LOGIC;		-- indicates conversion in progress
			milhar_mod	 	: 	out  	STD_LOGIC_VECTOR (3 downto 0); -- Dígito Milhar do módulo
         centenas_mod	: 	out  	STD_LOGIC_VECTOR (3 downto 0); -- Dígito Centena do módulo
         dezenas_mod		: 	out  	STD_LOGIC_VECTOR (3 downto 0); -- Dígito Dezena do módulo
         unidades_mod	: 	out  	STD_LOGIC_VECTOR (3 downto 0)); -- Dígito Unidade do módulo
			
end component;

-- declaração do módulo para comandar o display de 7 segmentos
component Segment_Driver is
    Port ( 
			display_A 			: in  	STD_LOGIC_VECTOR (3 downto 0);
         display_B 			: in  	STD_LOGIC_VECTOR (3 downto 0);
         display_C 			: in  	STD_LOGIC_VECTOR (3 downto 0);
         display_D 			: in  	STD_LOGIC_VECTOR (3 downto 0);
         segA 					: out  	STD_LOGIC;
         segB 					: out  	STD_LOGIC;
         segC 					: out  	STD_LOGIC;
         segD 					: out  	STD_LOGIC;
         segE 					: out  	STD_LOGIC;
         segF 					: out  	STD_LOGIC;
         segG 					: out  	STD_LOGIC;
         Select_Display_A 	: out  	STD_LOGIC;
         Select_Display_B 	: out  	STD_LOGIC;
         Select_Display_C 	: out  	STD_LOGIC;
         Select_Display_D 	: out  	STD_LOGIC;
         clk 					: in  	STD_LOGIC );
end component;

-- Declaração de sinais para conectar os módulos
signal Ai 	: 	std_logic_vector(3 downto 0);
signal Bi 	: 	std_logic_vector(3 downto 0);
signal Ci 	: 	std_logic_vector(3 downto 0);
signal Di 	: 	std_logic_vector(3 downto 0);

signal top_milhar 	: 	std_logic_vector(3 downto 0);
signal top_centena	: 	std_logic_vector(3 downto 0);
signal top_dezena 	: 	std_logic_vector(3 downto 0);
signal top_unidade 	: 	std_logic_vector(3 downto 0);

begin

	-- Estabelece o link utilizando os sinais e entradas/saídas deste módulo
	uut2 : segment_driver port map(
				display_A 			=> Ai,
				display_B 			=> Bi,
				display_C 			=> Ci,
				display_D 			=> Di,
				segA 					=> top_segA,
				segB 					=> top_segB,
				segC 					=> top_segC,
				segD 					=> top_segD,
				segE 					=> top_segE,
				segF 					=> top_segF,
				segG 					=> top_segG,
				Select_Display_A 	=> top_selDispA,
				Select_Display_B 	=> top_selDispB,
				Select_Display_C 	=> top_selDispC,
				Select_Display_D 	=> top_selDispD,
				clk 					=> top_clk );

	uut4 : Encoder_Counter port map(
				fpga_clk 		=>	top_clk,
				encoder_A 		=> top_enc_a,
				encoder_B 		=> top_enc_b,			
				reset_mod		=> top_reset,
				ena_mod			=> top_enable,
				busy_mod			=> top_busy,
				milhar_mod	 	=> top_milhar,
				centenas_mod	=> top_centena,
				dezenas_mod		=> top_dezena,
				unidades_mod	=> top_unidade	);

	-- Utiliza os sinais declarados para conexão entre a saída do modulo segment
	-- Driver para o modulo TOP
	Ai <= top_unidade;
	Bi <= top_dezena;
	Ci <= top_centena;
	Di <= top_milhar;

end Behavioral;