module xor_estructural(
    output Y,  // Salida primero
    input A,   // Entrada 1
    input B    // Entrada 2
);
    wire not_A, not_B, and1, and2;
    
    not inv1(not_A, A);
    not inv2(not_B, B);
    and and_gate1(and1, A, not_B);
    and and_gate2(and2, not_A, B);
    or or_gate(Y, and1, and2);
endmodule