module tristate_b16_tb();

//Generate Inputs
reg       [15:0]        D_IN;
reg       [1:0]          SEL;


//Capture Outputs
wire      [15:0]       D_OUT;

// Instantiate the Unit Under Test (UUT)
tristate_b16 uut(
    .SEL      (SEL),
    .D_IN    (D_IN),
    .D_OUT  (D_OUT)
);

//Encourage
initial begin
        // Initialize Inputs
        D_IN = 16'b0000000000000000;
        SEL   = 1'b0                ;
        

        // Wait 100 ns for global reset to finish
        #100;

        // Add stimulus here
        D_IN <= 16'b1000000000000000;
        SEL   = 1'b0                ;

        #100;
        D_IN <= 16'b0000000000000010;
        SEL   = 1'b1                ;

        #100;
        D_IN <= 16'b0010000000000000;
        SEL   = 1'b0                ;

        #100;
        D_IN <= 16'b0001000000000000;
        SEL   = 1'b1                ;

        #100;
        D_IN <= 16'b0000100000000000;
        SEL   = 1'b0                ;

        #100;
        D_IN <= 16'b0000010000000000;
        SEL   = 1'b1                ;

        #100;
        D_IN <= 16'b0000001000000000;
        SEL   = 1'b0                ;

        #100;
        D_IN <= 16'b0000000100000000;
        SEL   = 1'b1                ;
    end
endmodule