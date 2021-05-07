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
		clock				: in std_logic;							-- clock									(1bit)
		in_op 			: in std_logic_vector(3 downto 0);	-- operação da ula 					(4bits)
		in_A				: in std_logic_vector(7 downto 0);	-- entrada A							(8bits)
		in_B				: in std_logic_vector(7 downto 0);	-- entrada B							(8bits)
		S_out 			: out std_logic_vector(7 downto 0);	-- S_out									(8bits)
		z_out		 		: out std_logic; 							-- Saida zero da ULA					(1bit)
		print_out      : out std_logic_vector(7 downto 0);
		ula_overflow	: out std_logic 							-- Overflow de operações da ULA 	(1bit)
    );
end entity;

-- 0000 -> Soma					| Tipo R
-- 0001 -> Soma imediata		| Tipo I
-- 0010 -> Subtração				| Tipo R
-- 0011 -> Subtração Imediata	| Tipo I
-- 0100 -> multiplicação		| Tipo R
-- 0101 -> Load Word				| Tipo I
-- 0110 -> Store Word			| Tipo I
-- 0111 -> Load Imediato		| Tipo I
-- 1000 -> BEQ						| Tipo J
-- 1001 -> BNE						| Tipo J
-- 1010 -> J						| Tipo J
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

component multiplicador8bits is
    port(
        in_A  : in std_logic_vector(7 downto 0);   -- Multiplicador 8bits
        in_B  : in std_logic_vector(7 downto 0);   -- Multiplicando 8bits
        S_out : out std_logic_vector(15 downto 0)  -- Saida 16 bits
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

component branch_helper is
	port (
	  in_a : in std_logic;
	  s_out : out std_logic
	) ;
end component ; 

		
	signal soma : std_logic_vector(7 downto 0);
	signal subtracao : std_logic_vector(7 downto 0);
	signal multiplicacao : std_logic_vector(15 downto 0);
	signal overflow_soma, overflow_subtracao	: std_logic;
	signal in_branch_helper  : std_logic;
	signal out_branch_helper: std_logic;
	signal result : std_logic_vector(7 downto 0);
begin

	bh:  branch_helper port map(in_branch_helper, out_branch_helper);
	op1: somador8bits port map(in_A, in_B, '0', overflow_soma, soma);
	op2: subtrator port map(in_A, in_B, overflow_subtracao, subtracao);
	op3: multiplicador8bits port map(in_A, in_B, multiplicacao);
	
	process(clock)
	begin
		-- if(rising_edge(clock)) then
			case in_op is
				-- 1 operação | soma
				when "0000" =>
					S_out <= soma;
					result <= soma;
					ula_overflow <= overflow_soma;
				-- 2 operação | soma imediata
				when "0001" =>
					S_out <= soma;	
					result <= soma;	
					ula_overflow <= overflow_soma;	
				-- 3 operação | subtração
				when "0010" =>
					S_out <= subtracao;	
					result <= subtracao;
					ula_overflow <= overflow_subtracao;		
				-- 4 operação | subtração imediata
				when "0011" =>
					S_out <= subtracao;	
					result <= subtracao;
					ula_overflow <= overflow_subtracao;	
				-- 5 operação | multiplicação
				when "0100" =>
					S_out  <= multiplicacao(7 downto 0);	
					result <= multiplicacao(7 downto 0);
				-- 6 operação 
				when "0101" =>
					S_out <= in_A;
				-- 7 operação 
				when "0110" =>
					S_out <= in_A;
				-- 8 operação 
				when "0111" =>
					S_out <= in_B;
				-- 9 operação -- beq
				when "1000" =>
					if out_branch_helper = '1' then
						z_out <= '1';
					else						
						z_out <= '0';
					end if;					
					S_out <= "00000000";
				-- 10 operação -- bne
				when "1001" =>
					if out_branch_helper = '0' then
						z_out <= '1';
					else						
						z_out <= '0';
					end if;										
					S_out <= "00000000";	
				when "1011" =>
					if in_A = in_B then						
						in_branch_helper <= '1';
					else
						in_branch_helper <= '0';
					end if;
					S_out <= "00000000";
				when others =>
				S_out <= "00000000";	
				
			end case;
	end process;

end logic;