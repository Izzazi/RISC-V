module adder4(
    input logic  [3:0] a_in,
    input logic  [3:0] b_in,
    input logic  carry_in,
    output logic carry_out,
    output logic [3:0] sum
);
    logic [4:0] carry_buf;
    assign carry_buf[0] = carry_in; 
     
    adder add1(
    .a_in(a_in[0]),
    .b_in(b_in[0]),
    .carry_in(carry_buf[0]),
    .carry_out(carry_buf[1]),
    .sum(sum[0])
    );
    adder add2(
    .a_in(a_in[1]),
    .b_in(b_in[1]),
    .carry_in(carry_buf[1]),
    .carry_out(carry_buf[2]),
    .sum(sum[1])
    );
    adder add3(
    .a_in(a_in[2]),
    .b_in(b_in[2]),
    .carry_in(carry_buf[2]),
    .carry_out(carry_buf[3]),
    .sum(sum[2])
    );
    adder add4(
    .a_in(a_in[3]),
    .b_in(b_in[3]),
    .carry_in(carry_buf[3]),
    .carry_out(carry_buf[4]),
    .sum(sum[3])
    );
    
    assign carry_out = carry_buf[4]; 
    
endmodule