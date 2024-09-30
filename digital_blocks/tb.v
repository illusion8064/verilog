//// mux
module mux8_test;
reg a0, a1, a2, a3, a4, a5, a6, a7, s0, s1, s2;
wire y;
mux8 uut(
    .a0(a0), .a1(a1), .a2(a2), .a3(a3),
    .a4(a4), .a5(a5), .a6(a6), .a7(a7),
    .s0(s0), .s1(s1), .s2(s2),
    .y(y)
);
initial begin 
    $dumpfile("mux8_test.vcd");
    $dumpvars(0, mux8_test);
    a0 = 1'b1; a1 = 1'b0; a2 = 1'b1; a3 = 1'b0;
    a4 = 1'b1; a5 = 1'b1; a6 = 1'b0; a7 = 1'b0;
    s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;
    // checking all the eight possible outcomes
    #0 s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;
    #20 s0 = 1'b1; s1 = 1'b0; s2 = 1'b0;
    #20 s0 = 1'b0; s1 = 1'b1; s2 = 1'b0;
    #20 s0 = 1'b1; s1 = 1'b1; s2 = 1'b0;
    #20 s0 = 1'b0; s1 = 1'b0; s2 = 1'b1;
    #20 s0 = 1'b1; s1 = 1'b0; s2 = 1'b1;
    #20 s0 = 1'b0; s1 = 1'b1; s2 = 1'b1;
    #20 s0 = 1'b1; s1 = 1'b1; s2 = 1'b1;
    #20
    $finish;
end
initial begin 
    $monitor("time = %t \t a0 = %b \t a1 = %b \t a2 = %b \t a3 = %b \t a4 = %b \t a5 = %b \t a6 = %b \t a7 = %b \t s0 = %b \t s1 = %b \t s2 = %b \t y = %b", $time, a0, a1, a2, a3, a4, a5, a6, a7, s0, s1, s2, y);
end
endmodule
module mux4_test;
reg a0, a1, a2, a3, s0, s1;
wire y;
mux4 uut(
    .a0(a0), .a1(a1), .a2(a2), .a3(a3),
    .s0(s0), .s1(s1),
    .y(y)
);
initial begin 
    $dumpfile("mux4_test.vcd");
    $dumpvars(0, mux4_test);
    a0 = 1'b0; a1 = 1'b1;
    a2 = 1'b0; a3 = 1'b1;
    s0 = 1'b0; s1 = 1'b0;
    #0 s0 = 1'b0; s1 = 1'b0;
    #20 s0 = 1'b0; s1 = 1'b1;
    #20 s0 = 1'b1; s1 = 1'b0;
    #20 s0 = 1'b1; s1 = 1'b1;
    #20
    $finish;
end
initial begin 
    $monitor("time = %t \t a0 = %b \t a1 = %b \t a2 = %b \t a3 = %b \t s0 = %b \t s1 = %b \t y = %b", $time, a0, a1, a2, a3, s0, s1, y);
end
endmodule
module mux2_test;
    reg a, b, s;
    wire y;
    mux2 uut (
        .a(a), .b(b), .s(s),
        .y(y)
    );
    initial begin
        $dumpfile("mux2_test.vcd");
        $dumpvars(0, mux2_test);
        a = 1'b0;
        b = 1'b1;
        s = 1'b0;
        #0 s = 1'b0;
        #50 s = 1'b1;
        #50
        $finish;
    end
    initial begin
        $monitor("time = %t \t a = %b \t b = %b \t s = %b \t y = %b", $time, a, b, s, y);
    end
endmodule


///// demux
module demux2_test;
    reg a, s;
    wire y0, y1;
    demux2 uut(
        .a(a), .s(s),
        .y0(y0), .y1(y1)
    );
    initial begin 
        $dumpfile("demux2_test.vcd");
        $dumpvars(0, demux2_test);
        a = 0;
        s = 0;
        #100
        $finish;
    end
    always #10 a = ~a;
    always #5 s = ~s;
    initial begin 
        $monitor("time = %t \t a = %b \t s = %b \t y0 = %b \t y1 = %b", $time, a, s, y0, y1);
    end
endmodule
module demux4_test;
    reg a, s1, s0;
    wire y0, y1, y2, y3;
    demux4 uut(
        .a(a), .s0(s0), .s1(s1),
        .y0(y0), .y1(y1),
        .y2(y2), .y3(y3)
    );
    initial begin 
        $dumpfile("demux4_test.vcd");
        $dumpvars(0, demux4_test);
        a = 0;
        s0 = 0;
        s1 = 0;
        #200
        $finish;
    end
    always #20 a = ~a;
    always #5 s0 = ~s0;
    always #10 s1 = ~s1;
    initial begin 
        $monitor("time = %t \t a = %b \t s0 = %b \t s1 = %b \t y0 = %b \t y1 = %b \t y2 = %b \t y3 = %b", $time, a, s0, s1, y0, y1, y2, y3);
    end
endmodule
module demux8_test;
    reg a, s2, s1, s0;
    wire y0, y1, y2, y3, y4, y5, y6, y7;
    demux8 uut(
        .a(a), .s0(s0), .s1(s1), .s2(s2),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3),
        .y4(y4), .y5(y5), .y6(y6), .y7(y7)
    );
    initial begin 
        $dumpfile("demux8_test.vcd");
        $dumpvars(0, demux8_test);
        a = 0;
        s0 = 0;
        s1 = 0;
        s2 = 0;
        #400
        $finish;
    end
    always #40 a = ~a;
    always #5 s0 = ~s0;
    always #10 s1 = ~s1;
    always #20 s2 = ~s2;
    initial begin 
        $monitor("time = %t \t a = %b \t s0 = %b \t s1 = %b \t s2 = %b \t y0 = %b \t y1 = %b \t y2 = %b \t y3 = %b \t y4 = %b \t y5 = %b \t y6 = %b \t y7 = %b", $time, a, s0, s1, s2, y0, y1, y2, y3, y4, y5, y6, y7);
    end
endmodule


//// decoder
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