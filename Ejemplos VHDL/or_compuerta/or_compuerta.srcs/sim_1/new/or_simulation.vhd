-- Testbench for OR gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_OR_GATE is
end TB_OR_GATE;

architecture behavior of TB_OR_GATE is

    -- Component Declaration for the OR gate
    component OR_GATE
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
    end component;

    -- Inputs to the OR gate
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';

    -- Output from the OR gate
    signal Y : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: OR_GATE port map (
        A => A,
        B => B,
        Y => Y
    );

    -- Test process to apply stimulus
    stim_proc: process
    begin
        -- Test case 1: A = 0, B = 0
        A <= '0';
        B <= '0';
        wait for 10 ns;
        
        -- Test case 2: A = 0, B = 1
        A <= '0';
        B <= '1';
        wait for 10 ns;

        -- Test case 3: A = 1, B = 0
        A <= '1';
        B <= '0';
        wait for 10 ns;

        -- Test case 4: A = 1, B = 1
        A <= '1';
        B <= '1';
        wait for 10 ns;

        -- Stop simulation
        wait;
    end process;
end behavior;
