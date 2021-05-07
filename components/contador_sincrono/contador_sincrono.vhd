-----------------------------------------------------
-- title       : contadorSincrono
-- project     : contador sincrono
-- file        : contadorSincrono.vhd
-- author      : ozeias souza
-----------------------------------------------------
-- description :  descrição de um circuito 
-- capaz de fazer uma contagem sincrona atraves
-- dos pulsos do clock


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity contador_sincrono is
    port(
        clock : in std_logic;
        in_a : in std_logic_vector(7 downto 0);
        s_out : out std_logic_vector(7 downto 0)
    );
end contador_sincrono;

architecture logic of contador_sincrono is
begin    
    process(clock)
    begin
        s_out <= in_a + "00000001";
    end process;
end architecture logic;