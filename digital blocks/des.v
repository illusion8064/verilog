///// mux
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


///// demux
module demux2(a, s, y0, y1);
    input a,s;
    output y0, y1;
    and A1(y0, a, ~s);
    and A2(y1, a, s);
endmodule
module demux4(a, s0, s1, y0, y1, y2, y3);
    input a, s1, s0;
    output y0, y1, y2, y3;
    and A1(y0, a, ~s0, ~s1);
    and A2(y1, a, s0, ~s1);
    and A3(y2, a, ~s0, s1);
    and A4(y3, a, s0, s1);
endmodule
module demux8(a, s0, s1, s2, y0, y1, y2, y3, y4, y5, y6, y7);
    input a, s2, s1, s0;
    output y0, y1, y2, y3, y4, y5, y6, y7;
    and A7(y0, a, ~s0, ~s1, ~s2);
    and A6(y1, a, s0, ~s1, ~s2);
    and A5(y2, a, ~s0, s1, ~s2);
    and A4(y3, a, s0, s1, ~s2);
    and A3(y4, a, ~s0, ~s1, s2);
    and A2(y5, a, s0, ~s1, s2);
    and A1(y6, a, ~s0, s1, s2);
    and A0(y7, a, s0, s1, s2);
endmodule


//// decoder
module dec1x2(a, en, y0, y1);
    input a, en;
    output y0, y1;
    and A1(y0, ~a, en);
    and A2(y1, a, en);
endmodule
module dec2x4(a, b, en, y0, y1, y2, y3);
    input a, b, en;
    output y0, y1, y2, y3;
    wire p, q;
    // p = a'e, q = ae
    dec1x2 D1(a, en, p, q);
    dec1x2 D2(b, p, y0, y1);
    dec1x2 D3(b, q, y2, y3);
endmodule
module dec3x8(a, b, c, y0, y1, y2, y3, y4, y5,y6, y7);
    input a, b, c;
    output y0, y1, y2, y3, y4, y5,y6, y7;
    //ive used a, ~a as enable in 3x8 decoder using 2x4 decoders
    dec2x4 D1(b, c, ~a, y0, y1, y2, y3);
    dec2x4 D2(b, c, a, y4, y5, y6, y7);
endmodule

