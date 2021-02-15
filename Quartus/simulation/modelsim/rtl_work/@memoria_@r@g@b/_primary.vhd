library verilog;
use verilog.vl_types.all;
entity Memoria_RGB is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        digito          : in     vl_logic_vector(4 downto 0);
        cambio_digito   : in     vl_logic;
        u               : out    vl_logic_vector(4 downto 0);
        d               : out    vl_logic_vector(4 downto 0);
        c               : out    vl_logic_vector(4 downto 0);
        RGB_full        : out    vl_logic
    );
end Memoria_RGB;
