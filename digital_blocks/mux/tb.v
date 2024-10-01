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