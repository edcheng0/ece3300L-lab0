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
