-----------------------------------------------------
-- title       : Porta OR
-- project     : Porta OR
-- file        : p_or.vhd
-- author      : Pedro
-----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity p_or is
    port (
        in_port_a : in std_logic;
        in_port_b : in std_logic;
        out_port : out std_logic
    );
end p_or;

architecture behavior of p_or is
begin
    out_port <= in_port_a or in_port_b;
end behavior;