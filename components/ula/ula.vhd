-----------------------------------------------------
-- title       : Unidade Lógica Aritmética
-- project     : Processador
-- file        : ula.vhd
-- author      : Ozeias Souza / Pedro
-----------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ula is
    port(
		clock	: in std_logic;						-- clock				(1bit)
		in_op 	: in std_logic_vector(3 downto 0);	-- operação da ula 		(4bits)
		in_A	: in std_logic_vector(7 downto 0);	-- entrada A			(8bits)
		in_B	: in std_logic_vector(7 downto 0);	-- entrada B			(8bits)
		S_out 	: out std_logic_vector(7 downto 0);	-- S_out				(8bits)
		z_out	: out std_logic 					-- Saida zero da ULA	(1bit)
    );
end entity;

-- 0000 -> Soma					| Tipo R
-- 0001 -> Soma imediata		| Tipo I
-- 0010 -> Subtração			| Tipo R
-- 0011 -> Subtração Imediata	| Tipo I
-- 0100 -> multiplicação		| Tipo R
-- 0101 -> LW					| Tipo ?
-- 0110 -> SW					| Tipo ?
-- 0111 -> BEQ					| Tipo ?
-- 1000 -> BNE					| Tipo ?		
-- To be Continued

architecture logic of ula is

-- Somador de 8 bits

component somador8bits is
	port(
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		cout: out std_logic;
		s: out std_logic_vector(7 downto 0)
	);        
end component somador8bits;

-- Subtrator de 8bits

component subtrator is
	port(        
		in_a : in std_logic_vector (7 downto 0); 
		in_b : in std_logic_vector (7 downto 0);
		cout : out std_logic; 
		s: out std_logic_vector(7 downto 0)
	);
end component;

-- Portas lógicas

component p_and is
    port (
        in_port_a : in std_logic;
        in_port_b : in std_logic;
        out_port : out std_logic
    );
end component;

component p_not is
    port (
        in_port_a : in std_logic;
        out_port : out std_logic
    );
end component;

component p_or is
    port (
        in_port_a : in std_logic;
        in_port_b : in std_logic;
        out_port : out std_logic
    );
end component;

component p_xor is
    port (
        in_port_a : in std_logic;
        in_port_b : in std_logic;
        out_port : out std_logic
    );
end component;

	signal soma : std_logic_vector(7 downto 0);
	signal subtracao : std_logic_vector(7 downto 0);

begin

	op1: somador8bits port map(in_A, in_B, '1', '0', soma);
	op2: subtrator port map(in_A, in_B, '1', '0', subtracao);

	process(clock)
	begin
		case in_op is
			-- 1 operação | soma
			when "0000" => S_out <= soma else
			-- 2 operação | soma imediata
			when "0001" => S_out <= soma else
			-- 3 operação | subtração
			when "0010" => S_out <= subtracao else
			-- 4 operação | subtração imediata
			when "0011" => S_out <= subtracao else
			-- 6 operação 
			when "0101" => S_out <= in_A else			
			-- 7 operação 
			when "0110" => S_out <= in_A
			else S_out <= (others => '0');
			
-- -- 5 operação | multiplicação
-- when "0100" =>
-- 	-- TODO: implementar um componente de multiplicação
-- -- 8 operação 
-- when "0111" => 
-- -- 9 operação 
-- when "1000" =>
-- -- 10 operação 
-- when "1001" =>
-- -- 11 operação 
-- when "1010" =>
-- -- 12 operação 
-- when "1011" =>
-- -- 13 operação 
-- when "1100" =>
-- -- 14 operação 
-- when "1101" => 
-- -- 15 operação
-- when "1110" =>
-- -- 16 operação 
-- when "1111" => 		

	end process;

end logic;