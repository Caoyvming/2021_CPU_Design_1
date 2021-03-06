module mux16_2to1_tb();

//Generate Inputs
reg       [15:0]       D_IN0;
reg       [15:0]       D_IN1;
reg       [1:0]          SEL;

//Capture Outputs
wire      [15:0]       D_OUT;

// Instantiate the Unit Under Test (UUT)
mux16_2to1 uut(
    .SEL    (SEL),
    .D_IN0  (D_IN0),
    .D_IN1  (D_IN1),
    .D_OUT  (D_OUT)
);

//Encourage
initial begin
        // Initialize Inputs
        D_IN0 = 16'b0000000000000000;
        D_IN1 = 16'b0000000000000000;
        SEL   = 1'b0                ;
        

        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
        D_IN0 <= 16'b0000000000000001;
        D_IN1 <= 16'b1000000000000000;
        SEL   = 1'b0                 ;

        #100;
        D_IN0 <= 16'b0000000000000010;
        D_IN1 <= 16'b0100000000000000;
        SEL   = 1'b1                 ;

        #100;
        D_IN0 <= 16'b0000000000000100;
        D_IN1 <= 16'b0010000000000000;
        SEL   = 1'b0                 ;

        #100;
        D_IN0 <= 16'b0000000000001000;
        D_IN1 <= 16'b0001000000000000;
        SEL   = 1'b1                 ;

        #100;
        D_IN0 <= 16'b0000000000010000;
        D_IN1 <= 16'b0000100000000000;
        SEL   = 1'b0                 ;

        #100;
        D_IN0 <= 16'b0000000000100000;
        D_IN1 <= 16'b0000010000000000;
        SEL   = 1'b1                 ;

        #100;
        D_IN0 <= 16'b0000000001000000;
        D_IN1 <= 16'b0000001000000000;
        SEL   = 1'b0                 ;

        #100;
        D_IN0 <= 16'b0000000010000000;
        D_IN1 <= 16'b0000000100000000;
        SEL   = 1'b1                ;
    end
endmodule