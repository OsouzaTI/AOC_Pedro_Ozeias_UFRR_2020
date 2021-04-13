entity ula is
    port(
		clock	: in std_logic;						-- clock				(1bit)
		in_op 	: in std_logic_vector(3 downto 0);	-- operação da ula 		(4bits)
		in_A	: in std_logic_vector(7 downto 0);	-- entrada A			(8bits)
		in_B	: in std_logic_vector(7 downto 0);	-- entrada B			(8bits)
		S_out 	: out std_logic_vector(7 downto 0);	-- S_out				(8bits)
		z_out	: out std_logic;					-- Saida zero da ULA	(1bit)
    );
entity ula;

-- 0000 -> Soma
-- 0001 -> Soma imediata
-- 0010 -> Subtração
-- 0011 -> Subtração Imediata
-- 0100 -> Subtração Imediata
-- 0101 -> multiplicação
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

entity subtrator is
	port(        
		in_a : in std_logic_vector (7 downto 0); 
		in_b : in std_logic_vector (7 downto 0);
		cout : out std_logic; 
		s: out std_logic_vector(7 downto 0)
	);
end entity;

	signal out_A, out_B : std_logic_vector(7 downto 0);

begin

	process(clock)

		case in_op is
			-- 1 operação
			when "0000" =>
			-- 2 operação 
			when "0001" =>
			-- 3 operação 
			when "0010" =>
			-- 4 operação 
			when "0011" =>
			-- 5 operação 
			when "0100" =>
			-- 6 operação 
			when "0101" =>
			-- 7 operação 
			when "0110" =>
			-- 8 operação 
			when "0111" =>
			-- 9 operação 
			when "1000" =>
			-- 10 operação 
			when "1001" =>
			-- 11 operação 
			when "1010" =>
			-- 12 operação 
			when "1011" =>
			-- 13 operação 
			when "1100" =>
			-- 14 operação 
			when "1101" => 
			-- 15 operação
			when "1110" =>
			-- 16 operação 
			when "1111" => 		

	end process;

end logic;