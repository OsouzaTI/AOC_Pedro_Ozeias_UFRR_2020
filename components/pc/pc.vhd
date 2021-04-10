library library IEEE;
use IEEE.std_logic_1164.all;

entity pc is 
    port (
        clock:      in std_logic;
        in_port:    in std_logic;
        out_port:   in std_logic
    );
end pc;

architecture logic of pc is
begin
    process(clock)
    begin
        if rising_edge()

    end process;
end logic;

