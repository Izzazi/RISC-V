/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : National Research University of Electronic Technology (MIET)
* Department     : Institute of Microdevices and Control Systems
* Author(s)      : Ilya Khmara
* Email(s)       : 
* ------------------------------------------------------------------------------
*/

module tb_adder();

  logic tb_a_in;
  logic tb_b_in;
  logic tb_carry_in;
  logic tb_carry_out;
  logic tb_sum;
  logic [2:0] test_case;

  adder DUT (
    .a_in(tb_a_in),
    .b_in(tb_b_in),
    .sum(tb_sum),
    .carry_in(tb_carry_in),
    .carry_out(tb_carry_out)
  );

  assign {tb_a_in, tb_b_in, tb_carry_in} = test_case;

  initial begin
    $display("\nTest has been started\n");
    #5ns;
    test_case = 3'd0;
    repeat(8) begin
      #5ns;
      test_case++;
    end
    $display("\nTest has been finished. Check results at waveform window.\n");
    $finish();
    #5;
    $display("You're trying to run simulation that has finished. Aborting simulation.");
    $fatal();
  end

endmodule
