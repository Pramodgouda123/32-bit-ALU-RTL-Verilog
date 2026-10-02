module alu (
    input  [31:0] A,
    input  [31:0] B,
    input  [2:0]  opcode,
    output reg [31:0] result,
    output reg       zero,
    output reg       carry
);

always @(*) begin

    result = 32'b0;
    carry  = 1'b0;

    case (opcode)

        3'b000: begin
            {carry, result} = A + B;
        end

        3'b001: begin
            result = A - B;
        end

        3'b010: begin
            result = A & B;
        end

        3'b011: begin
            result = A | B;
        end

        3'b100: begin
            result = A ^ B;
        end

        3'b101: begin
            result = A << 1;
        end

        3'b110: begin
            result = A >> 1;
        end

        3'b111: begin
            result = (A == B) ? 32'd1 : 32'd0;
        end

    endcase

    if (result == 32'b0)
        zero = 1'b1;
    else
        zero = 1'b0;

end

endmodule
