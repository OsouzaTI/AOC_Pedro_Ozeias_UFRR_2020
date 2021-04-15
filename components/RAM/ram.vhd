library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is
    port(
        clock : in std_logic;       -- clock
        in_A      : in std_logic_vector(7 downto 0); -- valor
        mem_write : in std_logic;   -- flag de escrita
        mem_read  : in std_logic;   -- flag de leitura
        addr      : in std_logic_vector(7 downto 0); -- endereço
        S_out     : out std_logic_vector(7 downto 0) -- saida
    );
end entity;

architecture logic of ram is
    -- array de 8 posições contendo vetores lógicos de 8bits
    type mem_t is array (0 to 7) of bit_vector(7 downto 0);
    signal mem : mem_t;    
begin

    process(clock)
    begin

        if(rising_edge(clock)) then
            -- caso a flag de escrita esteja ativada
            if(mem_write = '1') then
                mem(to_integer(unsigned(addr))) <= in_A;
            end if;            
            -- caso a flag de leitura esteja ativada
            if(mem_read = '1') then
                S_out <= ram(to_integer(unsigned(addr)));
            end if;

        end if;

    end process;

end;