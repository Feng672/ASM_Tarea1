`timescale 1ns/1ps
module tb;
    reg clk = 1;
    reg reset = 1;
    reg boton = 0;
    reg [3:0] datos = 4'b0000;
    wire [6:0] display;
	 wire motor_out; //Señal añadida para el motor
    
    top DUT(.clk(clk), .reset(reset), .boton(boton), 
            .datos(datos), .display(display), .motor_out(motor_out));
    
    initial begin
        #10 reset = 0;
        
        // Caso 1: 1100 → 3 + 0 = 3
        datos = 4'b1100; #20;
        boton = 1; #10; boton = 0;
        $display("Datos=%b, Display=%b, Motor=%b (3,1 esperado)", datos, display, motor_out);
        
        // Caso 2: 1010 → 2 + 2 = 0
        datos = 4'b1010; #20;
        boton = 1; #10; boton = 0;
        $display("Datos=%b, Display=%b, Motor=%b (0,0 esperado)", datos, display, motor_out);
        
        #20 $finish;
    end
endmodule