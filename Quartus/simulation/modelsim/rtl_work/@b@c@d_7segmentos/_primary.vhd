library verilog;
use verilog.vl_types.all;
entity BCD_7segmentos is
    port(
        bcd             : in     vl_logic_vector(4 downto 0);
        segmentos       : out    vl_logic_vector(6 downto 0)
    );
end BCD_7segmentos;
