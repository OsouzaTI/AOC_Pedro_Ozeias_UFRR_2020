LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY p_not IS
    PORT (
        in_port_A : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
END p_not;

ARCHITECTURE behavior OF p_not IS
BEGIN
    out_port <= NOT(in_port_A);
END behavior;