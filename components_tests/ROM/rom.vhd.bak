-----------------------------------------------------
-- title       : Memoria ROM
-- project     : Processador X
-- file        : rom.vhd
-- author      : Ozeias Souza
-----------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity rom is
    port(
        clock : in std_logic;       -- clock
        in_A      : in std_logic_vector(7 downto 0); -- valor        
        S_out     : out std_logic_vector(7 downto 0) -- saida
    );
end entity;

architecture logic of rom is
    -- array de 8 posições contendo vetores lógicos de 8bits
    type mem_t is array (0 to 7) of bit_vector(7 downto 0);

    impure function inicializa(nome_do_arquivo : in string) return mem_t is
        file     arquivo  : text open read_mode is nome_do_arquivo;
        variable linha    : line;
        variable temp_bv  : bit_vector(3 downto 0);
        variable temp_mem : mem_t;
        begin
          for i in mem_t'range loop            
            readline(arquivo, linha);            
            read(linha, temp_bv);            
            temp_mem(i) := temp_bv;
          end loop;
          return temp_mem;
        end;
    
    -- carregando arquivo para a memória usando o algoritmo acima
    constant mem : mem_t := inicializa("rom32x4.dat");


begin

    process(clock)
    begin
        S_out <= rom(to_integer(unsigned(in_A)));
    end process;

end;