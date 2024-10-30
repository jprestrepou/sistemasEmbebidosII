-- Testbench para la compuerta AND
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_gate is
end tb_and_gate;

architecture Behavioral of tb_and_gate is

    -- Señales para conectar con la compuerta AND
    signal a : STD_LOGIC := '0';
    signal b : STD_LOGIC := '0';
    signal y : STD_LOGIC;

    -- Instancia de la compuerta AND
    component and_gate
        Port (
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            y : out STD_LOGIC
        );
    end component;

begin
    -- Conexión de la instancia con las señales del testbench
    uut: and_gate port map (a => a, b => b, y => y);

    -- Proceso para aplicar las pruebas
    process
    begin
        -- Primera prueba: a = 0, b = 0
        a <= '0';
        b <= '0';
        wait for 10 ns;
        assert (y = '0') report "Error: a=0, b=0, y!=0" severity error;

        -- Segunda prueba: a = 0, b = 1
        a <= '0';
        b <= '1';
        wait for 10 ns;
        assert (y = '0') report "Error: a=0, b=1, y!=0" severity error;

        -- Tercera prueba: a = 1, b = 0
        a <= '1';
        b <= '0';
        wait for 10 ns;
        assert (y = '0') report "Error: a=1, b=0, y!=0" severity error;

        -- Cuarta prueba: a = 1, b = 1
        a <= '1';
        b <= '1';
        wait for 10 ns;
        assert (y = '1') report "Error: a=1, b=1, y!=1" severity error;

        -- Finaliza la simulación
        wait;
    end process;

end Behavioral;

