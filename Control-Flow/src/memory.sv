`timescale 1ns/1ps

module memory#(
    parameter string MEMFILE = "tests/pass.mem" // # basically means it is a default paramater.
)(
    input  logic [7:0] addr, //If some one is writing hex which takes more than 8 bits then something is wrong.
    output register instruction
);

    logic [31:0] mem [0:255]; 

    initial begin
        $readmemh(MEMFILE, mem);
    end

    assign instruction = mem[addr]; //Continuous assignment of value
    //todo: Check if continuous is necessary

endmodule
