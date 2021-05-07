-----------------------------------------------------
-- title       : Extensor de 4bits para 8bits
-- project     : Processador
-- file        : extensor2_8.vhd
-- author      : Pedro
-----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity extensor4_8 is
	port(
		in_a : in std_logic_vector(3 downto 0);
		out_b : out std_logic_vector(7 downto 0)
	);
end extensor4_8;

architecture logic of extensor4_8 is
begin 

	process(in_a)
	begin
		out_b <= ("0000") & in_a;
	end process;
	
end logic;
