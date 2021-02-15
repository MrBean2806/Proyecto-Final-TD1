library verilog;
use verilog.vl_types.all;
entity Driver_teclado is
    generic(
        fila_1          : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        col_1           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        fila_2          : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        col_2           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        fila_3          : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        col_3           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        fila_4          : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        col_4           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        fila            : in     vl_logic_vector(3 downto 0);
        enter           : in     vl_logic;
        col             : out    vl_logic_vector(3 downto 0);
        digito          : out    vl_logic_vector(4 downto 0);
        enter_sync      : out    vl_logic;
        cambio_digito   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of fila_1 : constant is 1;
    attribute mti_svvh_generic_type of col_1 : constant is 1;
    attribute mti_svvh_generic_type of fila_2 : constant is 1;
    attribute mti_svvh_generic_type of col_2 : constant is 1;
    attribute mti_svvh_generic_type of fila_3 : constant is 1;
    attribute mti_svvh_generic_type of col_3 : constant is 1;
    attribute mti_svvh_generic_type of fila_4 : constant is 1;
    attribute mti_svvh_generic_type of col_4 : constant is 1;
end Driver_teclado;
