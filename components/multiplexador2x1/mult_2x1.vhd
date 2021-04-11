LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_2x1 IS
    PORT (
        in_port : IN std_logic;
        in_A : IN std_logic;
        in_B : IN std_logic;
        out_port : OUT std_logic
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