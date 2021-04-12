LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Multiplexador 2x1 de 8bits

ENTITY mult_2x1 IS
    PORT (
        in_port : IN std_logic;
        in_A : IN std_logic_vector(7 DOWNTO 0);
        in_B : IN std_logic_vector(7 DOWNTO 0);
        out_port : OUT std_logic_vector(7 DOWNTO 0)
    );
END mult_2x1 ;

ARCHITECTURE behavior OF mult_2x1 IS
BEGIN
    PROCESS (in_port, in_A, in_B)
    BEGIN
        CASE in_port IS
            WHEN '0' => out_port <= in_A;
            WHEN '1' => out_port <= in_B;
        END CASE;
    END PROCESS;
END behavior;