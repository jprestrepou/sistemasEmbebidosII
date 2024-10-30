library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb is
end tb;

architecture Behavioral of tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal seg : STD_LOGIC_VECTOR (6 downto 0);
    signal anode : STD_LOGIC_VECTOR (3 downto 0);

    constant clk_period : time := 10 ns;
    
    component contador_7seg
            PORT(clk : in STD_LOGIC;
                 reset : in STD_LOGIC;
                 seg : out STD_LOGIC_VECTOR (6 downto 0);
                 anode : out STD_LOGIC_VECTOR (3 downto 0));
                 
    end component;
    
    begin
        UUT: contador_7seg Port map(
            clk => clk, 
            reset => reset,
            seg => seg, 
            anode => anode
        );
        
     clk_process: process
     begin  
        while true loop 
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
         end loop;
     end process;
     
     stim_proc: process
     begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 200 ns;
      wait for 200 ns;
      
      wait;
      end process;
            
end Behavioral;
