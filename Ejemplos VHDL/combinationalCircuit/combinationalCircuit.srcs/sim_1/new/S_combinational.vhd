library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity S_combinational is

end S_combinational;

architecture Behavioral of S_combinational is
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal D : STD_LOGIC := '0';
    signal Y : STD_LOGIC;
    
    component combinationalCircuit
        port ( 
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C : in STD_LOGIC;
            D : in STD_LOGIC;
            Y : out STD_LOGIC);
    end component;
    
begin
    UUT: combinationalCircuit port map (
        A => A,
        B => B,
        C => C,
        D => D,
        Y => Y);
        
    stim_proc: process
    begin
    
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '0';
    wait for 50 ns;
    
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '1';
    wait for 50 ns;
    
    A <= '0';
    B <= '0';
    C <= '1';
    D <= '0';
    wait for 50 ns;

    A <= '0';
    B <= '0';
    C <= '1';
    D <= '1';
    wait for 50 ns;

    A <= '0';
    B <= '1';
    C <= '0';
    D <= '0';
    wait for 50 ns;
    
    A <= '0';
    B <= '1';
    C <= '0';
    D <= '1';
    wait for 50 ns;
    
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '0';
    wait for 50 ns;
    
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 50 ns;
    
    A <= '1';
    B <= '0';
    C <= '0';
    D <= '0';
    wait for 50 ns;
    
    A <= '1';
    B <= '0';
    C <= '0';
    D <= '1';
    wait for 50 ns;
    
    A <= '1';
    B <= '0';
    C <= '1';
    D <= '0';
    wait for 50 ns;
    
    A <= '1';
    B <= '0';
    C <= '1';
    D <= '1';
    wait for 50 ns;
    
    A <= '1';
    B <= '1';
    C <= '0';
    D <= '0';
    wait for 50 ns;
    
    A <= '1';
    B <= '1';
    C <= '0';
    D <= '1';
    wait for 50 ns;
    
    A <= '1';
    B <= '1';
    C <= '1';
    D <= '0';
    wait for 50 ns;
    
    A <= '1';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 50 ns;
    
    wait;
    
  end process;

end Behavioral;
