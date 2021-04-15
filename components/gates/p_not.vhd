-----------------------------------------------------
-- title       : Porta NOT
-- project     : Processador
-- file        : p_not.vhd
-- author      : Pedro
-----------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity p_not is
    port (
        in_port_a : in std_logic;
        out_port : out std_logic
    );
end p_not;

architecture behavior of p_not is
begin
    out_port <= not(in_port_a);
end behavior;