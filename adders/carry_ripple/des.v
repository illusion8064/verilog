module fa(a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;
    wire y1, y2, y3;
    // sum
    xor X1(sum, a, b, cin);
    //cout
    and A1(y1, a, b);
    xor X2(y2, a, b);
    and A2(y3, y2, cin);
    or O1(cout, y1, y3);
endmodule

module cra4(a, b, cin, cout, sum);
    input [3:0] a, b;
    input cin;     
    output [3:0] sum;
    output cout;      
    wire c1, c2, c3; 
    fa F0(
        .a(a[0]), .b(b[0]), .cin(cin), .cout(c1), .sum(sum[0])
    );
    fa F1(
        .a(a[1]), .b(b[1]), .cin(c1), .cout(c2), .sum(sum[1])
    );
    fa F2(
        .a(a[2]), .b(b[2]), .cin(c2), .cout(c3), .sum(sum[2])
    );
    fa F3(
        .a(a[3]), .b(b[3]), .cin(c3), .cout(cout), .sum(sum[3])
    );
endmodule

module cra16(a, b, cin, cout, sum);
    input [15:0] a, b;
    input cin;     
    output [15:0] sum;
    output cout;      
    wire cin1, cin2, cin3; 
    cra4 F0(
        .a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(cin1), .sum(sum[3:0])
    );
    cra4 F1(
        .a(a[7:4]), .b(b[7:4]), .cin(cin1), .cout(cin2), .sum(sum[7:4])
    );
    cra4 F2(
        .a(a[11:8]), .b(b[11:8]), .cin(cin2), .cout(cin3), .sum(sum[11:8])
    );
    cra4 F3(
        .a(a[15:12]), .b(b[15:12]), .cin(cin3), .cout(cout), .sum(sum[15:12])
    );
endmodule