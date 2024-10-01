module mux2(a, b, s, y);
    input a, b, s;
    output y;
    wire y1, y2;
    and A1(y1, a, ~s);
    and A2(y2, b, s);
    //as'+bs
    or A3(y, y1, y2);
endmodule
module mux4(a0, a1, a2, a3, s0, s1, y);
    input a0, a1, a2, a3, s0, s1;
    output y;
    wire y1, y2;
    mux2 A1(a0, a1, s0, y1);
    mux2 A2(a2, a3, s0, y2);
    mux2 A3(y1, y2, s1, y);

endmodule
module mux8(a0, a1, a2, a3, a4, a5, a6, a7, s0, s1, s2, y);
    input a0, a1, a2, a3, a4, a5, a6, a7, s0, s1, s2;
    output y;
    wire y1, y2;
    mux4 A1(a0, a1, a2, a3, s0, s1, y1);
    mux4 A2(a4, a5, a6, a7, s0, s1, y2);
    mux2 A3(y1, y2, s2, y);
endmodule