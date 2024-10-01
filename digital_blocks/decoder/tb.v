module dec1x2_test;
    reg a, en;
    wire y0, y1;
    dec1x2 uut (
        .a(a), .en(en),
        .y0(y0), .y1(y1)
    );
    initial begin 
        $dumpfile("dec1x2_test.vcd");
        $dumpvars(0, dec1x2_test);
        a = 1'b0;
        en = 1'b0;
        #200 $finish;
    end
    always #10 a = ~a;
    always #20 en = ~en;
    initial begin 
        $monitor("time = %t \t a = %b \ t en = %b \t y0 = %b \t y1 = %b", $time, a, en, y0, y1);
    end
endmodule
module dec2x4_test;
    reg a, b, en;
    wire y0, y1, y2, y3;
    dec2x4 uut (
        .a(a), .b(b), .en(en),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3)
    );
    initial begin 
        $dumpfile("dec2x4_test.vcd");
        $dumpvars(0, dec2x4_test);
        a = 1'b0;
        b = 1'b0;
        en = 1'b0;
        #200 $finish;
    end
    always #20 a = ~a;
    always #10 b = ~b;
    always #40 en = ~en;
    initial begin 
        $monitor("time = %t \t a = %b \ t b = %b \t en = %b \t y0 = %b \t y1 = %b \t y2 = %b \t y3 = %b", $time, a, b, en, y0, y1, y2, y3);
    end
endmodule
module dec3x8_test;
    reg a, b, c;
    wire y0, y1, y2, y3, y4, y5, y6, y7;
    dec3x8 uut (
        .a(a), .b(b), .c(c),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3),
        .y4(y4), .y5(y5), .y6(y6), .y7(y7)
    );
    initial begin 
        $dumpfile("dec3x8_test.vcd");
        $dumpvars(0, dec3x8_test);
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        #200 $finish;
    end
    always #40 a = ~a;
    always #20 b = ~b;
    always #10 c = ~c;
    initial begin 
        $monitor("time = %t \t a = %b \ t b = %b \t c = %b \t y0 = %b \t y1 = %b \t y2 = %b \t y3 = %b \t y4 = %b \t y5 = %b \t y6 = %b \t y7 = %b", $time, a, b, c, y0, y1, y2, y3, y4, y5, y6, y7);
    end
endmodule