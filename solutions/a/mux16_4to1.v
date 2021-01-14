module mux16_4to1(
    SEL,
    D_IN0,
    D_IN1,
    D_IN2,
    D_IN3,
    D_OUT
);

//inputs
input       [15:0]       D_IN0;
input       [15:0]       D_IN1;
input       [15:0]       D_IN2;
input       [15:0]       D_IN3;
input       [1:0]          SEL;
//outputs
output      [15:0]       D_OUT;

//registers
reg         [15:0]        D_OUT;

//logic
always @(D_IN0,D_IN1,D_IN2,D_IN3,SEL)
        case (SEL)
            2'b00 : D_OUT = D_IN0;
            2'b01 : D_OUT = D_IN1;
            2'b10 : D_OUT = D_IN2;
            2'b11 : D_OUT = D_IN3;
            default : D_OUT = 16'b0000000000000000;
        endcase
endmodule