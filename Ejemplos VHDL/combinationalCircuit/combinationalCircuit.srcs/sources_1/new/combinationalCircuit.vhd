library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity combinationalCircuit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Y : out STD_LOGIC);
end combinationalCircuit;

architecture Behavioral of combinationalCircuit is
    
    signal S1 : STD_LOGIC;
    signal S2 : STD_LOGIC;
    signal S3 : STD_LOGIC;
    signal S4 : STD_LOGIC;
    signal S5 : STD_LOGIC;
    signal S6 : STD_LOGIC;
    signal S7 : STD_LOGIC;
    signal S8 : STD_LOGIC;

begin
    S1 <= A and B;
    S2 <= C or D;
    S3 <= not A;
    S4 <= B or C;
    S5 <= D and S3;
    S6 <= S1 or S2;
    S7 <= S4 and S5;
    S8 <= S6 or S7;
    
    Y <= S8;

end Behavioral;
