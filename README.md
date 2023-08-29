
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/84c06100-dffc-48a1-9b48-fd86f53942bd" alt="Image" width="900">
</p>






# About the repository 

Welcome to my GitHub repository dedicated to VLSI Physical Design for ASICs using open-source tools! Here, we embark on a journey that starts with processor specifications and leverages the power of the RISC-V ISA. We'll build processors from scratch, taking them through the entire RTL to GDS process  that meets various Performance, Power, Area ( PPA ) and manufacturability requirements. The best part? We're doing it all with open-source tools, including the RISC-V toolchain and OpenLane anad many more .
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/00ea3403-674e-4c70-a86e-a4d39aff4ff8" alt="Image" width="600">
</p>



# Table of Contents
+ [Tools Installations](#tools-installation)
+ Week 1:
  - [Day 1: Introduction to RISC-V ISA and GNU Compiler Toolchain](#day-1-introduction-to-risc-v-isa-and-gnu-compiler-toolchain)
  - [Day 2: Introduction to ABI and Basic Verification Flow](#day-2-introduction-to-abi-and-basic-verification-flow)
  - [Day 3: Digital Logic with TL-Verilog and Makerchip](#day-3-digital-logic-with-tl-verilog-and-makerchip)

+ Week 2:

+ Week 3:

+ Week 4:

+ Week 5:



## Requirements:
+ **OS**: Ubuntu 20 +
+ **Memory**: 200 GB
+ **RAM**: 6 GB


## My Device Specs

+ **OS**: Ubuntu 22.04.3 LTS x86_64
+ **Host**: Nitro AN515-44 V1.04
+ **Kernel**: 6.2.0-26-generic
+ **Shell**: bash 5.1.16
+ **DE**: GNOME 42.9
+ **Terminal**: gnome-terminal
+ **CPU**: AMD Ryzen 5 4600H with Radeon Graphics (12)
+ **GPU**: AMD ATI 05:00.0 Renoir
+ **GPU**: NVIDIA 01:00.0 NVIDIA Corporation TU117M
+ **Memory**: 750 GB

## Tools Installations
## Tools Used:
+ **RISC-V GNU Toolchain**: A comprehensive set of tools for compiling and building software to run on RISC-V processors.
+ **RISC-V ISA Simulator**: A RISC-V simulator used for functional verification and testing of RISC-V code without needing actual hardware.
+ **RISC-V Proxy Kernel**: The RISC-V Proxy Kernel, a lightweight execution environment for running user-level applications on RISC-V processors.

Build tool chain and pre-requisite  :  

```
sudo apt update
chmod +x install_tools.sh
./install_tools.sh
```
Errors regarding tools installation are resolved in [Resolve Errors Guide](resolve_errors.md)

<details>
<summary> Week 1 : Building a CPU : </summary>
<br>

 
<details>
<summary> DAY 1: Introduction to RISC-V ISA and GNU Compiler Toolchain </summary>
<br>
	
# Day 1: Introduction to RISC-V ISA and GNU Compiler Toolchain




## Overview from Application to Hardware
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/dd018703-3b2e-464d-8653-d7deb3c9dd6f" alt="Image" width="800">
</p>





- **Apps**: Application software, often referred to as "apps," performs specific tasks or functions for end-users.

- **System Software**: This category acts as an intermediary between hardware components and user-facing applications. It provides essential services, manages resources, and enables application execution.

- **Operating System**: The fundamental software managing hardware resources and offering services for users and applications. It controls memory, processes, files, and interfaces (e.g., Windows, macOS, Linux, Android).

- **Compiler**: Translates high-level programming code( C ,C++ , java etc... ) into assembly-level language.

- **Assembler**: Converts assembly language code into machine code ( 10101011100 ) for direct processor execution. 

- **RTL (Register Transfer Level)**: Represents digital circuit behavior using registers and data transfer operations.

- **Hardware**: Physical components of a computer system or electronic device enabling various tasks.


<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/e72cab48-7bad-409c-bb50-033d6b07816f" alt="Image" width="500">
</p>




## Introduction to RISC-V :
### RISC-V Archiecture 

RISC-V is an **open-source Instruction Set Architecture (ISA)** that has gained significant attention and adoption in computer architecture and semiconductor design. RISC architectures simplify instruction sets by focusing on a smaller set of instructions, each executable in a single clock cycle, leading to faster instruction execution.

### RISC-V Instruction Types

- **R-Type**: Register-type instructions, involving operations between registers. Example: `add`, `and`, `or`.

- **I-Type**: Immediate-type instructions, using immediate values for operations. Example: `addi`, `ori`, `lw`.

- **S-Type**: Store-type instructions, storing data from a register to memory. Example: `sw`, `sb`.

- **B-Type**: Branch-type instructions, conditional branching based on comparisons. Example: `beq`, `bne`, `blt`.

- **U-Type**: Upper immediate-type instructions, used for large immediate values. Example: `lui`, `auipc`.

- **J-Type**: Jump-type instructions, unconditional jumps within the program. Example: `jal`, `jalr`.
  
 In addition to base instruction there are more instruction which help in improving exceution speed like Pseudo Instructions (`li` and `mv`) , Multiply Extension Instructions (`mul`, `mulh`, `mulhu`, and `mulhsu`) , Single and Double Precision Floating Point Extension and so on 

## Labwork for RISC-V software tool chain : 
The main objective of this lab is to compile simple C codes using `gcc compiler`  and run them on native hardware. Similarly, the goal is to compile the same code using `riscv64-unknown-elf-gcc`, execute it on a RISC-V core within a simulator, and understand the process involved. The ultimate goal is to ensure that any high-level program written can be successfully executed on our hardware platform.


A simple c code to find sum from 1 to N : 
```
#include <stdio.h>
int main() {
	int sum=0 , n=5;
	for (int i=0;i<=n;++i)
	{
		sum = sum+i;
	}
	printf("The sum of numbers from 1 to %d is %d\n",n,sum);
	return 0;
}
```
execution command : 
```
gcc sum_1_n.c -o sum_1_n.o
./sum_1_n.o
```
output :
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/d27427ce-ddca-4b77-ae45-bcb0c6184561" alt="Image" width="800">
</p>


compile the same using riscv compiler and view the output


```
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum_obj.o sum_1_n.c
spike pk sum_obj.o
```

<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/d2dd6d12-de08-43a7-a591-e752a6d4c630" alt="Image" width="800">
</p>

Additional info :
- `-O1`: This flag sets the optimization level to low. It balances code size and execution speed while maintaining reasonable compilation times.

- `-mabi=lp64`: This flag defines the ABI (Application Binary Interface) with 64-bit pointers and long integers. It's a common choice for 64-bit RISC-V systems.

- `-march=rv64i`: This flag specifies the target architecture as the base integer-only RISC-V architecture for 64-bit systems. It focuses on the fundamental integer instructions.



TO see the RISC-V disassembled code : 
```
riscv64-unknown-elf-objdump -d sum_obj.o

```
To disassemble the object file and view its contents, use the following command:
```
riscv64-unknown-elf-objdump -d sum_obj.o | less 
```
To navigate through `less` use : 
+ Press /instance to search for a specific instance.
+ Press ENTER to begin the search.
+ To find the next occurrence, press n.
+ To search for the previous occurrence, press N.
+ To exit the less viewer, press esc, type :q, and then press ENTER.

-O1 optimised main 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/ae9a9dbb-cbd1-48b8-a90c-c93c26b7c954" alt="Image" width="800">
</p>
here we see that we have 15 line of code in main

Now let us compile the code use `-Ofast` and see the line of exceution  
```
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum_obj.o sum_1_n.c
```
-Ofast optimised main 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/48573ebe-53df-4967-a806-bf78dcbd859d" alt="Image" width="800">
</p>

here we can see that the code is executed in only 12 lines , which is due to the optimisation we applied 



### Running the Assembly code on simulator in debug mode :
```
spike -d pk sum_obj.o
```

<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/f925a5e5-e264-4e64-9db5-e4098f66fa95" alt="Image" width="800">
</p>





## Integer number representation :
### Unsigned Numbers
Unsigned numbers, also known as non-negative numbers, are numerical values that represent magnitudes without indicating direction or sign.
**Range :** [0, (2^n)-1 ]
### Signed Numbers
Signed numbers are numerical values that can represent both positive and negative magnitudes, along with zero.
**Range :** Positive : [0 , 2^(n-1)-1] Negative : [-1 to 2^(n-1)]

#### To summarise : 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/ecea0456-d480-494f-912d-97f6708d39b5" alt="Image" width="500">
</p>

## LAB for signed and unsigned integer type 

let us run this C code to determine the range of integer type supported by RISC-V 
```

#include <stdio.h>
#include <math.h>

int main() {
    // Declare variables to hold the values
    unsigned long long int a;
    long long int b_max, b_min;

    // Calculate and assign the maximum value of a 64-bit unsigned number
    a = (unsigned long long int)(pow(2, 64) - 1);

    // Calculate and assign the maximum value of a 64-bit signed number
    b_max = (long long int)(pow(2, 63) - 1);

    // Calculate and assign the minimum value of a 64-bit signed number
    b_min = (long long int)(pow(2, 63) * (-1));

    // Print the calculated values
    printf("The max value of 64 bit unsigned number is %llu\n The max number of 64 bit signed number is %lld\n The min value of 64 bit signed number is %lld\n",a,b_max,b_min);

    return 0;
}

```

Output of code snippet : 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/9267a3fc-1134-479e-9274-c9b032dd48bf" alt="Image" width="800">
</p>

we can play around with different values , datatype to find their respect max and min values 


</details>


<details>
<summary> Day 2 : Introduction to ABI and Basic Verification Flow </summary>
<br>
	


# Day 2 : Introduction to ABI and Basic Verification Flow
In Day 2 of your course, you will understanding the RISC-V instruction set architecture (ISA) by exploring the various fields of RISC-V instructions and their functions. This knowledge is crucial for gaining a comprehensive understanding of how RISC-V processors execute instructions and how programs are executed at the hardware level.

## Overview of few instructions :
### R-Type (Register-Type):
Operate on registers with fixed operand format.
Examples: ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU

### I-Type (Immediate-Type):
Immediate operand and one register operand.
Examples: ADDI, SLTI, XORI, LB, LH, LW, JALR

### S-Type (Store-Type):
Store values from registers to memory.
Examples: SB, SH, SW

### B-Type (Branch-Type):
Conditional branching based on comparisons.
Examples: BEQ, BNE, BLT, BGE, BLTU, BGEU

### U-Type (Upper Immediate-Type):
Larger immediate field for encoding larger constants.
Examples: LUI, AUIPC

### J-Type (Jump-Type):
Unconditional jumps and function calls.
Example: JAL



## Example of RISC-V instruction : 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/f8c1fa62-8d2d-4bf4-897b-cca693879e83" alt="Image" width="800">
</p>

- **Opcode [7]:** Indicates the operation type (arithmetic, logic, memory access, control flow) for the instruction, guiding the CPU's execution.
- **rd (Destination Register) [5]:** Represents the destination register, where the operation result will be stored after execution.
- **rs1 (Source Register 1) [5]:** Represents the first source register, holding the value used in the operation (typically first operand).
- **rs2 (Source Register 2) [5]:** Represents the second source register, holding the value used in the operation (typically second operand).
- **func7 and func3 (Function Fields) [7] [3]:** Further specify opcode category and specific operation, enabling more instruction variations.
- **imm (Immediate Value):** Represents an embedded immediate constant within the instruction, used for offsets, constants, or data values.




## Application Binary Interface :

In the context of computer architecture and programming, **ABI** stands for **Application Binary Interface**. It's a set of conventions and rules that dictate how different parts of a software system interact with each other at the binary level. The ABI defines details such as:

+ **Calling Conventions:** Specifies how function calls handle parameters and pass data, including the order of arguments, used registers, and stack frame management.

+ **Register Usage:** Defines how registers are allocated for passing parameters, returning values, and other purposes.

+ **Data Alignment:** Establishes rules for aligning data structures in memory to enhance access efficiency.

+ **Stack Frame Layout:** Determines how the stack is structured during function calls, managing local variable storage.

+ **System Calls:** Describes how applications request services from the operating system through system calls.

+ **Exception Handling:** Outlines how the system manages exceptions like hardware interrupts or software errors.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/e156a95b-5fea-41b6-a00c-822c80e92f11" alt="Image" width="800">
</p>

### 32 - ABI registers in RISC-V and their usage:
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/a7d48468-c612-488f-8ae8-00bfc65cfe65" alt="Image" width="400">
</p>



## Memory Allocations : 
Data can be stored in register by two methods :
+ Directly store in registers
+ Store into registers from memory
  
What sets RISC (Reduced Instruction Set Computer) architecture apart from CISC (Complex Instruction Set Computer) is its emphasis on simplicity and efficiency, particularly regarding memory operations.

In RISC, the load (L) and store (S) instructions play a fundamental role in memory access. They are used to efficiently transfer data between registers and memory. Additionally, arithmetic or logic operations often use register-to-register (reg-to-reg) instructions like ADD.


### CISC VS RISC : 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/96ec694b-698c-4841-8122-07fa477afcd6" alt="Image" width="400">
</p>

  
### RISC-V belongs to **litte endian** memory addressing system 

Consider adding two numbers from memory and storing the result back in memory:

```
LW  R1, 0(R2)      ; Load data from memory into register R1
LW  R3, 4(R2)      ; Load another data from memory into register R3
ADD R4, R1, R3     ; Add data in registers R1 and R3, store result in R4
SW  R4, 8(R2)      ; Store the result in R4 back into memory
 ``` 

### Little-Endian Representation:
In a little-endian system, the least significant byte (LSB) is stored at the lowest memory address, and the most significant byte (MSB) is stored at the highest memory address.

```
Memory Address:   0     1     2     3
Stored Value:    78    56    34    12
```

### Big-Endian Representation:

In a big-endian system, the most significant byte (MSB) is stored at the lowest memory address, and the least significant byte (LSB) is stored at the highest memory address.

```
Memory Address:   0     1     2     3
Stored Value:    12    34    56    78
```

## Lab for ABI function call
This is can interesting lab where we write a code along with assembly code . THe C code calls function to find sum written in the ASM .
we then display the results using c code again .

The algorithm will look like this :

<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/36d03a93-1b54-4120-9a26-3cfad88b71b5" alt="Image" width="600">
</p>

c code snipet : ``` custom_call.c```

```
#include <stdio.h>

extern int load(int x, int y); // Declare the external "load" function

int main() {
  int result = 0;              // Initialize the result variable
  int count = 9;               // Initialize the count variable
  result = load(0x0, count+1); // Call the "load" function with arguments
  printf("Sum of numbers from 1 to 9 is %d\n", result); // Print the result
  return 0;                    // Return 0 to indicate successful execution
}


```
ASM code snipet : ``` load.s```
```
.section .text        # Text section where the code resides
.global load          # Declare the function "load" as global
.type load, @function # Define the type of "load" as a function

load:                 # Start of the "load" function

# Initialize a4 with the value of a0 (copy value from a0 to a4)
add a4, a0, zero

# Copy the value of a1 to a2
add a2, a0, a1

# Initialize a3 with the value of a0 (copy value from a0 to a3)
add a3, a0, zero

loop:                 # Label for the loop

# Add the value in a3 to a4 (accumulate)
add a4, a3, a4

# Increment the value in a3 by 1
addi a3, a3, 1

# Compare a3 with a2 (comparison for loop termination)
blt a3, a2, loop       # Branch to "loop" if a3 < a2

# Copy the accumulated value in a4 to a0 (result)
add a0, a4, zero

ret                    # Return from the function


```


### Simulate C Program using Function Call :
+ **Compilation:** To compile C code and Asseembly file use the command
  ``` riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o custom_call.o custom_call.c load.s ```
  this would generate object file custom_call.o.

+ **Execution:** To execute the object file run the command
```spike pk custom_call.o```

Execution output :
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/df7d18bf-593c-4032-b5ee-85c75321f943" alt="Image" width="1000">
</p>

## Lab : Run C code on a RISC-V CPU
Let us run our simple C code in a RISC-V CPU - PICORV-32 wirtten in verilog .
Steps :
+ We convert our C program to a hex file and load in the memory of CPU
+ Make use of testbech to run the code
+ Display the results

  The picorv design and the shell scripts are already built in a github repo
  ```
  cd
  git clone https://github.com/kunalg123/riscv_workshop_collaterals.git
  
  ```
  Once installed navigate through the ``` riscv_workshop_collaterals/labs```
  run the following command : 
  ```
  chmod 777 rv32im.sh
  ./rv32im.sh
  ```

  <p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/85d17cab-0257-4424-9afe-8bb3053dae4a" alt="Image" width="800">
  </p>
  
snap of testbench showing firmware.hex :
<p align="center">
<img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/952689f9-d156-4805-adc9-a050195cae15" alt="Image" width="800">
  </p>

to make the process easy we make use of shell script : ``` rv32im.sh```

<p align="center">
<img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/db8be006-e39c-4008-9f0e-733f77f0f3c7" alt="Image" width="800">
</p>



</details>



</details>



</details>



</details>


<details>
<summary> Week 2 : RTL Design and Syntheisi </summary>
<br>

<details>
<summary> Day 2 : Introduction to synthesis </summary>
<br>


# Day 1 - Introduction to Verilog RTL design and Synthesis

## Introduction to open-source simulator iverilog
### Introduction to iverilog design test bench
	
+ Design:Design refers to the implementation of a digital circuit or system using Verilog code, or a set of Verilog codes, that is intended to fulfill specific functionality based on given specifications. It involves creating the logical structure of the circuit, including the arrangement of components, interconnections, and the overall behavior of the system.

+ Testbench: A testbench is a specialized environment created to verify and validate the functionality of the design. It serves as a platform for applying various input stimuli to the design and observing the corresponding outputs. The testbench is responsible for generating test cases, monitoring the responses of the design, and comparing the obtained results against expected outcomes.

+ Simulator: A simulator is a software tool used to execute simulations of the Verilog design described in the code. It emulates the behavior of the design under different scenarios by processing the input vectors provided by the testbench. The simulator models the propagation delays, logic gates, and other components defined in the Verilog code, allowing engineers to analyze how the design responds to different input conditions.


### how do simulators works ?
A simulator processes Verilog code, including both the design and the testbench. **It continually monitors input signals for changes**. When inputs change, the simulator evaluates the design's response based on the logic defined in the code. The output is updated accordingly. This process helps simulate the behavior of the digital circuit and verify its functionality.


### Test bench interface :
![image](https://github.com/VardhanSuroshi/demo/assets/132068498/43e2748a-a276-42f6-b0d0-94cf5510ee3d)

### Iverlog tool flow :
- **Testbench and Design:** Create a testbench (stimulus environment) and a Verilog design to be tested.

- **iVerilog:** Use the iVerilog simulator to process the testbench and design. It simulates the behavior of the design based on the provided testbench inputs.

- **VCD File:** The simulation generates a Value Change Dump (VCD) file. This file captures the changing values of signals over time during simulation.

- **GtkWave:** Open the VCD file in GtkWave, a waveform viewer. GtkWave displays the signal waveforms over time, allowing you to visually analyze the behavior of the design and verify its correctness.
![image](https://github.com/VardhanSuroshi/demo/assets/132068498/98a04106-af7f-4541-873b-e07619298904)



## Labs using iverilog and gtkwave


## Introduction to lab
For this lab, we will rely on the following tools:

```iverilog:``` This is an open-source simulator that we'll use for our simulations.

```SKYWATER 130nm PDK: ``` This open-source Process Design Kit (PDK), generously provided by Google, serves as the foundation for our design and synthesis wor

- Begin by making a new directory using the command: ```mkdir Week_2/Day_1```
- Move into the newly created directory with: ```cd Week_2/Day_1```
- Clone a specific repository into this location using: ```git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git```
- This action will establish a directory named `sky130RTLDesignAndSynthesisWorkshop` within the `Week_2/Day_1` directory.
- Inside the `sky130RTLDesignAndSynthesisWorkshop` directory, there will be two distinct folders:
   1. `my_lib`: This folder houses the sky130 standard cell libraries in the liberty format, accompanied by various associated Verilog modules.
   2. `verilog_files`: Within this folder, you'll find all the necessary source code and testbench components required for the lab exercises.



![image](https://github.com/VardhanSuroshi/demo/assets/132068498/0763678d-d468-487e-b5ee-d52069e576da)

To get started, navigate to the verilog_files directory -> ```cd Week_2/Day_1/sky130RTLDesignAndSynthesisWorkshop/verilog_flies```

- Load Design and Testbench:
 Employ the command ```iverilog good_mux.v tb_good_mux.v ``` to load both the design (good_mux.v) and its corresponding testbench (tb_good_mux.v).
 Upon successful loading, an executable named a.out will be generated.
- Generate Simulation Output:
 Execute the newly generated ``./a.out`` executable. This action will result in the creation of a ```tb_good_mux.vcd``` file.

- Visualize with GtkWave:
 Open GtkWave, and load the generated .vcd file (tb_good_mux.vcd).
 Utilize GtkWave's graphical user interface (GUI) to effectively debug and analyze the signals within the simulation.


GTKwave output : 

![image](https://github.com/VardhanSuroshi/demo/assets/132068498/2d3bad61-8bf3-4168-9e53-57e70f47d53d)

lets have a look how mux is designed ```good_mux.v``` : 
```
// Define a module named good_mux
module good_mux (input i0, input i1, input sel, output reg y);
    always @ (*)
    begin
        if (sel)
            y <= i1; // When sel is true, assign i1 to y
        else
            y <= i0; // When sel is false, assign i0 to y
    end
endmodule

```
![image](https://github.com/VardhanSuroshi/demo/assets/132068498/c55b8a8b-a19a-4b20-8556-f1c8fb4c6f42)


Lets look at the testbech file ```tb_good_mux.v```: 
```
timescale 1ns / 1ps

// Define the testbench module
module tb_good_mux;
	// Inputs
	reg i0, i1, sel; // Input registers for data and select signal
	
	// Outputs
	wire y; // Output wire

	// Instantiate the Unit Under Test (UUT)
	good_mux uut (
		.sel(sel), // Connect select signal to the UUT
		.i0(i0),   // Connect input 0 to the UUT
		.i1(i1),   // Connect input 1 to the UUT
		.y(y)      // Connect the output of the UUT to y
	);

	// Initialize simulation and dump VCD file
	initial begin
		$dumpfile("tb_good_mux.vcd");   // Specify the VCD file for waveform dumping
		$dumpvars(0, tb_good_mux);       // Dump variables for simulation
		// Initialize Inputs
		sel = 0;   // Initialize select to 0
		i0 = 0;    // Initialize input 0 to 0
		i1 = 0;    // Initialize input 1 to 0
		#300 $finish;  // Finish simulation after 300 time units
	end

	// Generate clocking signals
	always #75 sel = ~sel;   // Toggle select signal every 75 time units
	always #10 i0 = ~i0;     // Toggle input 0 every 10 time units
	always #55 i1 = ~i1;     // Toggle input 1 every 55 time units
endmodule

```

## RTL synthesis 
### Logic Synthesis

- **Logic Synthesis:** Transforming high-level circuit descriptions into optimized gate-level implementations.

- **Gate-Level Transformation:** Converting abstract circuit representations into logic gate networks.

- **Optimization Techniques:** Streamlining circuits by removing redundancy, minimizing gates, and optimizing fan-out.

- **Library Mapping:**  Using a standard cell library to select logic gates tailored to desired functions.

- **Technology Mapping:** Mapping abstract logic gates to physical cells compatible with target technology.

- **Timing Analysis:** Accounting for gate delays and optimizing paths to meet timing requirements.

- **Verification and Iteration:** Repeating synthesis and verification stages until design meets all goals.

- **Tool Dependence:** Utilizing EDA tools for logic synthesis with algorithms and heuristics.
---

### Standard Cell Library :

The Standard Cell Library is essential in logic design and synthesis:

- **Predefined Logic Gates:** Contains logic gates like AND, OR, NOT, XOR, each with specific functions.

- **Characteristics:** Gates have defined behavior, delay, area, and power usage. Offers versions optimized for speed or power.

- **Compatibility:** Tailored for specific technologies (CMOS, FPGA).
  
- **Hierarchy:** Organized by complexity, from basic gates to flip-flops, adders.

- **Formats:** Available in formats like Liberty (.lib) files.

- **Customization:** Supports creating custom cells for specific needs.

- **Design Impact:** Choice of cells affects speed, area, power.
  
Standard Cell Libraries bridge abstract designs to physical gate-level implementation, crucial for logic synthesis.


![image](https://github.com/VardhanSuroshi/demo/assets/132068498/0ef2a5ce-7178-487e-8335-1a5bd34cc940)




## Introdcution to Yosys :

Yosys is an open-source framework for RTL (Register-Transfer Level) synthesis and optimization of digital designs. It's a command-line tool that takes Verilog (or other HDL) code as input and performs various synthesis and optimization tasks to produce a more efficient gate-level representation of the design.

Yosys can perform operations like technology mapping, constant propagation, optimization of logic structures, and much more. It's a versatile tool often used in digital design flows to generate gate-level netlists from high-level RTL descriptions

### Yosys Flow for Logic Synthesis :

Yosys follows a structured flow for logic synthesis:

1. **RTL Input:** Begin with an RTL (Register-Transfer Level) description in HDL (Hardware Description Language) like Verilog.

2. **Design Analysis:** Perform design analysis to understand the structure, hierarchy, and functionality of the design.

3. **HDL to Logic Gates:** Yosys transforms the RTL description into a network of logic gates.

4. **Technology Mapping:** Map abstract logic gates to cells in the Standard Cell Library.

5. **Optimization:** Apply optimization techniques to reduce area, improve performance, and minimize power.

6. **Timing Analysis:** Analyze and optimize timing to meet specified constraints.

7. **Gate-Level Netlist:** Generate a gate-level netlist, representing the optimized design.

8. **Output Formats:** Yosys can produce output in various formats, including Verilog netlists or EDIF.

9. **Verification and Testing:** Verify the synthesized design's correctness through simulation and formal methods.


Yosys streamlines the process from RTL description to optimized gate-level implementation.

---

let us do a lab where we Verification of Synthesized Netlist of good_mux.v

### The verification of a synthesized netlist involves these steps:

1. **Synthesized RTL Netlist and Testbench:** :Provide the synthesized RTL netlist and its corresponding testbench.

2. **Simulation with Iverilog:** : Use Iverilog to simulate the netlist with the given testbench.

3. **VCD File Generation:** : During simulation, a VCD (Value Change Dump) file is generated.
   
4. **Waveform Comparison:** : Compare the waveform generated by the simulation to the waveform obtained from pre-synthesis.

5. **GtkWave for Analysis:** :Use GtkWave to visually analyze the waveforms and compare them side by side.

6. **Check for Match:** :Check if the post-synthesis waveform matches the expected pre-synthesis waveform.

This process ensures that the synthesized netlist behaves correctly, matching the intended functionality.

---


let try to answer why do we have so many cells in the standard cell library 

#### Variety of Cell Types in Standard Cell Library

In a Standard Cell Library, various types of cells, each optimized for specific design considerations, contribute to design flexibility:

- **High Density Cells:** Optimized for compact layouts, allowing more cells in a given area. Typically have slower operating speeds and lower power consumption.

- **High Speed Cells:** Designed to operate at faster speeds. May consume more power and have larger layouts due to increased complexity.

- **Power Efficient Cells:** Prioritize low power consumption over high-speed operation. May have longer propagation delays to reduce power usage.

- **Mixed-Type Cells:** Combine characteristics of high speed and low power cells. Useful when designs require a balance between speed and energy efficiency.

- **Temperature and Voltage Variants:** Libraries might offer cells optimized for specific temperature ranges or voltage levels.

- **Complex Cells:** Include more complex functionality like multiplexers, adders, and memory elements.

- **Inverter Variants:** Inverters designed for different driving strengths or noise tolerances.

- **Different Fan-out Cells:** Cells optimized for driving varying numbers of fan-out loads.

These diverse cell types cater to different design goals, enabling designers to make informed choices based on performance, area, and power requirements.





## Lab : Hands on Yosys using SKYWATER130 
Steps to Realize good_mux Design using Yosys

To synthesize the `good_mux` design using the `sky130_fd_sc_hd__tt_025C_1v80.lib` library:

1. **Go to Directory:**  Navigate to the `verilog_files` directory.
2. ![image](https://github.com/VardhanSuroshi/demo/assets/132068498/7311dd0b-d333-4dd3-b6f8-0a2e5eaf2343)


3. **Invoke Yosys:** Start Yosys using the command `yosys`.

4. **Read Library:** Load the library using `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`.
5. ![image](https://github.com/VardhanSuroshi/demo/assets/132068498/2c7561ca-bf48-46fd-83c5-90968cde2c5c)


6. **Read Design:** Read the `good_mux.v` design using `read_verilog good_mux.v`.
7. ![image](https://github.com/VardhanSuroshi/demo/assets/132068498/1a64abd3-f290-48b0-964c-cf75097e979e)


8. **Synthesis:**  Perform synthesis on the `good_mux` design using `synth -top good_mux`.
9. ![image](https://github.com/VardhanSuroshi/demo/assets/132068498/d5259f8c-a4f5-4afc-af1e-5047facac0e7)


10. **Generate Netlist:**  Generate a netlist using ABC logic synthesis with `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`.
11. ![image](https://github.com/VardhanSuroshi/demo/assets/132068498/04230a6b-5cdb-4233-9363-6aa86e03bafe)



13. **Show Realized Logic:** Visualize the realized logic using `show`. 
![image](https://github.com/VardhanSuroshi/demo/assets/132068498/743f3492-afed-4c29-9766-3d066772cd79)

14. **Write Netlist:** Save the synthesized netlist using `write_verilog -noattr good_mux_netlist.v`.

15. **Edit Netlist:** Open the netlist in a text editor with `!nvim good_mux_netlist.v`.
![image](https://github.com/VardhanSuroshi/demo/assets/132068498/9b3bcd5c-ce71-4258-82c7-b1c53a179d2b)


These steps transform the `good_mux` design into logic gates from the `sky130_fd_sc_hd__tt_025C_1v80.lib` library, using Yosys for logic synthesis.





# Day 2 - Timing libs, hierarchical vs flat synthesis and efficient flop coding styles







</details>
</details>









