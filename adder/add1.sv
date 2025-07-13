module adder(
    input logic a_in,
    input logic b_in,
    input logic carry_in,
    output logic carry_out,
    output logic sum);
    
    assign carry_out = (a_in & b_in) |( a_in & carry_in) | (b_in & carry_in);
    assign sum = a_in ^ b_in ^ carry_in;
    
endmodule