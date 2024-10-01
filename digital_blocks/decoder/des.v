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
module dec3x8(a, b, c, y0, y1, y2, y3, y4, y5, y6, y7);
    input a, b, c;
    output y0, y1, y2, y3, y4, y5, y6, y7;
    //ive used a, ~a as enable in 3x8 decoder using 2x4 decoders
    dec2x4 D1(b, c, ~a, y0, y1, y2, y3);    // ~a is enable
    dec2x4 D2(b, c, a, y4, y5, y6, y7);     // a is enable
endmodule

