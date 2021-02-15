library verilog;
use verilog.vl_types.all;
entity Filtro_Rebote_tb is
    generic(
        duracion_ms     : integer := 50
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of duracion_ms : constant is 1;
end Filtro_Rebote_tb;
