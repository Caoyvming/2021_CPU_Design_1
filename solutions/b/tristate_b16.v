module tristate_b16(
    SEL  ,
    D_IN ,
    D_OUT
);

//inputs
input       [15:0]        D_IN;
input                      SEL;

//outputs
output      [15:0]       D_OUT;

//logic
assign D_OUT = (SEL) ? (D_IN) : (16'bz);

endmodule