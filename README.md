# ece3300L-lab0

# mux_4x1_3_bit.v
module mux_4x1_3bit(
    input  [2:0] x, y, z, w,
    input        s0, s1,
    output [2:0] m,
    output       s0LED, s1LED
    );

    assign s0LED = s0;
    assign s1LED = s1;

    wire [2:0] f, g;

    mux_2x1_3bit M0(.x(x), .y(y), .s(s0), .m(f), .sLED());
    mux_2x1_3bit M1(.x(z), .y(w), .s(s0), .m(g), .sLED());
    mux_2x1_3bit M2(.x(f), .y(g), .s(s1), .m(m), .sLED());

endmodule

# mux_2x1_3_bit.v
module mux_2x1_3bit(
    input  [2:0] x, y,
    input        s,
    output [2:0] m,
    output       sLED
    );

    assign sLED = s;

    mux_2x1_simple M0(x[0], y[0], s, m[0]);
    mux_2x1_simple M1(x[1], y[1], s, m[1]);
    mux_2x1_simple M2(x[2], y[2], s, m[2]);

endmodule

# mux_2x1_behav.v
module mux_2x1_behav(
    input x, y, s,
    output reg m
    );

    always @(*) begin
        if (s) m = y;
        else   m = x;
    end

endmodule

# mux_2x1_simple.v
module mux_2x1_simple(
    input x, y, s,
    output m
    );

    assign m = ~s & x | s & y;

endmodule

# mux_2x1_struct
.v
module mux_2x1_struct(
    input x, y, s,
    output m
    );

    wire ns, a0, a1;

    not g0(ns, s);
    and g1(a0, x, ns);
    and g2(a1, y, s);
    or  g3(m, a0, a1);

endmodule

# nexys-A7-100T-Master_Part2.xdc
## Switches
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports { x[0] }]; 
set_property -dict { PACKAGE_PIN L16  IOSTANDARD LVCMOS33 } [get_ports { x[1] }]; 
set_property -dict { PACKAGE_PIN M13  IOSTANDARD LVCMOS33 } [get_ports { x[2] }]; 
set_property -dict { PACKAGE_PIN R15  IOSTANDARD LVCMOS33 } [get_ports { y[0] }]; 
set_property -dict { PACKAGE_PIN R17  IOSTANDARD LVCMOS33 } [get_ports { y[1] }]; 
set_property -dict { PACKAGE_PIN T18  IOSTANDARD LVCMOS33 } [get_ports { y[2] }]; 
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { z[0] }]; 
set_property -dict { PACKAGE_PIN R13  IOSTANDARD LVCMOS33 } [get_ports { z[1] }]; 
set_property -dict { PACKAGE_PIN T8   IOSTANDARD LVCMOS18 } [get_ports { z[2] }]; 
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS18 } [get_ports { w[0] }]; 
set_property -dict { PACKAGE_PIN R16  IOSTANDARD LVCMOS33 } [get_ports { w[1] }]; 
set_property -dict { PACKAGE_PIN T13  IOSTANDARD LVCMOS33 } [get_ports { w[2] }]; 
set_property -dict { PACKAGE_PIN U11  IOSTANDARD LVCMOS33 } [get_ports { s0 }]; 
set_property -dict { PACKAGE_PIN V10  IOSTANDARD LVCMOS33 } [get_ports { s1 }]; 

## LEDs
set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS33 } [get_ports { m[0] }];
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports { m[1] }];
set_property -dict { PACKAGE_PIN J13  IOSTANDARD LVCMOS33 } [get_ports { m[2] }];
set_property -dict { PACKAGE_PIN V12  IOSTANDARD LVCMOS33 } [get_ports { s0LED }];
set_property -dict { PACKAGE_PIN V11  IOSTANDARD LVCMOS33 } [get_ports { s1LED }];
