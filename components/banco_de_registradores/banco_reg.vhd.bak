-----------------------------------------------------
-- title       : Banco de registradores
-- project     : Processador
-- file        : banco_reg.vhd
-- author      : Ozeias Souza
-----------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity banco_reg IS
    port(
        clock: in std_logic;
        reg_write : in std_logic;
        in_reg_A : in std_logic_vector(1 downto 0);
        in_reg_B : in std_logic_vector(1 downto 0);
        write_data : in std_logic_vector(7 downto 0);
        out_reg_A : out std_logic_vector(7 downto 0);
        out_reg_B : out std_logic_vector(7 downto 0)
    );
end entity;

architecture logic of banco_reg is
    type banco_de_registradores is array(0 to 3) OF std_logic_vector(7 downto 0)
    signal reg : banco_de_registradores;
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if(reg_write = '1') then
                reg(to_integer(unsigned(in_reg_A))) <= write_data;
            end if;
        end if;
    end process;

end