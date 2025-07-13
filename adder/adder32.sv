module adder32(
    input logic  [31:0] a_in,
    input logic  [31:0] b_in,
    input logic  carry_in,
    output logic carry_out,
    output logic [31:0] sum
);
    logic [8:0] carry_buf;
    assign carry_buf[0] = carry_in;
    
    adder4 add0(
    .a_in(a_in[3:0]),
    .b_in(b_in[3:0]),
    .carry_in(carry_buf[0]),
    .carry_out(carry_buf[1]),
    .sum(sum[3:0])
    );
    adder4 add1(
    .a_in(a_in[7:4]),
    .b_in(b_in[7:4]),
    .carry_in(carry_buf[1]),
    .carry_out(carry_buf[2]),
    .sum(sum[7:4])
    );
    adder4 add2(
    .a_in(a_in[11:8]),
    .b_in(b_in[11:8]),
    .carry_in(carry_buf[2]),
    .carry_out(carry_buf[3]),
    .sum(sum[11:8])
    );
    adder4 add3(
    .a_in(a_in[15:12]),
    .b_in(b_in[15:12]),
    .carry_in(carry_buf[3]),
    .carry_out(carry_buf[4]),
    .sum(sum[15:12])
    );
    adder4 add4(
    .a_in(a_in[19:16]),
    .b_in(b_in[19:16]),
    .carry_in(carry_buf[4]),
    .carry_out(carry_buf[5]),
    .sum(sum[19:16])
    );
    adder4 add5(
    .a_in(a_in[23:20]),
    .b_in(b_in[23:20]),
    .carry_in(carry_buf[5]),
    .carry_out(carry_buf[6]),
    .sum(sum[23:20])
    );
    adder4 add6(
    .a_in(a_in[27:24]),
    .b_in(b_in[27:24]),
    .carry_in(carry_buf[6]),
    .carry_out(carry_buf[7]),
    .sum(sum[27:24])
    );
    adder4 add7(
    .a_in(a_in[31:28]),
    .b_in(b_in[31:28]),
    .carry_in(carry_buf[7]),
    .carry_out(carry_buf[8]),
    .sum(sum[31:28])
    );
    
    assign carry_out = carry_buf[8];
    
endmodule