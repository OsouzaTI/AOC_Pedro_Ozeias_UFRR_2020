library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity print_helper is
  port (
	clock  : in  std_logic;
	f_print: in  std_logic;
	in_A	 : in std_logic_vector(7 downto 0);
   s_out  : out std_logic_vector(7 downto 0)
  ) ;
end print_helper ; 

architecture logic of print_helper is
begin
	s_out <= in_A;
end architecture ;