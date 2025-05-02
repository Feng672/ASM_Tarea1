module top(
    input clk, reset, boton,
    input [3:0] datos,
    output [6:0] display,
    output motor_out  // Bit menos significativo para el motor
);
    wire [1:0] suma_parcial;
    wire [1:0] ff_out;
    
    sumador_parcial SP(.datos(datos), .resultado(suma_parcial));
    flipflop FF(.clk(clk), .reset(reset), .boton(boton), 
               .entrada(suma_parcial), .salida(ff_out));
    decodificador_7seg seg7(.bin(ff_out), .seg(display));
    
    // Asignación directa del bit menos significativo al motor
    assign motor_out = ff_out[0];
endmodule