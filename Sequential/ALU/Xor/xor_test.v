`include "xor64bit.v"

`timescale 1ns/1ps 
module xor_test;
reg signed [63:0] a;
reg signed [63:0] b;
wire signed [63:0] result;
xor64bit new(a,b,result);
initial begin
    $dumpfile("test_xor.vcd");
    $dumpvars(0,xor_test);
    a=64'b0000000000000000000000000000000000000000000000000000000000000000;
    b=64'b0000000000000000000000000000000000000000000000000000000000000000;
end

initial begin 
    $monitor(" a= ",a, " b= ",b," result = ",result);
    #5
        // xor without overflow with both positive numbers;
        a=64'b0000000000000000000000000000000000000000000000000000000000000001;
        b=64'b0000000000000000000000000000000000000000000000000000000000000101;
        #5
        // xor without overflow with both negative numbers;
        a=64'b1000000000000000000000000000000000000000000000000000000000000000;
        b=64'b1111111111111111111111111111111111111111111111111111111111111011;
        #5
        // xor without overflow with positive and negative numbers;
        a=64'b0111111111111111111111111111111111111111111111111111111111111111;
        b=64'b1111111111111111111111111111111111111111111111111111111111111011;
        
end
endmodule