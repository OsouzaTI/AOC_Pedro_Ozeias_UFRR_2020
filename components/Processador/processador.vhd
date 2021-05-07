library IEEE;
use IEEE.std_logic_1164.all;

entity processador is
    port(
        clock               : in std_logic; 
        pc_out              : out std_logic_vector (7 downto 0);
        rom_out             : out std_logic_vector (7 downto 0);
        opcode_out          : out std_logic_vector (3 downto 0);
        rs_out              : out std_logic_vector (1 downto 0);
        rt_out              : out std_logic_vector (1 downto 0);
        addr_out            : out std_logic_vector (3 downto 0);
        r_a_out             : out std_logic_vector (7 downto 0);
        r_b_out             : out std_logic_vector (7 downto 0);
        ula_result_out      : out std_logic_vector(7 downto 0);
        ula_overflow_out    : out std_logic;
        ram_out             : out std_logic_vector(7 downto 0);
        mx_2_out            : out std_logic_vector(7 downto 0);
		  print_out				 : out std_logic_vector(7 downto 0)
    );
end entity;

architecture logic of processador is

    component pc is 
        port (
            clock:      in std_logic;
            in_port:    in std_logic_vector(7 downto 0);
            out_port:   out std_logic_vector(7 downto 0)
        );
    end component;

    component contador_sincrono is
        port(
            clock : in std_logic;
            in_a : in std_logic_vector(7 downto 0);
            s_out  : out std_logic_vector(7 downto 0)
        );
    end component;

    component memoria_de_instrucao is
        port(
            in_port: in std_logic_vector(7 downto 0);
            out_op_code: out std_logic_vector(3 downto 0);
            out_rs: out std_logic_vector(1 downto 0);
            out_rt: out std_logic_vector(1 downto 0);
            out_jump: out std_logic_vector(3 downto 0)
        );
    end component;

    component banco_reg IS
        port(
            clock: in std_logic;
            reg_write : in std_logic;
            in_reg_A : in std_logic_vector(1 downto 0);
            in_reg_B : in std_logic_vector(1 downto 0);
            write_data : in std_logic_vector(7 downto 0);
            out_reg_A : out std_logic_vector(7 downto 0);
            out_reg_B : out std_logic_vector(7 downto 0)
        );
    end component;

    component extensor2_8 is
        port(
            in_a : in std_logic_vector(1 downto 0);
            out_b : out std_logic_vector(7 downto 0)
        );
    end component;

    component extensor4_8 is
        port(
            in_a : in std_logic_vector(3 downto 0);
            out_b : out std_logic_vector(7 downto 0)
        );
    end component;

    component p_and is
        port (
            in_port_a : in std_logic;
            in_port_b : in std_logic;
            out_port : out std_logic
        );
    end component;

    component ram is
        port(
            clock : in std_logic;       -- clock
            in_A      : in std_logic_vector(7 downto 0); -- valor
            mem_write : in std_logic;   -- flag de escrita
            mem_read  : in std_logic;   -- flag de leitura
            addr      : in std_logic_vector(7 downto 0); -- endereço
            S_out     : out std_logic_vector(7 downto 0) -- saida
        );
    end component;

    component rom is
        port(
            clock : in std_logic;       -- clock
            in_A      : in std_logic_vector(7 downto 0); -- valor        
            S_out     : out std_logic_vector(7 downto 0) -- saida
        );
    end component;

    component somador8bits is
        port(
            A: in std_logic_vector(7 downto 0);
            B: in std_logic_vector(7 downto 0);
            cin: in std_logic;
            cout: out std_logic;
            s: out std_logic_vector(7 downto 0)
        );
    end component somador8bits;

    component subtrator is
        port(	
            in_a : in std_logic_vector (7 downto 0); 
            in_b : in std_logic_vector (7 downto 0);
            cout : out std_logic; 
            s: out std_logic_vector(7 downto 0)
        );
    end component;

    component mult_2x1 is
        port (
            in_port : in std_logic;
            in_a : in std_logic_vector(7 downto 0);
            in_b : in std_logic_vector(7 downto 0);
            out_port : out std_logic_vector(7 downto 0)
        );
    end component ;

    component multiplicador8bits is
        port(
            in_A  : in std_logic_vector(7 downto 0);   -- Multiplicador 8bits
            in_B  : in std_logic_vector(7 downto 0);   -- Multiplicando 8bits
            S_out : out std_logic_vector(15 downto 0)  -- Saida 16 bits
        );
    end component;

    component ula is
        port(
            clock	: in std_logic;						-- clock				(1bit)
            in_op 	: in std_logic_vector(3 downto 0);	-- operação da ula 		(4bits)
            in_A	: in std_logic_vector(7 downto 0);	-- entrada A			(8bits)
            in_B	: in std_logic_vector(7 downto 0);	-- entrada B			(8bits)
            S_out 	: out std_logic_vector(7 downto 0);	-- S_out				(8bits)
            z_out	: out std_logic;	 					-- Saida zero da ULA	(1bit)
				print_out : out std_logic_vector(7 downto 0);
				ula_overflow	: out std_logic 					-- Overflow de operações da ULA (1bit)
        );
    end component;

    component unidade_de_controle is
        port(
            clock       : in std_logic;
            opcode      : in std_logic_vector(3 downto 0);
            -- reg_dst     : out std_logic;
            jump        : out std_logic;
            branch      : out std_logic;
            memRead     : out std_logic;
            memToReg    : out std_logic;
            ALUOp       : out std_logic_vector(3 downto 0);
            memWrite    : out std_logic;
            AluSrc      : out std_logic;
            RegWrite    : out std_logic
        );
    end component;
	
    -- memoria de instrução
    signal m_rom            : std_logic_vector(7 downto 0); -- 8bits
    signal out_contador_pc  : std_logic_vector(7 downto 0); -- 8bits
    signal out_pc           : std_logic_vector(7 downto 0); -- 8bits

    -- divisao de instrução
    signal opcode   : std_logic_vector(3 downto 0); -- 4bits
    signal rs       : std_logic_vector(1 downto 0); -- 2bits
    signal rt       : std_logic_vector(1 downto 0); -- 2bits
    signal addr     : std_logic_vector(3 downto 0); -- 4bits
    
    -- processos para a unidade de controle (FLAGS)
    --signal f_reg_dst        : std_logic; -- 1bit | Fora da unidade de controle
    signal f_jump           : std_logic; -- 1bit
    signal f_branch         : std_logic; -- 1bit
    signal f_mem_read       : std_logic; -- 1bit
    signal f_mem_to_reg     : std_logic; -- 1bit
    signal f_alu_op         : std_logic_vector(3 downto 0); -- 4bits
    signal f_mem_write      : std_logic; -- 1bit
    signal f_alu_src        : std_logic; -- 1bit
    signal f_reg_write      : std_logic; -- 1bit
	 
    -- regitradores
    signal r_a  : std_logic_vector(7 downto 0);
    signal r_b  : std_logic_vector(7 downto 0);

    -- memoria RAM
    signal m_ram  : std_logic_vector(7 downto 0);
    
    -- multiplexadores
    signal mx1   : std_logic_vector(7 downto 0);
    signal mx2   : std_logic_vector(7 downto 0);
    signal mx3   : std_logic_vector(7 downto 0);
    signal mx4   : std_logic_vector(7 downto 0);
    
    -- sinais da ULA
    signal ula_out          : std_logic_vector(7 downto 0);
    signal ula_z            : std_logic;
    signal system_print     : std_logic_vector(7 downto 0) := "00000000";
	 signal ula_overflow     : std_logic;
    
    signal and_0            : std_logic;

    signal somador_mx_3 : std_logic_vector(7 downto 0);
    signal carry_out_somador_mx_3 : std_logic;
    signal sign_extension_2_8   : std_logic_vector(7 downto 0);
    signal sign_extension_4_8   : std_logic_vector(7 downto 0);

