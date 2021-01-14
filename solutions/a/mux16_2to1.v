module mux16_2to1(
    SEL  ,
    D_IN0,
    D_IN1,
    D_OUT
);

//inputs
input       [15:0]       D_IN0;
input       [15:0]       D_IN1;
input                      SEL;
//outputs
output      [15:0]       D_OUT;


//logic
assign D_OUT = (SEL) ? (D_IN0) : (D_IN1);

endmodule