library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contador_7seg is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end contador_7seg;

architecture Behavioral of contador_7seg is
    signal counter : std_logic_vector(3 downto 0) := "0000";
    
begin
    process(clk, reset) 
        begin
            if reset = '1' then
                counter <= "0000";
            elsif rising_edge(clk) then
                counter <= counter + 1;
            end if;
    end process;

process(counter)
begin 
    case counter is 
        when "0000" => seg <= "1000000"; -- 0
        when "0001" => seg <= "1111001"; -- 1
        when "0010" => seg <= "0100100"; -- 2
        when "0011" => seg <= "0110000"; -- 3
        when "0100" => seg <= "0011001"; -- 4
        when "0101" => seg <= "0010010"; -- 5
        when "0110" => seg <= "0000010"; -- 6
        when "0111" => seg <= "1111000"; -- 7
        when "1000" => seg <= "0000000"; -- 8
        when "1001" => seg <= "0010000"; -- 9
        when others => seg <= "1111111"; -- reset
    end case;
 end process;
 
    anode <= "1110";

end Behavioral;
