module Decoder38_tb;

    // Inputs
    reg [2:0] data_in;
    reg enable;

    // Outputs
    wire [7:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    Decoder38 uut (
        .data_in(data_in), 
        .data_out(data_out), 
        .enable(enable)
    );

    initial begin
        // Initialize Inputs
        data_in = 0;
        enable = 0;

        // Wait 100 ns for global reset to finish
        #100;
        enable  <= 1'b1;
        // Add stimulus here
        data_in <= 3'b000;
        #100;
        data_in <= 3'b001;
        #100;
        data_in <= 3'b010;
        #100;
        data_in <= 3'b011;
        #100;
        data_in <= 3'b100;
        #100;
        data_in <= 3'b101;
        #100;
        data_in <= 3'b110;
        #100;
        data_in <= 3'b111;
    end
endmodule

