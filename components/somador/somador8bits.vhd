-----------------------------------------------------
-- title       : Somador 8bits
-- project     : Somador
-- file        : somador.vhd
-- author      : Ozeias Souza
-----------------------------------------------------
-- description :  Somador capaz de operar com entradas de 8 bits

library IEEE;
use IEEE.std_logic_1164.all;

entity somador8bits is
    port(
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        s: out std_logic_vector(7 downto 0)
    );
end entity somador8bits;

architecture logic of somador8bits is 
begin

    process(A, B, cin)
    variable temp: std_logic_vector(7 downto 0);
    variable c: std_logic;
    begin

        -- variaveis sao validas apenas dentro do scopo
        -- do process

        c := cin;
        -- primeiro bit
        temp(0) := A(0) xor B(0) xor c;
        c := (A(0) and B(0)) or ((A(0) xor B(0)) and c);
        -- segundo bit
        temp(1) := A(1) xor B(1) xor c;
        c := (A(1) and B(1)) or ((A(1) xor B(1)) and c);
        -- terceiro bit
        temp(2) := A(2) xor B(2) xor c;
        c := (A(2) and B(2)) or ((A(2) xor B(2)) and c);
        -- quarto bit
        temp(3) := A(3) xor B(3) xor c;
        c := (A(3) and B(3)) or ((A(3) xor B(3)) and c);
        -- quinto bit
        temp(4) := A(4) xor B(4) xor c;
        c := (A(4) and B(4)) or ((A(4) xor B(4)) and c);
        -- sexto bit
        temp(5) := A(5) xor B(5) xor c;
        c := (A(5) and B(5)) or ((A(5) xor B(5)) and c);
        -- setimo bit
        temp(6) := A(6) xor B(6) xor c;
        c := (A(6) and B(6)) or ((A(6) xor B(6)) and c);
        -- oitavo bit
        temp(7) := A(7) xor B(7) xor c;
        c := (A(7) and B(7)) or ((A(7) xor B(7)) and c);

        cout <= c;
        s <= temp;

    end process;
end architecture logic;