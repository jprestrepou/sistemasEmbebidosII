library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_AND_GATE is
--  Port ( );
end TB_AND_GATE;

architecture Behavioral of TB_AND_GATE is

    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal Y : std_logic;
    
    component and_gate
        Port (
            A : in std_logic;
            B : in std_logic;
            Y : out std_logic
            );
    end component;


begin

    UUT: and_gate port map (
        A => A,
        B => B,
        Y => Y
    );
    stim_proc : process
    begin
    A <= '0';
    B <= '0';
    wait for 10 ns;
    
    A <= '0';
    B <= '1';
    wait for 10 ns;
    

    A <= '1';
    B <= '0';
    wait for 10 ns;
    

    A <= '1';
    B <= '1';
    wait for 10 ns;
    
    wait;
   end process;


end Behavioral;
