module tb1;
    reg a, b, c, d;
    wire y, y1, y2, y3, y4, y5;
    des1 uut (
        .a(a), .b(b), .c(c), .d(d),
        .y(y), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5)
    );
    initial begin
        $dumpfile("tb1.vcd");
        $dumpvars(0, tb1.a, tb1.b, tb1.c, tb1.d, tb1.y);
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        #100;
        $finish;
    end
    always #5 a = ~a;
    always #10 b = ~b;
    always #15 c = ~c;
    always #20 d = ~d;
    initial begin
        $monitor("time = %t \t a = %b \t b = %b \t c = %b \t d = %b \t y = %b", $time, a, b, c, d, y);
    end
endmodule

module tb2;
    reg a, b, c, d, e, f;
    wire y, y1, y2, y3, y4, y5, y6, y7;
    des2 uut (
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f),
        .y(y), .y1(y1), .y2(y2), .y3(y3), .y4(y4),
        .y5(y5), .y6(y6), .y7(y7)
    );
    initial begin
        $dumpfile("tb2.vcd");
        $dumpvars(0, tb2.a, tb2.b, tb2.c, tb2.d, tb2.e, tb2.f, tb2.y);
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        e = 1'b0;
        f = 1'b0;
        #200;
        $finish;
    end
    always #5 a = ~a;
    always #10 b = ~b;
    always #15 c = ~c;
    always #20 d = ~d;
    always #25 e = ~e;
    always #30 f = ~f;
    initial begin
        $monitor("time = %t \t a = %b \t b = %b \t c = %b \t d = %b \t e = %b \t f = %b \t y = %b", $time, a, b, c, d, e, f, y);
    end    
endmodule

module tb3;
    reg a, b, c, d, e;
    wire y, y1, y2, y3, y4, y5, y6;
    des3 uut (
        .a(a), .b(b), .c(c), .d(d), .e(e),
        .y(y), .y1(y1), .y2(y2), .y3(y3),
        .y4(y4), .y5(y5), .y6(y6)
    );
    initial begin
        $dumpfile("tb3.vcd");
        $dumpvars(0, tb3.a, tb3.b, tb3.c, tb3.d, tb3.e, tb3.y);
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        e = 1'b0;
        #200;
        $finish;
    end
    always #5 a = ~a;
    always #10 b = ~b;
    always #15 c = ~c;
    always #20 d = ~d;
    always #25 e = ~e;
    initial begin
        $monitor("time = %t \t a = %b \t b = %b \t c = %b \t d = %b \t e = %b \t y = %b", $time, a, b, c, d, e, y);
    end
endmodule

module tb4;
    reg a, b, c, d;
    wire y, y1, y2, y3, y4, y5;
    des4 uut (
        .a(a), .b(b), .c(c), .d(d),
        .y(y), .y1(y1), .y2(y2),
        .y3(y3), .y4(y4), .y5(y5)
    );
    initial begin
        $dumpfile("tb4.vcd");
        $dumpvars(0, tb4.a, tb4.b, tb4.c, tb4.d, tb4.y);
        a = 1'bx;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        #200;
        $finish;
    end
    always #5 a = ~a;
    always #10 b = ~b;
    always #15 c = ~c;
    always #20 d = ~d;
    initial begin
        $monitor("time = %t \t a = %b \t b = %b \t c = %b \t d = %b \t y = %b", $time, a, b, c, d, y);
    end
endmodule

module tb5;
    reg a, b, c, d;
    wire y, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10;
    des5 uut (
        .a(a), .b(b), .c(c), .d(d),
        .y(y), .y1(y1), .y2(y2), .y3(y3),
        .y4(y4), .y5(y5), .y6(y6), .y7(y7),
        .y8(y8), .y9(y9), .y10(y10)
    );
    initial begin
        $dumpfile("tb5.vcd");
        $dumpvars(0, tb5.a, tb5.b, tb5.c, tb5.d, tb5.y);
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        #200;
        $finish;
    end
    always #5 a = ~a;
    always #10 b = ~b;
    always #15 c = ~c;
    always #20 d = ~d;
    initial begin
        $monitor("time = %t \t a = %b \t b = %b \t c = %b \t d = %b \t y = %b", $time, a, b, c, d, y);
    end  
endmodule