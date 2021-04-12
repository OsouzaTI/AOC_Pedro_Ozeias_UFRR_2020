library ieee;
use ieee.std_logic_1164.all;

entity p_and is
    port (
        in_port_a : in std_logic;
        in_port_b : in std_logic;
        out_port : out std_logic
    );
end p_and;

architecture behavior of p_and is
begin
    out_port <= in_port_a and in_port_b;
end behavior;
