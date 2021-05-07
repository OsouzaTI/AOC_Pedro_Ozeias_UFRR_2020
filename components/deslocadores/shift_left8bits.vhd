-----------------------------------------------------
-- title       : Deslocamento de bits a esquerda
-- project     : Processador
-- file        : shift_left8bits.vhd
-- author      : Ozeias Souza
-----------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shift_left8bits is
    port(
        in_A : in std_logic_vector(7 downto 0);
        S_out : out std_logic_vector(7 downto 0)
    );
end entity;

architecture logic of shift_left8bits is
begin
	s_out <= in_A(6 downto 0) & '0';
end architecture;