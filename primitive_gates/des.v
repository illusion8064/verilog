module des(a, b, y_and, y_or, y_nor, y_nand, y_xor, y_not, y_xnor);
    input a,b;
    output y_and, y_or, y_nor, y_nand, y_xor, y_not, y_xnor;

    and A1(y_and, a, b);
    or A2(y_or, a, b);

    nor A3(y_nor, a, b);
    nand A4(y_nand, a, b);

    xor A5(y_xor, a, b);
    xnor A6(y_xnor, a, b);

    not A7(y_not, a);

endmodule
