`timescale 1ns/1ps

module testrunner;

    parameter string MEMFILE = "tests/pass.mem";

    logic clk;
    logic reset;

    logic [7:0] pc;

    register instruction;
    status state;


    memory #(
        .MEMFILE(MEMFILE)
    ) rom (
        .addr(pc),
        .instruction(instruction)
    );


    fsm alpha (
        .clk(clk),
        .reset(reset),
        .a(instruction),
        .state(state)
    );


    initial begin
        clk = 0;
        forever #100 clk = ~clk; // ~ is a bitwise not operation
    end


    //Program Counter , or Basically address for the mem files
    always_ff @(posedge clk) begin
        if(reset)
            pc <= 0;
        else
            pc <= pc + 1;
    end


    initial begin

        $display("\n\n\nTest Begin:\n");

        reset = 1;
        #100;
        reset = 0;

        // Run program arbitary time (Please update for longer program)
        #1000;

        $display("\nTest End\n");

        $finish;

    end

    //display the internal values
    always @(posedge clk) begin
        $display(
            "time=%0t | PC=%0d | opcode=%h | data=%h | state=%s"
            , $time, pc, instruction.opcode, instruction.data, state.name()
        );
    end


endmodule
