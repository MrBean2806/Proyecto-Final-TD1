library verilog;
use verilog.vl_types.all;
entity Filtro_Rebote is
    generic(
        duracion_ms     : integer := 2
    );
    port(
        clk             : in     vl_logic;
        pulso_real      : in     vl_logic;
        pulso_ideal     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of duracion_ms : constant is 1;
end Filtro_Rebote;
