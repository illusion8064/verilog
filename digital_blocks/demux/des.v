module demux2(a, s, y0, y1);
    input a,s;
    output y0, y1;
    and A1(y0, a, ~s);
    and A2(y1, a, s);
endmodule
module demux4(a, s1, s0, y0, y1, y2, y3);
    input a, s1, s0;
    output y0, y1, y2, y3;
    wire p, q;
    demux2 D1(a, s1, p, q);
    demux2 D2(p, s0, y0, y1);
    demux2 D3(q, s0, y2, y3);
endmodule
module demux8(a, s0, s1, s2, y0, y1, y2, y3, y4, y5, y6, y7);
    input a, s2, s1, s0;
    output y0, y1, y2, y3, y4, y5, y6, y7;
    demux2 D1(a, s2, p, q);
    demux4 D2(p, s1, s0, y0, y1, y2, y3);
    demux4 D3(q, s1, s0, y4, y5, y6, y7);
endmodule