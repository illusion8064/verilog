module fourbit_tb;
    reg [3:0] a, b;
    reg cin;
    wire cout;
    wire [3:0] s;
    fourbit uut(
        .a(a), .b(b), .cin(cin),
        .cout(cout), .s(s)
    );
    initial begin 
        $dumpfile("fourbit_tb.vcd");
        $dumpvars(0, fourbit_tb);
        a = 0; b = 0; cin = 0;
        //test cases
        a = 4'b0001; b = 4'b0010; cin = 1'b1; #5;  // test1: 1 + 2 + 1 = 4
        a = 4'b0011; b = 4'b0101; cin = 1'b0; #5;  // test2: 1 + 2 = 3
        a = 4'b1010; b = 4'b0101; cin = 1'b0; #5;  // test3: 10 + 5 = 15
        a = 4'b1010; b = 4'b1100; cin = 1'b1; #5;  // test3: 10 + 12 + 1 = 23      **************
        a = 4'b1111; b = 4'b0001; cin = 1'b0; #5;  // test4: 15 + 1 = 16 (carry out)
        a = 4'b1111; b = 4'b1111; cin = 1'b0; #5;  // test4: 15 + 15 = 30 (carry out)
        #20 $finish;
    end
endmodule