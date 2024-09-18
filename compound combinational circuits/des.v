// y = ab + cd
// implementation using universal gates (nand, nor)
module des1(a, b, c, d, y, y1, y2, y3, y4, y5);

    input a, b, c, d;
    output y, y1, y2, y3, y4, y5;

    //ab
    nand A1(y1, a, b);
    nand A3(y3, y1, y1);

    //cd
    nand A2(y2, c, d);
    nand A4(y4, y2, y2);

    //ab+cd
    nor A5(y5, y3, y4);
    nor A6(y, y5, y5);

endmodule


// y = (abc+de)f
// implementation using universal gates (nand, nor)
module des2(a, b, c, d, e, f, y, y1, y2, y3, y4, y5, y6, y7);

    input a, b, c, d, e, f;
    output y, y1, y2, y3, y4, y5, y6, y7;

    //abc
    nand A1(y1, a, b, c);
    nand A2(y2, y1, y1);

    //de
    nand A3(y3, d, e);
    nand A4(y4, y3, y3);

    //abc+de
    nor A5(y5, y2, y4);
    nor A6(y6, y5, y5);

    //(abc+de)f
    nand A7(y7, y6, f);
    nand A8(y, y7, y7);

endmodule

//y = ((a+b')(cd+e))'
module des3(a, b, c, d, e, y, y1, y2, y3, y4, y5, y6);

    input a,b,c,d,e;
    output y,y1,y2,y3,y4,y5,y6;

    // (a+b')'
    nor A1(y1, b, b);
    nor A2(y2, y1, a);

    //(cd+e)'
    nand A3(y3, c, d);
    nand A4(y4, y3, y3);
    nor A5(y5, y4, e);

    //(a+b')'+(cd+e)'
    nor A6(y6, y2, y5);
    nor A7(y, y6, y6);

endmodule

// F(A,B,C,D) = Π(1,3,5,7,13,15) = B' + CD'
// implementation using universal gates (nand, nor)
module des4(a, b, c, d, y, y1, y2, y3, y4, y5);

    input a, b, c, d;
    output y, y1, y2, y3, y4, y5;

    //b'
    nor A1(y1, b, b);

    //cd'
    nor A2(y2, d, d);
    nand A3(y3, y2, c);
    nand A4(y4, y3, y3);

    //b' + cd'
    nor A5(y5, y1, y4);
    nor A6(y, y5, y5);

endmodule

// F(A,B,C,D) = Σ(0,6,8,13,14), d(A,B,C,D) = Σ(2,4,10) = D'(B' + C) + ABC'D
// implementation using universal gates (nand, nor)
module des5(a, b, c, d, y, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10);

    input a, b, c, d;
    output y, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10;

    //d'
    nor A1(y1, d, d);

    //b'+c
    nor A2(y2, b, b);
    nor A3(y3, y2, c);
    nor A4(y4, y3, y3);

    //d'(b'+c)
    nand A5(y5, y1, y4);
    nand A6(y6, y5, y5);

    //abc'd
    nor A7(y7, c, c);
    nand A8(y8, a, b, y7, d);
    nand A9(y9, y8, y8);

    //d'(b'+c) + abc'd
    nor A10(y10, y6, y9);
    nor A11(y, y10, y10);

endmodule