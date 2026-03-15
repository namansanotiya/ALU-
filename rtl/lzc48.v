
module lzc48 (
    input  wire [47:0] in,
    output reg  [5:0]  lzc,
    output reg         all_zero
);

    integer i;

    always @(*) begin
        lzc      = 6'd48;
        all_zero = 1'b1;

        for (i = 47; i >= 0; i = i - 1) begin
            if (in[i] && all_zero) begin
                lzc      = 6'd47 - i;
                all_zero = 1'b0;
            end
        end
    end

endmodule