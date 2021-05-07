library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity branch_helper is
  port (
    in_a : in std_logic;
    s_out : out std_logic
  ) ;
end branch_helper ; 

architecture logic of branch_helper is
begin
    s_out <= in_a;
end architecture ;