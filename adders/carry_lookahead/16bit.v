module onesixbit(cin, a, b, cout, sum);
    input cin;
    input [15:0] a, b;
    output cout;
    output [15:0] sum;
    wire c1, c2, c3;

    fourbit A1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(cout1), .s(sum[3:0]));
    fourbit A2(.a(a[7:4]), .b(b[7:4]), .cin(cout1), .cout(cout2), .s(sum[7:4]));
    fourbit A3(.a(a[11:8]), .b(b[11:8]), .cin(cout2), .cout(cout3), .s(sum[11:8]));
    fourbit A4(.a(a[15:12]), .b(b[15:12]), .cin(cout3), .cout(cout), .s(sum[15:12]));
endmodule


module fourbit(a, b, cin, cout, s);
    input [3:0] a, b;
    input cin;     
    output [3:0] s;
    output cout; 
    wire p0, p1, p2, p3;
    wire g0, g1, g2, g3;
    wire c1, c2, c3;
    wire c11, c21, c22, c31, c32, c33, c41, c42, c43, c44; 

   // propgen
    xor Xprop0(p0, a[0], b[0]);
    xor Xprop1(p1, a[1], b[1]);
    xor Xprop2(p2, a[2], b[2]);
    xor Xprop3(p3, a[3], b[3]);
    and Xgen0(g0, a[0], b[0]);
    and Xgen1(g1, a[1], b[1]);
    and Xgen2(g2, a[2], b[2]);
    and Xgen3(g3, a[3], b[3]);

    // carry
    and Xc11(c11, p0, cin);
    or Xco11(c1, g0, c11);
    and Xc21(c21, p1, p0, cin);
    and Xc22(c22, p1, g0);
    or Xco22(c2, c21, c22, g1);
    and Xc31(c31, p2, p1, p0, cin);
    and Xc32(c32, p2, p1, g0);
    and Xc33(c33, p2, g1);
    or Xco33(c3, c31, c32, c33, g2);
    and Xc41(c41, p3, p2, p1, p0, cin);
    and Xc42(c42, p3, p2, p1, g0);
    and Xc43(c43, p3, p2, g1);
    and Xc44(c44, p3, g2);
    or Xco44(cout, c41, c42, c43, c44, g3);

    // sum
    xor Xsum0(s[0], p0, cin);
    xor Xsum1(s[1], p1, c1);
    xor Xsum2(s[2], p2, c2);
    xor Xsum3(s[3], p3, c3);
endmodule
