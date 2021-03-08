library verilog;
use verilog.vl_types.all;
entity FSM is
    generic(
        r               : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        g               : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        b               : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        lectura         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        espera          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        carga_R         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        carga_Y         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        carga_B         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RGB_full        : in     vl_logic;
        flags           : in     vl_logic_vector(2 downto 0);
        enter           : in     vl_logic;
        Motores         : out    vl_logic_vector(2 downto 0);
        est             : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of r : constant is 1;
    attribute mti_svvh_generic_type of g : constant is 1;
    attribute mti_svvh_generic_type of b : constant is 1;
    attribute mti_svvh_generic_type of lectura : constant is 1;
    attribute mti_svvh_generic_type of espera : constant is 1;
    attribute mti_svvh_generic_type of carga_R : constant is 1;
    attribute mti_svvh_generic_type of carga_Y : constant is 1;
    attribute mti_svvh_generic_type of carga_B : constant is 1;
end FSM;
