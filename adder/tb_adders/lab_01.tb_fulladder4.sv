/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : 
* Author(s)      : Ilya Khmara
* Email(s)       : 
* ------------------------------------------------------------------------------
*/

module tb_adder4();

  logic [3:0] tb_a_in;
  logic [3:0] tb_b_in;
  logic       tb_carry_in;
  logic       tb_carry_out;
  logic [3:0] tb_sum;
  logic [8:0] test_case;

  adder4 DUT (
    .a_in(tb_a_in),
    .b_in(tb_b_in),
    .sum(tb_sum),
    .carry_in(tb_carry_in),
    .carry_out(tb_carry_out)
  );

  assign {tb_a_in, tb_b_in, tb_carry_in} = test_case;
 
  initial begin
    $display("Test has been started");
    #5ns;
    test_case = 9'd0;
    repeat(512) begin
      #5ns;
      test_case++;
    end
    $display("\nTest has been finished Check results at waveform window.\n");
    $finish();
    #5;
    $display("You're trying to run simulation that has finished. Aborting simulation.");
    $fatal();
  end

endmodule
