-----------------------------------------------------
-- title       : Subtrator de 8bits
-- project     : Processador X
-- file        : subtrator.vhd
-- author      : Pedro / Ozeias Souza
-----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity subtrator is
	port(	
		in_a : in std_logic_vector (7 downto 0); 
		in_b : in std_logic_vector (7 downto 0);
		cout : out std_logic; 
		s: out std_logic_vector(7 downto 0)
	);
end entity;

architecture logic of subtrator is
	
	component somador8bits is
    port(
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        s: out std_logic_vector(7 downto 0)
    );
	
	end component somador8bits;

	component p_xor is
		 port (
			in_port_a : in std_logic;
			in_port_b : in std_logic;
			out_port : out std_logic
		 );
	end component p_xor;
	
	signal comp2 : std_logic_vector (7 downto 0);
	
	begin
	
		-- comp2 <= "11111111" xor in_b; 
		
		xor0: p_xor port map('1', in_b(7), comp2(7));
		xor1: p_xor port map('1', in_b(6), comp2(6));
		xor2: p_xor port map('1', in_b(5), comp2(5));
		xor3: p_xor port map('1', in_b(4), comp2(4));
		xor4: p_xor port map('1', in_b(3), comp2(3));
		xor5: p_xor port map('1', in_b(2), comp2(2));
		xor6: p_xor port map('1', in_b(1), comp2(1));
		xor7: p_xor port map('1', in_b(0), comp2(0));
		somador1 : somador8bits port map(in_a, comp2, '1', cout, s);		
	  
end logic; 
