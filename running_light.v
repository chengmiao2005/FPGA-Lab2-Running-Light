module running_light(
    input        clk,   
    input        reset, 
    output reg [3:0] led 
);

reg [24:0] cnt; 
parameter CNT_MAX = 24_999_999; 

always @(posedge clk or posedge reset) begin
    if (reset) begin 
        cnt <= 0;
        led <= 4'b0001;
    end else begin
        if (cnt < CNT_MAX) begin 
            cnt <= cnt + 1;
        end else begin 
            cnt <= 0;
            led <= {led[2:0], led[3]}; 
        end
    end
end

endmodule




`timescale 1ns / 1ps 
module tb_running_light;
reg        clk;
reg        reset;
wire [3:0] led;
running_light uut (
    .clk(clk),
    .reset(reset),
    .led(led)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    reset = 1; 
    #20;       
    reset = 0; 
    
    #30_000_000; 
    reset = 1;   
    #20;
    reset = 0;
    
    #20_000_000; 
    $finish;     
end

endmodule
