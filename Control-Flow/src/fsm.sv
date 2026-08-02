`timescale 1ns/1ps

typedef struct packed {
    logic [31:24] opcode;
    logic [23:0] data;
} register;

typedef enum logic [1:0] {
    IDLE  = 2'b00,
    CHECK = 2'b01,
    ERROR = 2'b10
} status;

module fsm(
    input wire clk,
    input wire reset,
    input register a,
    output status state
);

    logic [23:0] label;

    always_ff @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            label <= '0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (a.opcode == 8'h01)
                        label <= a.data;
                    else if(a.opcode == 8'h02)
                        state <= CHECK;
                    else
                        state <= IDLE; //Just being explicit here
                end
                CHECK: begin
                    if (a.opcode== 8'h03)
                        if (a.data == label)
                            state <= IDLE;
                        else 
                            state <= ERROR;
                    else
                        state <= ERROR;
                end

                ERROR: begin
                    state <= ERROR;
                end
                 //Added due to Wall flag basically if no correct value exsist
                 //it will set value to idle
                default: begin 
                    state <=IDLE;
                    label <= '0;
                end
            endcase
        end
    end

endmodule
