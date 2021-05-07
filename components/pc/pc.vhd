-----------------------------------------------------
-- title       : Program Counter
-- project     : Processador
-- file        : pc.vhd
-- author      : Ozeias Souza
-----------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity pc is 
    port (
        clock    : in std_logic;
        in_port  : in std_logic_vector (7 DOWNTO 0);
        out_port : out std_logic_vector (7 DOWNTO 0)
    );
end pc;

architecture logic of pc is
begin
    process(clock)
    begin
        if rising_edge(clock) then
            out_port <= in_port;
        end if;
    end process;
end logic;

