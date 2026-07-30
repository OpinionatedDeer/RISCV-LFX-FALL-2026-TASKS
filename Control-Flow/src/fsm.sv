module fsm(
    input wire clk,
    input wire reset,
    output reg [1:0] state,
    input reg [32:0] val,
    reg [23:0] label
    );

    parameter IDLE = 2'b00;
    parameter CHECK = 2'b01;
    parameter ERROR = 2'b10;

    reg [1,0] nextstate;
    
    @always @(posedge clk) begin
    if(reset)
        state <=IDLE;
    else
        state <=nextstate;
    end 

    always @(*) begin
        case (state)
                        
            default : IDLE;
        endcase
    end

    
