library verilog;
use verilog.vl_types.all;
entity Temporizador is
    generic(
        r               : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        g               : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        b               : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        start           : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        R_count         : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        G_count         : vl_logic_vector(0 to 1) := (Hi1, Hi1);
        B_count         : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        trigger         : in     vl_logic;
        ciclos_R        : in     vl_logic_vector(4 downto 0);
        ciclos_G        : in     vl_logic_vector(4 downto 0);
        ciclos_B        : in     vl_logic_vector(4 downto 0);
        flags           : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of r : constant is 1;
    attribute mti_svvh_generic_type of g : constant is 1;
    attribute mti_svvh_generic_type of b : constant is 1;
    attribute mti_svvh_generic_type of start : constant is 1;
    attribute mti_svvh_generic_type of R_count : constant is 1;
    attribute mti_svvh_generic_type of G_count : constant is 1;
    attribute mti_svvh_generic_type of B_count : constant is 1;
end Temporizador;