begin
	
	 -- pm : Port Map
	
    -- Incrementador do PC
    pm_somador_pc: contador_sincrono port map(clock, out_pc, out_contador_pc);    
    -- O componente PC propriamente dito
    pm_pc: pc port map(clock, mx4, out_pc);
	 pm_memoria_rom: rom port map(clock, out_pc, m_rom);
	 pm_divisao_instrucao: memoria_de_instrucao port map(m_rom, opcode, rs, rt, addr);
    pm_unidade_controle: unidade_de_controle port map(clock, opcode, f_jump, f_branch, f_mem_read, f_mem_to_reg, f_alu_op, f_mem_write, f_alu_src, f_reg_write);
	 pm_banco_registradores: banco_reg port map(clock, f_reg_write, rs, rt, mx2, r_a, r_b);
	 pm_extensor2_8: extensor2_8 port map(rt, sign_extension_2_8);
	 pm_mx_1: mult_2x1 port map(f_alu_src, r_b, sign_extension_2_8, mx1);
	 pm_ula: ula port map(clock, f_alu_op, r_a, mx1, ula_out, ula_z, system_print, ula_overflow);
	 pm_memoria_ram: ram port map(clock, ula_out, f_mem_write, f_mem_read, sign_extension_2_8, m_ram);
	 pm_mx_2: mult_2x1 port map(f_mem_to_reg, ula_out, m_ram, mx2);
	 pm_extensor4_8: extensor4_8 port map(addr, sign_extension_4_8);
	 pm_and_0: p_and port map(f_branch, ula_z, and_0);
	 pm_mx_3: mult_2x1 port map(and_0, out_contador_pc, sign_extension_4_8, mx3);
	 pm_mx_4: mult_2x1 port map(f_jump, mx3, sign_extension_4_8, mx4);
	 --pm_print: print_helper port map(clock, f_print, m_ram, system_print);
	 
    -- Resultados Saidas
    pc_out              <= out_pc;
    rom_out             <= m_rom;
    opcode_out          <= opcode;
    rs_out              <= rs;
    rt_out              <= rt;
    addr_out            <= addr;
    r_a_out             <= r_a;
    r_b_out             <= r_b;
    ula_result_out      <= ula_out;
    ula_overflow_out    <= ula_overflow;
    ram_out             <= m_ram;
    mx_2_out            <= mx2;
	 print_out 				<= system_print;

end;
