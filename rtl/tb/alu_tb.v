`timescale 1ns/1ps

module alu_tb;

    reg  [31:0] A;
    reg  [31:0] B;
    reg  [2:0]  opcode;

    wire [31:0] result;
    wire        zero;
    wire        carry;

    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .zero(zero),
        .carry(carry)
    );

    initial begin

        // Addition
        A = 32'd10;
        B = 32'd5;
        opcode = 3'b000;
        #10;

        // Subtraction
        A = 32'd10;
        B = 32'd5;
        opcode = 3'b001;
        #10;

        // AND
        A = 32'hFF00FF00;
        B = 32'h0F0F0F0F;
        opcode = 3'b010;
        #10;

        // OR
        opcode = 3'b011;
        #10;

        // XOR
        opcode = 3'b100;
        #10;

        // Shift Left
        A = 32'd4;
        opcode = 3'b101;
        #10;

        // Shift Right
        A = 32'd16;
        opcode = 3'b110;
        #10;

        // Compare
        A = 32'd25;
        B = 32'd25;
        opcode = 3'b111;
        #10;

        $finish;

    end

endmodule
