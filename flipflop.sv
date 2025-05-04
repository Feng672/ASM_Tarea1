module flipflop(
    input clk, reset, boton,
    input [1:0] entrada,
    output reg [1:0] salida
);
    always @(negedge boton or negedge reset) begin 
        if (!reset) 
            salida <= 2'b00;
        else 
            salida <= entrada;
    end
endmodule