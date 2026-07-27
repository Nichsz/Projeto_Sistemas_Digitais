library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador is
    generic(
        N : integer := 4
    );
    port(
        
        SW_A : in  std_logic_vector(3 downto 0);  
        SW_B : in  std_logic_vector(3 downto 0); 

        HEX0 : out std_logic_vector(7 downto 0);  -- Magnitude do resultado
        HEX1 : out std_logic_vector(7 downto 0);  -- Sinal do resultado
        HEX2 : out std_logic_vector(7 downto 0);  -- Magnitude de B
        HEX3 : out std_logic_vector(7 downto 0);  -- Sinal de B
        HEX4 : out std_logic_vector(7 downto 0);  -- Magnitude de A
        HEX5 : out std_logic_vector(7 downto 0)   -- Sinal de A
    );
end somador;

architecture arch of somador is

    signal a, b                     : std_logic_vector(N-1 downto 0);
    signal mag_a, mag_b             : unsigned(N-2 downto 0);
    signal mag_sum, max, min        : unsigned(N-2 downto 0);
    signal sign_a, sign_b, sign_sum : std_logic;

    signal hex_val_a, hex_val_b, hex_val_sum : std_logic_vector(3 downto 0);

begin

    a <= SW_A;
    b <= SW_B;

    mag_a  <= unsigned(a(N-2 downto 0));
    mag_b  <= unsigned(b(N-2 downto 0));
    sign_a <= a(N-1);
    sign_b <= b(N-1);

    process(mag_a, mag_b, sign_a, sign_b)
    begin
        if mag_a > mag_b then
            max      <= mag_a;
            min      <= mag_b;
            sign_sum <= sign_a;
        else
            max      <= mag_b;
            min      <= mag_a;
            sign_sum <= sign_b;
        end if;
    end process;

    mag_sum <= max + min when sign_a = sign_b else max - min;

    -- HEX5: Sinal de A
    HEX5 <= "10111111" when sign_a = '1' else "11111111";

    -- HEX4: Magnitude de A
    hex_val_a <= "0" & std_logic_vector(mag_a);
    with hex_val_a select
        HEX4(6 downto 0) <=
            "1000000" when "0000",  -- 0
            "1111001" when "0001",  -- 1
            "0100100" when "0010",  -- 2
            "0110000" when "0011",  -- 3
            "0011001" when "0100",  -- 4
            "0010010" when "0101",  -- 5
            "0000010" when "0110",  -- 6
            "1111000" when "0111",  -- 7
            "0000110" when others;  -- E
    HEX4(7) <= '1';  -- Ponto decimal desligado

    -- HEX3: Sinal de B
    HEX3 <= "10111111" when sign_b = '1' else "11111111";

    -- HEX2: Magnitude de B
    hex_val_b <= "0" & std_logic_vector(mag_b);
    with hex_val_b select
        HEX2(6 downto 0) <=
            "1000000" when "0000",  -- 0
            "1111001" when "0001",  -- 1
            "0100100" when "0010",  -- 2
            "0110000" when "0011",  -- 3
            "0011001" when "0100",  -- 4
            "0010010" when "0101",  -- 5
            "0000010" when "0110",  -- 6
            "1111000" when "0111",  -- 7
            "0000110" when others;  -- E
    HEX2(7) <= '1';  -- Ponto decimal desligado

    -- HEX1: Sinal do resultado
    HEX1 <= "10111111" when sign_sum = '1' else "11111111";

    -- HEX0: Magnitude do resultado
    hex_val_sum <= "0" & std_logic_vector(mag_sum);
    with hex_val_sum select
        HEX0(6 downto 0) <=
            "1000000" when "0000",  -- 0
            "1111001" when "0001",  -- 1
            "0100100" when "0010",  -- 2
            "0110000" when "0011",  -- 3
            "0011001" when "0100",  -- 4
            "0010010" when "0101",  -- 5
            "0000010" when "0110",  -- 6
            "1111000" when "0111",  -- 7
            "0000110" when others;  -- E
    HEX0(7) <= '1';  -- Ponto decimal desligado

end arch;