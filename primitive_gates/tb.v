module tb;
    reg a;
    reg b;
    wire y_and, y_or, y_nor, y_nand, y_xor, y_not, y_xnor;

    des uut (
        .a(a), .b(b),
        .y_and(y_and), .y_or(y_or),
        .y_nor(y_nor), .y_nand(y_nand),
        .y_xor(y_xor), .y_xnor(y_xnor),
        .y_not(y_not)
    );

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);
        
        a = 1'b0;
        b = 1'b0;
        #50;
        $finish;
    end

    always #5 a = ~a;
    always #10 b = ~b;
    always@(a)
        $monitor("time = %t \t y_and = %d \t y_or = %d \t y_nor = %d \t y_nand = %d \t y_xor = %d \t y_not = %d \t y_xnor = %d", $time, y_and, y_or, y_nor, y_nand, y_xor, y_not, y_xnor);

endmodule