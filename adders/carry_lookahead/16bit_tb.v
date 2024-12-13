module onesixbit_tb;
    reg [15:0] a, b;
    reg cin;
    wire cout;
    wire [15:0] sum;
    onesixbit uut(
        .a(a), .b(b), .cin(cin),
        .cout(cout), .sum(sum)
    );
    initial begin 
        $dumpfile("onesixbit_tb.vcd");
        $dumpvars(0, onesixbit_tb);
        a = 0; b = 0; cin = 0;
        //test cases
        a = 16'b1111111111111111; b = 16'b0000000000000001; cin = 1'b0; #10;  // test1: maximum + 1, overflow
        a = 16'b1010101010101010; b = 16'b0101010101010101; cin = 1'b0; #10;  // test2: random values
        a = 16'b1001001001001001; b = 16'b1100101101101101; cin = 1'b0; #10;  // test3: overflow
        a = 16'b0110001110001110; b = 16'b1000100010001000; cin = 1'b0; #10;  // test4: random values
        a = 16'b0100100111000111; b = 16'b1000010000100001; cin = 1'b1; #10;  // test5: random values
        a = 16'b0100110011001100; b = 16'b0100110001101001; cin = 1'b1; #10;  // test6: random values
        a = 16'b0000000000000000; b = 16'b0000000000000000; cin = 1'b0; #10;  // test7: both zero
        a = 16'b1111111111111111; b = 16'b1111111111111111; cin = 1'b0; #10;
        #20 $finish;

    end
endmodule