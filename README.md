# CPU 实训 实验一

## 一、实验目的

a)    掌握Modelsim/vivado等工具的使用。

b)   掌握基本RTL组合逻辑电路设计方法；

c)    掌握 Verilog测试程序建模方法；

d)   完成3-8 decoder电路的设计、16位二选一MUX、16位四选一MUX模块设计

e)    完成对上述RTL电路模块的测试程序建模与验证。

f)    上述工作请于本周内完成。

## 二、实验原理

1） 使用**ModelSim2018** 或者**Vivado 2018**完成设计与仿真测试，工具请自行下载安装，并熟悉使用；

2）  RTL模块概述

本实验着重从基本的RTL级电路模块设计入手，采用自底向上的方法完成一个CPU的设计。一个基本的CPU结构组成如图所示，可以看出整个CPU电路是由基本的RTL电路模块构成的。本设计的思路是从大家熟悉的基本数字电路设计开始，逐步完成处理器设计。
![image](http://222.25.174.3:8080/root/2021_01_CPU_Design/raw/branch/master/images/image.png)

3） 基本译码器Decoder电路和复用器电路MUX电路的原理请参考文献[2]的2.8小节和4.3小节。在编写组合逻辑模块时，要特别注意阻塞赋值和非阻塞赋值的使用区别，编写练习时请学习掌握文献[2]的4.5小节的内容。

4）  Verilog或者SystemVerilog语言提供了非常全的测试平台建模语句，输出结果除了通过波形进行显式以外，在testbench测试程序编写中，还可以使用大量的测试验证语句进行结果输出和比对分析。此部分的使用请参考文献[2]的4.9、文献[3]的4.1~4.4、文献[4]的2.1小节。

## 三、参考文献

[1].    《计算机系统概论》Yale N. Patt;
[2].	《数字设计和计算机体系结构》，David Harris；
[3].	《Verilog 高级数字系统设计技术与实例分析》（Advanced Chip Design Practical Examples in Verilog），Kishore Mishra 著；
[4].	《ASIC设计理论与实践——RTL验证、综合与版图设计》，刘雯 主编
[5].	《Advanced Digital Design With the Verilog HDL 2nd Ed 》，Michael D. Ciletti

## 四、实验举例

### a)    3-8译码器的设计：

#### i. 3-8译码器的功能描述：

1. 输入位：[2:0] a

2. 输出位：[7:0] out

3. 3-8译码器真值表：
![image](http://222.25.174.3:8080/root/2021_01_CPU_Design/raw/branch/master/images/Picture3.png)


#### ii. 设计代码：

```verilog
module Decoder38(data_in,data_out,enable);
  input  [2:0] 	data_in;
  input					 enable;
  output [7:0] data_out;
  
  reg		 [7:0] data_out;
  
  always @(data_in, enable) begin
    if (enable == 1)
      case(data_in)
        3'b000: data_out = 8'b00000001;
        3'b001: data_out = 8'b00000010;
        3'b010: data_out = 8'b00000100;
        3'b011: data_out = 8'b00001000;
        3'b100: data_out = 8'b00010000;
        3'b101: data_out = 8'b00100000;
        3'b110: data_out = 8'b01000000;
        3'b111: data_out = 8'b10000000;
        default: data_out = 8'b00000000;
      endcase
    else
      data_out = 8'b00000000;
endmodule   
```

#### iii. 测试代码：

```verilog
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
```

#### 仿真结果：
![image](http://222.25.174.3:8080/root/2021_01_CPU_Design/raw/branch/master/images/Picture1.png)

## 五、实验要求

### a) 16位2选1和4选1数据选择器（mux16_2to1、mux16_4to1）：

#### i.   mux16_4to1 (mux16_2to1)功能描述：

1. 数据输入：[15:0] D_IN0, D_IN1, D_IN2, D_IN3 

2. 数据输出：[15:0] D_OUT

3. 选择位：[1:0] SEL

4. 真值表：

   | SEL  | D_OUT |
   | ---- | ----- |
   | 00   | D_IN0 |
   | 01   | D_IN1 |
   | 10   | D_IN2 |
   | 11   | D_IN3 |

   

### b)  16位三态门：

####  i.   tristate_b16功能描述：

1. 数据输入：[15:0] D_IN

2. 数据输出：[15:0] D_OUT

3. 选择位：SEL

4. 真值表：

| SEL  | D_OUT |
| ---- | ----- |
| 0    | Z     |
| 1    | D_IN  |

### c)  编写上述三个RTL子模块的测试程序，采用Verilog测试程序屏幕输出运算结果。

### d)  本周日之前完成设计、测试代码并提交。

####  
