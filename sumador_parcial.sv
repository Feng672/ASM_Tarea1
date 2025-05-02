module sumador_parcial(
    input [3:0] datos,
    output reg [1:0] resultado
);
    wire xor1, xor2, and1, xor3;
    
    // Conexiones POR POSICIÓN (salida primero, luego entradas)
    xor_estructural xor0_2(xor1, datos[0], datos[2]);  // xor1 = datos[0] XOR datos[2]
    xor_estructural xor3_1(xor2, datos[3], datos[1]);  // xor2 = datos[3] XOR datos[1]
    and and_bit(and1, datos[0], datos[2]);
	 xor_estructural xorand_xor(xor3, and1, xor2);       
	 
    always @(*) begin
        resultado = {xor3, xor1};
    end
endmodule