-----------------------------------------------------
-- title       : Extensor de 2bits para 8bits
-- project     : Processador
-- file        : extensor2_8.vhd
-- author      : Ozeias Souza
-----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity extensor2_8 is
	port(
		in_a : in std_logic_vector(1 downto 0);
		out_b : out std_logic_vector(7 downto 0)
	);
end extensor2_8;

architecture logic of extensor2_8 is
begin 
	
	process(in_a)
	begin
		out_b <= ("000000") & in_a;
	end process;
	
end logic;