module fa_test;
    reg a, b, cin;
    wire cout, sum;
    fa uut(
        .a(a), .b(b), .cin(cin),
        .cout(cout), .sum(sum)
    );
    initial begin 
        $dumpfile("fa_test.vcd");
        $dumpvars(0, fa_test);

        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
        #200 $finish;
    end
    always #40 a = ~a;
    always #20 b = ~b;
    always #10 cin = ~cin;
endmodule

module cra4_test;
    reg [3:0] a, b;
    reg cin;
    wire cout;
    wire [3:0] sum;
    cra4 uut(
        .a(a), .b(b), .cin(cin),
        .cout(cout), .sum(sum)
    );
    initial begin 
        $dumpfile("cra4_test.vcd");
        $dumpvars(0, cra4_test);
        //test cases
        a = 4'b0001; b = 4'b0010; cin = 1'b1; #10;  // test1: 1 + 2 + 1 = 4
        a = 4'b0011; b = 4'b0101; cin = 1'b0; #10;  // test2: 1 + 2 = 3
        a = 4'b1010; b = 4'b0101; cin = 1'b0; #10;  // test3: 10 + 5 = 15
        a = 4'b1111; b = 4'b0001; cin = 1'b0; #10;  // test4: 15 + 1 = 16 (carry out)
        a = 4'b1111; b = 4'b1111; cin = 1'b0; #10;  // test4: 15 + 15 = 30 (carry out)
        #50 $finish;
    end
endmodule

module cra16_test;
    reg [15:0] a, b;
    reg cin;
    wire cout;
    wire [15:0] sum;
    cra16 uut(
        .a(a), .b(b), .cin(cin),
        .cout(cout), .sum(sum)
    );
    initial begin 
        $dumpfile("cra16_test.vcd");
        $dumpvars(0, cra16_test);
        //test cases
        a = 16'b1111111111111111; b = 16'b0000000000000001; cin = 1'b0; #10;  // test1: maximum + 1, overflow
        a = 16'b1010101010101010; b = 16'b0101010101010101; cin = 1'b0; #10;  // test2: random values
        a = 16'b1001001001001001; b = 16'b1100101101101101; cin = 1'b0; #10;  // test3: overflow
        a = 16'b0110001110001110; b = 16'b1000100010001000; cin = 1'b0; #10;  // test4: random values
        a = 16'b0100100111000111; b = 16'b1000010000100001; cin = 1'b1; #10;  // test5: random values
        a = 16'b0100110011001100; b = 16'b0100110001101001; cin = 1'b1; #10;  // test6: random values
        a = 16'b0000000000000000; b = 16'b0000000000000000; cin = 1'b0; #10;  // test7: both zero
        a = 16'b1111111111111111; b = 16'b1111111111111111; cin = 1'b0; #10;  // test7: both max, overflow
        #10 $finish;
    end
endmodule