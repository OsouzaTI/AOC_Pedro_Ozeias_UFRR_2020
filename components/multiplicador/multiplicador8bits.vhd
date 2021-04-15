library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplicador8bits is
    port map(
        in_A  : in std_logic(7 downto 0);   -- Multiplicador 8bits
        in_B  : in std_logic(7 downto 0);   -- Multiplicando 8bits
        S_out : out std_logic(15 downto 0)  -- Saida 16 bits
    );
end entity;

architecture logic of multiplicador8bits is
begin

    process(in_A, in_B)
        -- prenchendo com zeros
        constant zx : std_logic_vector(7 downto 0) := (other => '0');
        constant zy : std_logic_vector(7 downto 0) := (other => '0');
        -- algoritimo de booth
        -- Adição
        variable A : std_logic_vector(16 downto 0);
        -- Subtração
        variable S : std_logic_vector(16 downto 0);
        -- Produto
        variable P : std_logic_vector(16 downto 0);
        variable MN      : std_logic_vector(8 downto 0);
        -- iterador
        variable I : integer;
    begin
        -- preenchendo os primeiros bits de cada linha
        -- com zeros
        A := (others => '0');
        S := (others => '0');
        P := (others => '0');
        
        if in_A /= zx and in_B /= zy then
            -- acessando os bits de [16 ... 9]
            A(16 downto 9) := in_A;
            -- acessando o ultimo bit de A
            A(17) := in_A(7);
            -- complemento de 2
            MN := (not in_A) + 1;
            S(16 downto 9) := MN;
            S(17) := not(in_A(7));
            P(8 downto 1) := in_B;
            
            for I in 1 to 8 loop
                if(P(1 downto 0) = "01") then P := P + A;
                else if (P(1 downto 0) = "10") then P := P + S;
                end if;
                -- TODO : comentar
                P(16 downto 0) := P(17 downto 1);
            end loop;

        end if;
        S_out <= P(16 downto 1);
    end process;
end;