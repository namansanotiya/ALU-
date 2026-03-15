

module fp_round_nearest_even (
    input  wire [24:0] mantissa_in,  // 25-bit mantissa (extra bits)
    input  wire        guard,         // guard bit
    input  wire        round,         // round bit
    input  wire        sticky,        // sticky bit (OR of remaining bits)
    output reg  [23:0] mantissa_out,  // rounded 24-bit mantissa
    output reg         overflow       // set if rounding causes overflow
);

    wire round_up;

    // IEEE Round to Nearest Even rule:
    // round_up = guard AND (round OR sticky OR LSB)
    assign round_up = guard & (round | sticky | mantissa_in[0]);

    always @(*) begin
        {overflow, mantissa_out} = {1'b0, mantissa_in[24:1]} + round_up;
    end

endmodule