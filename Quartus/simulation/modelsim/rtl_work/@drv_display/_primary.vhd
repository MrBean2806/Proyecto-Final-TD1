library verilog;
use verilog.vl_types.all;
entity Drv_display is
    port(
        clk             : in     vl_logic;
        u               : in     vl_logic_vector(4 downto 0);
        d               : in     vl_logic_vector(4 downto 0);
        c               : in     vl_logic_vector(4 downto 0);
        enable          : out    vl_logic_vector(2 downto 0);
        segmentos       : out    vl_logic_vector(6 downto 0)
    );
end Drv_display;
