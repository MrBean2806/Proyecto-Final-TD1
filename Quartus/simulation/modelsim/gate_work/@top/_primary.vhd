library verilog;
use verilog.vl_types.all;
entity Top is
    port(
        clk             : in     vl_logic;
        enter           : in     vl_logic;
        reset           : in     vl_logic;
        fila            : in     vl_logic_vector(3 downto 0);
        col             : out    vl_logic_vector(3 downto 0);
        segmentos       : out    vl_logic_vector(6 downto 0);
        enable          : out    vl_logic_vector(2 downto 0);
        Motores         : out    vl_logic_vector(2 downto 0)
    );
end Top;
