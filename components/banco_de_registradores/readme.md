# Entradas
- Clock:
    - Recebe um sinal indicando o clock
    - sinal principal do <b><i>Program Counter</i></b>

- reg_write
    - flag que quando definida, indica ao sistema que sera feita
    a escrita no banco de registradores

- in_reg_A (primeiro registrador)
    - vetor lógico de 2bits que atua como um registrador 
    sendo capaz de armazenar valores decimais de 00 a 11

- in_reg_B (segundo registrador)
    - vetor lógico de 2bits que atua como um registrador 
    sendo capaz de armazenar valores decimais de 00 a 11

- write_data
    - vetor lógico de 8bits representando um valor ao 
    qual sera escrito no banco de registradores

- out_reg_A (primeiro registrador)
    - vetor lógico de 8bits, em operações de leitura de
    registradores este saira

- out_reg_B (segundo registrador)
    - vetor lógico de 8bits, em operações de leitura de
    registradores este saira


# Tipos
-   banco_de_registradores
    - composto por um array de 3 posições com vetores lógicos
    de 8bits.
# Sinais
-   reg
    - sinal do tipo <i>banco_de_registradores</i>


# Funções
## rising_edge
A função rising_edge retorna um valor lógico verdadeiro quando o sinal mudar de um valor baixo ('0', ou 'L') para um valor alto  ('1' ou 'H').
## to_integer
Conversões simples para números inteiros
## unsigned
Tipos agregados (vetores de bits) utilizado em conversões