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