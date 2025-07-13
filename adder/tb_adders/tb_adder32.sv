/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : 
* Department     : 
* Author(s)      : Ilya Khmara
* Email(s)       : 

* ------------------------------------------------------------------------------
*/

module tb_adder32();

  logic [31:0] tb_a_in;
  logic [31:0] tb_b_in;
  logic        tb_carry_in;
  logic        tb_carry_out;
  logic [31:0] tb_sum;

  logic clk = 0;
  always #5ns clk = ~clk;

  int err_cnt = 0;

  adder32 DUT (
    .a_in(tb_a_in),
    .b_in(tb_b_in),
    .sum(tb_sum),
    .carry_in(tb_carry_in),
    .carry_out(tb_carry_out)
  );

  initial begin
    $display("Test has been started");
    sequential_add_test();
    random_test();
    $display("\nTest has been finished\nNumber of errors: %d\n", err_cnt);
    $finish();
    #5;
    $display("You're trying to run simulation that has finished. Aborting simulation.");
    $fatal();
  end

  task sequential_add_test();
    @(posedge clk);
    tb_a_in = 0;
    tb_b_in = 0;
    tb_carry_in = 0;
    @(posedge clk);
    for(int i = 0; i < 16; i++) begin
      tb_a_in += 256;
      for(int j = 0; j < 16; j++) begin
        tb_b_in += 256;
        tb_carry_in = ~tb_carry_in;
        @(posedge clk);
      end
    end
  endtask

  task random_test();
    repeat(1e4) begin
      tb_a_in     = $urandom();
      tb_b_in     = $urandom();
      tb_carry_in = $urandom_range(1);
      @(posedge clk);
    end
  endtask

  logic [32:0] reference;
  assign reference = {1'b0, tb_a_in} + {1'b0, tb_b_in} + tb_carry_in;

  sum_check: assert property (
    @(negedge clk)
    reference === {tb_carry_out, tb_sum}
  )
  else begin
    err_cnt++;
    $error("\noperands : a_in = 0x%08h, b_in = 0x%08h, carry_in = %b\nyour res : sum = 0x%08h, carry_out = %b\nreference: sum = 0x%08h, carry_out = %b",
           tb_a_in, tb_b_in, tb_carry_in, tb_sum, tb_carry_out, reference[31:0], reference [32]);
    if(err_cnt == 10) begin
      $display("\nTest has been stopped after 10 errors");
      $stop();
    end
  end
endmodule
