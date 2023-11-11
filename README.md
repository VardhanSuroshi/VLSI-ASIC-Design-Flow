
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/84c06100-dffc-48a1-9b48-fd86f53942bd" alt="Image" width="900">
</p>






# About the repository 

Welcome to my GitHub repository dedicated to VLSI Physical Design for ASICs using open-source tools! Here, we embark on a journey that starts with processor specifications and leverages the power of the RISC-V ISA. We'll build processors from scratch, taking them through the entire RTL to GDS process  that meets various Performance, Power, Area ( PPA ) and manufacturability requirements. The best part? We're doing it all with open-source tools, including the RISC-V toolchain OpenLane and many more.
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/00ea3403-674e-4c70-a86e-a4d39aff4ff8" alt="Image" width="600">
</p>



# Table of Contents
+ [Tools Installations](#tools-installation)
+ **Week 1: Build a RISC-V processor**
  - [Day 1: Introduction to RISC-V ISA and GNU Compiler Toolchain](#day-1-introduction-to-risc-v-isa-and-gnu-compiler-toolchain)
  - [Day 2: Introduction to ABI and Basic Verification Flow](#day-2-introduction-to-abi-and-basic-verification-flow)
  - [Day 3: Digital Logic with TL-Verilog and Makerchip](#day-3-digital-logic-with-tl-verilog-and-makerchip)


+ **Week 2: RTL Design using Verilog with SKY130 Technology**

  - [Day 1: Introduction to RTL Synthesis](#day-1-introduction-to-rtl-synthesis)
  - [Day 2: Introduction to Liberty File](#day-2-introduction-to-liberty-file)
  - [Day 3: Combinational and Sequential Optimizations](#day-3-combinational-and-sequential-optimizations)
  - [Day 4: Gate level Simulation](#day-4-gate-level-simulation)

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
**Week 1:**
+ **RISC-V GNU Toolchain**: A comprehensive set of tools for compiling and building software to run on RISC-V processors.
+ **RISC-V ISA Simulator**: A RISC-V simulator used for functional verification and testing of RISC-V code without needing actual hardware.
+ **RISC-V Proxy Kernel**: The RISC-V Proxy Kernel, is a lightweight execution environment for running user-level applications on RISC-V processors.
+ **Iverilog**: Iverilog is an open-source Verilog simulation and synthesis tool used for designing and verifying digital circuits written in Verilog.

**Week 2:**
+ **Yosys**: Yosys is an open-source RTL synthesis tool used to convert digital designs written in HDLs like Verilog into netlists for FPGA or ASIC implementation.

+ **Iverilog**: Iverilog is an open-source Verilog simulation and synthesis tool used for designing and verifying digital circuits written in Verilog.




Build toolchain and pre-requisite  :  

```
sudo apt update
chmod +x install_tools.sh
./install_tools.sh
chmod +x install_yosys.sh
./install_yosys.sh
```
Errors regarding tools installation are resolved in [Resolve Errors Guide](resolve_errors.md)

<details>
<summary> Week 1: Build a RISC-V processor </summary>
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

- **RTL (Register Transfer Level)**: Represents digital circuit behaviour using registers and data transfer operations.

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
  
 In addition to base instructions there are more instructions that help in improving execution speed like Pseudo Instructions (`li` and `mv`), Multiply Extension Instructions (`mul`, `mulh`, `mulhu`, and `mulhsu`), Single and Double Precision Floating Point Extension and so on 

## Labwork for RISC-V software toolchain : 
The main objective of this lab is to compile simple C codes using `gcc compiler`  and run them on native hardware. Similarly, the goal is to compile the same code using `riscv64-unknown-elf-gcc`, execute it on a RISC-V core within a simulator, and understand the process involved. The ultimate goal is to ensure that any high-level program written can be successfully executed on our hardware platform.


A simple c code to find the sum from 1 to N : 
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


compile the same using RISC-V compiler and view the output


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



To see the RISC-V disassembled code : 
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
+ To exit the less viewer, press ESC, type:q, and then press ENTER.

-O1 optimised main 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/ae9a9dbb-cbd1-48b8-a90c-c93c26b7c954" alt="Image" width="800">
</p>
Here we see that we have 15 lines of code in the main

Now let us compile the code using `-Ofast` and see the line of execution  
```
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum_obj.o sum_1_n.c
```
-Ofast optimised main 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/48573ebe-53df-4967-a806-bf78dcbd859d" alt="Image" width="800">
</p>

here we can see that the code is executed in only 12 lines, which is due to the optimisation we applied 



### Running the Assembly code on the simulator in debug mode :
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

let us run this C code to determine the range of integer types supported by RISC-V 
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

we can play around with different values, data to find their respect max and min values 


</details>


<details>
<summary> Day 2: Introduction to ABI and Basic Verification Flow </summary>
<br>
	


# Day 2: Introduction to ABI and Basic Verification Flow
In Day 2 of your course, you will understand the RISC-V instruction set architecture (ISA) by exploring the various fields of RISC-V instructions and their functions. This knowledge is crucial for gaining a comprehensive understanding of how RISC-V processors execute instructions and how programs are executed at the hardware level.

## Overview of a few instructions :
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
- **rs1 (Source Register 1) [5]:** Represents the first source register, holding the value used in the operation (typically the first operand).
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
Data can be stored in the register by two methods :
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
This is an interesting lab where we write code along with assembly code. The C code calls the function to find the sum written in the ASM.
we then display the results using c code again.

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
+ **Compilation:** To compile C code and Assembly file use the command
  ``` riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o custom_call.o custom_call.c load.s ```
  This would generate an object file custom_call.o.

+ **Execution:** To execute the object file run the command
```spike pk custom_call.o```

Execution output :
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/df7d18bf-593c-4032-b5ee-85c75321f943" alt="Image" width="1000">
</p>

## Lab : Run C code on a RISC-V CPU
Let us run our simple C code in a RISC-V CPU - PICORV-32 wirtten in verilog .
Steps :
+ We convert our C program to a hex file and load it into the memory of the CPU
+ Make use of testbench to run the code
+ Display the results

  The PicoRV32a design and the shell scripts are already built in a GitHub repo
  ```
  cd
  git clone https://github.com/kunalg123/riscv_workshop_collaterals.git
  
  ```
  Once installed navigate through the ``` riscv_workshop_collaterals/labs```
  Run the following command : 
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

to make the process easy we make use of shell script: ``` rv32im.sh```

<p align="center">
<img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/db8be006-e39c-4008-9f0e-733f77f0f3c7" alt="Image" width="800">
</p>



</details>
















</details>





<details>
<summary> Week 2: RTL Design and Synthesis </summary>
<br>

<details>
<summary> Day 1: Introduction to synthesis </summary>
<br>


# Day 1 - Introduction to Verilog RTL Design and Synthesis




## Introduction to open-source simulator iverilog
### Introduction to iverilog design test bench
	
+ Design: Design refers to the implementation of a digital circuit or system using Verilog code, or a set of Verilog codes, that is intended to fulfil specific functionality based on given specifications. It involves creating the logical structure of the circuit, including the arrangement of components, interconnections, and the overall behaviour of the system.

+ Testbench: A testbench is a specialized environment created to verify and validate the functionality of the design. It serves as a platform for applying various input stimuli to the design and observing the corresponding outputs. The testbench is responsible for generating test cases, monitoring the responses of the design, and comparing the obtained results against expected outcomes.

+ Simulator: A simulator is a software tool used to execute simulations of the Verilog design described in the code. It emulates the behaviour of the design under different scenarios by processing the input vectors provided by the testbench. The simulator models the propagation delays, logic gates, and other components defined in the Verilog code, allowing engineers to analyze how the design responds to different input conditions.


### How do simulators work?
A simulator processes Verilog code, including both the design and the testbench. **It continually monitors input signals for changes**. When inputs change, the simulator evaluates the design's response based on the logic defined in the code. The output is updated accordingly. This process helps simulate the behaviour of the digital circuit and verify its functionality.


### Test bench interface :


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/43e2748a-a276-42f6-b0d0-94cf5510ee3d" width="600">
</p>

### Iverlog tool flow :
- **Testbench and Design:** Create a testbench (stimulus environment) and a Verilog design to be tested.

- **iVerilog:** Use the iVerilog simulator to process the testbench and design. It simulates the behaviour of the design based on the provided testbench inputs.

- **VCD File:** The simulation generates a Value Change Dump (VCD) file. This file captures the changing values of signals over time during simulation.

- **GtkWave:** Open the VCD file in GtkWave, a waveform viewer. GtkWave displays the signal waveforms over time, allowing you to visually analyze the behaviour of the design and verify its correctness.



<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/98a04106-af7f-4541-873b-e07619298904" width="600">
</p>



## Labs using iverilog and gtkwave


## Introduction to lab
For this lab, we will rely on the following tools:

```iverilog:``` This is an open-source simulator that we'll use for our simulations.

```SKYWATER 130nm PDK: ``` This open-source Process Design Kit (PDK), generously provided by Google, serves as the foundation for our design and synthesis wor

- Begin by making a new directory using the command: ``` mkdir Week_2/Day_1```
- Move into the newly created directory with ``` cd Week_2/Day_1```
- Clone a specific repository into this location using: ```git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git```
- This action will establish a directory named `sky130RTLDesignAndSynthesisWorkshop` within the `Week_2/Day_1` directory.
- Inside the `sky130RTLDesignAndSynthesisWorkshop` directory, there will be two distinct folders:
   1. `my_lib`: This folder houses the sky130 standard cell libraries in the liberty format, accompanied by various associated Verilog modules.
   2. `verilog_files`: Within this folder, you'll find all the necessary source code and testbench components required for the lab exercises.


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/0763678d-d468-487e-b5ee-d52069e576da" width="600">
</p>




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



<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/2d3bad61-8bf3-4168-9e53-57e70f47d53d" width="600">
</p>


let's have a look at how mux is designed ```good_mux.v``` : 
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


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/c55b8a8b-a19a-4b20-8556-f1c8fb4c6f42" width="300">
</p>



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

- **Verification and Iteration:** Repeating synthesis and verification stages until the design meets all goals.

- **Tool Dependence:** Utilizing EDA tools for logic synthesis with algorithms and heuristics.
---

### Standard Cell Library :

The Standard Cell Library is essential in logic design and synthesis:

- **Predefined Logic Gates:** Contains logic gates like AND, OR, NOT, XOR, each with specific functions.

- **Characteristics:** Gates have defined behaviour, delay, area, and power usage. Offers versions optimized for speed or power.

- **Compatibility:** Tailored for specific technologies (CMOS, FPGA).
  
- **Hierarchy:** Organized by complexity, from basic gates to flip-flops, and adders.

- **Formats:** Available in formats like Liberty (.lib) files.

- **Customization:** Supports creating custom cells for specific needs.

- **Design Impact:** Choice of cells affects speed, area, and power.
  
Standard Cell Libraries bridge abstract designs to physical gate-level implementation, crucial for logic synthesis.




<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/0ef2a5ce-7178-487e-8335-1a5bd34cc940" width="600">
</p>

## Introduction to Yosys :

Yosys is an open-source framework for RTL (Register-Transfer Level) synthesis and optimization of digital designs. It's a command-line tool that takes Verilog (or other HDL) code as input and performs various synthesis and optimization tasks to produce a more efficient gate-level representation of the design.

Yosys can perform operations like technology mapping, constant propagation, optimization of logic structures, and much more. It's a versatile tool often used in digital design flows to generate gate-level netlists from high-level RTL descriptions.



To explore Yosys in more detail and access the Yosys manual, visit the official Yosys documentation:
[Yosys Manual](https://yosyshq.readthedocs.io/projects/yosys/en/latest/index.html#yosys-manual)

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

let us do a lab where we verify of Synthesized Netlist of good_mux.v

### The verification of a synthesized netlist involves these steps:

1. **Synthesized RTL Netlist and Testbench:** Provide the synthesized RTL Netlist and its corresponding testbench.

2. **Simulation with Iverilog:**  Use Iverilog to simulate the netlist with the given testbench.

3. **VCD File Generation:** During simulation, a VCD (Value Change Dump) file is generated.
   
4. **Waveform Comparison:**  Compare the waveform generated by the simulation to the waveform obtained from pre-synthesis.

5. **GtkWave for Analysis:** Use GtkWave to visually analyze the waveforms and compare them side by side.

6. **Check for Match:** Check if the post-synthesis waveform matches the expected pre-synthesis waveform.

This process ensures that the synthesized netlist behaves correctly, matching the intended functionality.

---


let's try to answer why we have so many cells in the standard cell library 

#### Variety of Cell Types in Standard Cell Library

In a Standard Cell Library, various types of cells, each optimized for specific design considerations, contribute to design flexibility:

- **High-Density Cells:** Optimized for compact layouts, allowing more cells in a given area. Typically have slower operating speeds and lower power consumption.

- **High-Speed Cells:** Designed to operate at faster speeds. May consume more power and have larger layouts due to increased complexity.

- **Power Efficient Cells:** Prioritize low power consumption over high-speed operation. May have longer propagation delays to reduce power usage.

- **Mixed-Type Cells:** Combine characteristics of high-speed and low-power cells. Useful when designs require a balance between speed and energy efficiency.

- **Temperature and Voltage Variants:** Libraries might offer cells optimized for specific temperature ranges or voltage levels.

- **Complex Cells:** Include more complex functionality like multiplexers, adders, and memory elements.

- **Inverter Variants:** Inverters designed for different driving strengths or noise tolerances.

- **Different Fan-out Cells:** Cells optimized for driving varying numbers of fan-out loads.

These diverse cell types cater to different design goals, enabling designers to make informed choices based on performance, area, and power requirements.





## Lab: Hands-on Yosys using SKYWATER130 
Steps to Realize good_mux Design using Yosys

To synthesize the `good_mux` design using the `sky130_fd_sc_hd__tt_025C_1v80.lib` library:

1. **Go to Directory:**  Navigate to the `verilog_files` directory.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/7311dd0b-d333-4dd3-b6f8-0a2e5eaf2343" width="600">
</p>




3. **Invoke Yosys:** Start Yosys using the command `yosys`.

4. **Read Library:** Load the library using `read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/2c7561ca-bf48-46fd-83c5-90968cde2c5c" width="600">
</p>


6. **Read Design:** Read the `good_mux.v` design using `read_verilog good_mux.v`.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/1a64abd3-f290-48b0-964c-cf75097e979e" width="600">
</p>


8. **Synthesis:**  Perform synthesis on the `good_mux` design using `synth -top good_mux`.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/d5259f8c-a4f5-4afc-af1e-5047facac0e7" width="600">
</p>


10. **Generate Netlist:**  Generate a netlist using ABC logic synthesis with `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/04230a6b-5cdb-4233-9363-6aa86e03bafe" width="600">
</p>



13. **Show Realized Logic:** Visualize the realized logic using `show`. 


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/743f3492-afed-4c29-9766-3d066772cd79" width="600">
</p>

14. **Write Netlist:** Save the synthesized netlist using `write_verilog -noattr good_mux_netlist.v`.

15. **Edit Netlist:** Open the netlist in a text editor with `!nvim good_mux_netlist.v`.


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/9b3bcd5c-ce71-4258-82c7-b1c53a179d2b" width="600">
</p>

These steps transform the `good_mux` design into logic gates from the `sky130_fd_sc_hd__tt_025C_1v80.lib` library, using Yosys for logic synthesis.

</details>


<details>
<summary> Day 2: Timing libs, hierarchical vs. flat synthesis and efficient flop coding styles </summary>
<br>


# Day 2 - Timing libs, hierarchical vs. flat synthesis and efficient flop coding styles

# Introduction to Liberty file ( .lib file )
A Liberty file, often denoted as ".lib" in VLSI (Very Large Scale Integration) design, is a critical technical resource. It encapsulates precise timing and power characteristics of standard cells within a semiconductor library. These characteristics include essential information such as cell delay, setup and hold times, power consumption, and more. The Liberty file is indispensable for accurate and efficient digital circuit design, enabling designers to analyze and optimize their circuits for performance, power efficiency, and timing accuracy.

---

Generalized naming format for VLSI 

The naming convention for VLSI libraries typically follows the structure below:
```<Foundry/Technology>_<LibraryCategory>_<LibraryName>_<LibraryVariant>_<Temperature>_<SupplyVoltage>.lib```


- `<Foundry/Technology>`: Denotes the semiconductor foundry or technology process used for the library.

- `<LibraryCategory>`: Signifies the category of the library, such as "fd" for fundamental or standard cell libraries.

- `<LibraryName>`: Indicates the specific name of the library within the category, housing various standard cell designs.

- `<LibraryVariant>`: Denotes the library variant or version, often reflecting specific characteristics or features.

- `<Temperature>`: Represents the temperature at which the library is characterized, typically in degrees Celsius.

- `<SupplyVoltage>`: Specifies the supply voltage at which the library is characterized, often in volts.

Using this generalized format, you can create consistent and informative library names that convey essential details about the library's characteristics and conditions of use in VLSI design.


---
The naming convention "sky130_fd_sc_hd__tt_025C_1v80.lib" that we are making use of can be broken down as follows:


- `sky130`: Denotes the technology or foundry.
- `fd`: Signifies the library category. ( fd- foundation )
- `sc`: Indicates the specific library name. ( sc-standard cell )
- `hd`: Represents the library variant or version. ( high density )
- `tt_025C`: Refers to the temperature (e.g., typical temperature 25°C).
- `1v80`: Specifies the supply voltage (e.g., 1.80 volts).

## Hierarchical Synthesis vs. Flat Synthesis

### Hierarchical Synthesis

Hierarchical synthesis is a design approach that involves breaking down a complex design into logical modules or blocks and synthesizing each module separately. Each module can have its own hierarchy and communicate with other modules through well-defined interfaces. This approach offers several advantages:

### Advantages of Hierarchical Synthesis

1. **Enhanced Reusability:** Individual modules can be designed and tested independently, making it easier to reuse them in other designs. This can save time and effort in future projects.

2. **Improved Maintainability:** Hierarchical synthesis promotes a clean and organized design structure. Debugging and making changes to specific modules are more manageable because they are isolated from the rest of the design.

3. **Scalability:** It is well-suited for large and complex designs as the hierarchy allows for a structured approach to managing complexity.




### Steps for Hierarchical Synthesis

Follow these steps for hierarchical synthesis using Yosys:

1. Navigate to the `verilog_files` directory.
2. Invoke Yosys using the command `yosys`.
3. Once Yosys is running, enter the following sequence of commands:

   ```
   read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
   read_verilog multiple_modules.v
   synth -top multiple_modules
   abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
   show multiple_modules
   write_verilog -noattr multiple_modules_hier.v
   !nvim multiple_modules_hier.v
   
   ```
RTL of Hierarchical Synthesis


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/c36d8aac-8a16-4ce2-a3bc-8a10949a5e09" width="600">
</p>


### Flat Synthesis

Flat synthesis is an alternative design approach where the entire design is synthesized as a single, monolithic entity. In this approach, all modules, submodules, and logic are flattened into a single level of hierarchy. This method is best suited for simpler designs where complexity is low, and maintainability is not a significant concern.

### Advantages of Flat Synthesis

1. **Simplicity:** Flat synthesis is straightforward and may be appropriate for small, uncomplicated designs where hierarchy introduces unnecessary complexity.

2. **Predictability:** There is no hierarchy to manage, which can make it easier to predict how the design will behave.

### Steps for Flat Synthesis

To perform flat synthesis using Yosys, follow these steps:

1. Navigate to the `verilog_files` directory.

2. Invoke Yosys using the command `yosys`.

3. Once Yosys is running, enter the following sequence of commands:

```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog multiple_modules.v
synth -top multiple_modules
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
flatten  # This step is crucial because it flattens the design, removing any hierarchy and combining all modules into a single level. This is the key step in achieving a flat synthesis.
show
write_verilog -noattr multiple_modules_flat.v
!nvim multiple_modules_flat.v

```


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/ef1de510-125f-416d-b68e-875be15ee089" width="600">
</p>




---

### Notes on Hierarchical Synthesis vs. Flat Synthesis


**Logic Gate Synthesis**

1. **Utilization of NAND Gates:** During the synthesis process of logic gates like OR and AND gates, it's common for the synthesis tool to favour the use of NAND gates. This preference stems from the fact that OR gates, in particular, often employ stacked PMOS transistors. These stacked PMOS transistors have lower electron mobility, necessitating larger aspect ratios to effectively drive logic levels.

 **Submodule-Level Synthesis**

Submodule-level synthesis offers several advantages:

1. **Reduced Synthesis Time:** Submodule-level synthesis can significantly reduce synthesis time, especially in the context of large and complex designs.

2. **Reuse of Submodules:** When a specific submodule is called multiple times within a design, a time-saving strategy involves synthesizing it just once and then reusing it by integrating it into the main or top-level module.

3. **Efficient Optimization:** Submodules are often optimized more efficiently during synthesis compared to optimizing the entire top-level design. This optimization leads to improved overall design performance.


## Various Flop Coding Styles and Optimization:

**What is the need for Flip-Flops in designs?**
Flops are essential in digital circuits to mitigate the cumulative effects of glitches that can occur due to propagation delays in combinational logic. When multiple combinational blocks are interconnected, these glitches can accumulate and lead to erroneous states. Flops act as a buffer, storing the final stable value and eliminating any glitches before passing it to the next block.




---
### Synthesizing Flops

**We'll synthesize and explore the behaviour of different flip-flops in the following sections:**

1. **Asynchronous Reset Flip-Flop** Files: `asyncres.v` (Design) and `asyncres_tb.v` (Testbench)

2. **Asynchronous Set Flip-Flop** Files: `asyncset.v` (Design) and `asyncset_tb.v` (Testbench)

3. **Synchronous and Asynchronous Reset Flip-Flop** Files: `sync_async_res.v` (Design) and `sync_async_res_tb.v` (Testbench)

all these files are present under the week_2/day_2 section.

---

**Here are the steps to synthesize flops in a digital design using Yosys and view the waveform using GtkWave:**

1. **Prepare the Design Files**: Ensure you have the necessary design files, including your Verilog design (`dff.v`) and a testbench file (`dff_tb.v`) for simulation.

2. **Synthesize Flops**:
   - Begin by invoking Yosys:
     ```
     yosys
     ```
   - Inside Yosys, follow these commands:
     ```
     # Read the Liberty library file
     read_liberty -lib <PATH_TO_.lib_FILE>/sky130_fd_sc_hd__tt_025C_1v80.lib

     # Read the Verilog design file
     read_verilog dff.v

     # Specify the top module for synthesis
     synth -top dff

     # Map flip-flops to library cells
     dfflibmap -liberty <PATH_TO_.lib_FILE>/sky130_fd_sc_hd__tt_025C_1v80.lib

     # Perform technology mapping
     abc -liberty <PATH_TO_.lib_FILE>/sky130_fd_sc_hd__tt_025C_1v80.lib

     # Write the synthesized Verilog file
     write_verilog -noattr dff_mapped.v

     # Display the design in Yosys (optional)
     show
     ```
   
3. **Simulate the Design**:
   - Use `iverilog` to compile your Verilog files and create an executable:
     ```
     iverilog dff.v dff_tb.v -o dff.out
     ```
   - Run the simulation:
     ```
     ./dff.out
     ```

4. **View the Waveform**:
   - Use GtkWave to view the simulation waveform:
     ```
     gtkwave dff_tb.vcd
     ```

These steps will guide us through the process of synthesizing flops, simulating the design, and visualizing the waveform for verification.

### Asynchronous Reset Flip-Flop :

- Activating the asynchronous reset ('1') forces the stored value to '0'.
- On the positive clock edge, the stored value updates with the data input.


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/212614e5-e172-4fff-ab88-8fc7dfd3717e" width="900">
</p>


### Asynchronous Set Flip-Flop:

- Activating the asynchronous set input ('1') forces the stored value to '1'.
- On the positive clock edge, the stored value updates with the data input.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/212614e5-e172-4fff-ab88-8fc7dfd3717e" width="900">
</p>


### Synchronous and Asynchronous Reset Flip-Flop:

- Combines both asynchronous and synchronous reset features.
- Asynchronous reset ('1') immediately sets the stored value to '0'.
- Synchronous reset ('1') at the positive clock edge also sets the stored value to '0'.
- On the positive clock edge, the stored value updates with the data input.


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/6a67bc95-5ef9-409b-9e69-f46f5377181e" alt="Image" width="900">
</p>



### What is Optimization? Why do we need it ?:

In this section, we'll delve into the concept of optimization, exploring its role in enhancing overall design performance and achieving better Power, Performance, and Area (PPA) metrics. Our primary focus will be on identifying optimization opportunities through simple examples. On Day 3, we will delve deeper into optimization principles and engage in hands-on labs.

 **1.mult_2.v**
 This is a simple design that multiples 2 to Input A and assigns it to the output Y. 
 
``` 
module mul2 (input [2:0] a, output [3:0] y);
	assign y = a * 2;
endmodule

```
**Synthesis steps**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog mult_2.v
synth -top mul2
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
write_verilog -noattr mul2_netlist.v
!nvim mul2_netlist.v
```
Output of synthesis after optimization and its netlist :

Multiplying a number by 2 involves a right shift operation, which means adding a "0" bit at the end of the number. This optimization simplifies the process by directly appending a "0" instead of using a dedicated multiplier circuit.

<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/c1df6945-1bb8-4a4c-a696-8e36d2df4d7b" alt="Image" width="400">
</p>






 **2. mult_8.v**
 This is a simple design that multiples 9 to input A and assigns it to Y.
``` v
module mult8 (input [2:0] a , output [5:0] y);
	assign y = a * 9;
endmodule
```


**Synthesis steps**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog mult_2.v
synth -top mult8
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
write_verilog -noattr mult8_netlist.v
!gvim mult8_netlist.v
```

Output of synthesis after optimization and its netlist :

The `mul8` operation is essentially a multiplication by (8+1), which can be achieved by appending three zeroes at the end of 'a' and adding 'a' to itself. In this process, a dedicated multiplier is not inferred, and only three bits are added.


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/79133c30-8aed-4e77-b9b2-ac92fdebabf1" alt="Image" width="400">
</p>


</details>




<details>
<summary> Day 3: Combinational and Sequential Optimizations: </summary>
<br>

# DAY 3: Combinational and sequential optimizations

## Logic Optimization Techniques
Optimization is crucial for achieving optimal performance, resource utilization, and power efficiency in digital circuits.

 **Why Optimization Matters**
- **Performance**: Optimization enhances circuit performance, reducing latency and improving throughput.
- **Area**: Efficient designs occupy less physical space, reducing chip size and costs.
- **Power**: Optimized circuits consume less power, prolonging battery life and reducing heat generation.

### Types of Logic Optimization:

 **Combinational Logic Optimization**
- **Constant Propagation**: Substituting variables with constant values for faster execution.
- **Boolean Logic Optimization**: Simplifying logic expressions to reduce gate count and improve efficiency.

**Sequential Logic Optimization**
- **Sequential Constant Propagation**: Propagating constant values through sequential elements.
- **State Optimization**: Minimizing the number of states in finite state machines.
- **Retiming**: Reordering registers to meet timing constraints and enhance performance.
- **Sequential Logic Cloning**: Duplicating logic elements to optimize specific conditions and operations.

---

### Combinational Logic Optimizations:

In this section we synthesise a few combinational designs and see how optimization takes place 

**Synthesis steps followed for all the design**
```
# Read the Liberty library file
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read the Verilog design file
read_verilog <design>.v

# Specify the top module for synthesis
synth -top <design_name>

# Perform combinational logic optimization
opt_clean -purge # Use this command to optimize the combinational logic before linking to ABC

# Link to ABC for technology mapping
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Display the design in Yosys
show
```
---
Design 1: opt_check.v

```
module opt_check (input a , input b , output y);
	assign y = a?b:0;
endmodule
```

Rather than inferring a MUX we get an AND gate as ouput always assigned value of B or its zero rest of the time. 





<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/be140058-6ed5-4e7b-91a1-364bc78e7937" alt="Image" width="600">
</p>

---

Design 2: opt_check2.v

```
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule

```
Rather than a MUX we have a OR gate that is inferred . As the output is '1' ie A if A is 1. and B if A=0.




<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/967d7133-55a5-4727-a9c8-9b87ce04ef80" alt="Image" width="600">
</p>


---

Design 4: opt_check3.v
```
module opt_check3 (input a , input b, input c , output y);
	assign y = a?(c?b:0):0;
endmodule
```

Rather than a 4:1 MUX we have a 3 Input AND gate that is inferred. Because the output depends on all the 3 inputs ( if ternary operator choose 1st operation in all the case )




<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/72285bdb-653c-4608-9a0c-420ccb95c7f4" alt="Image" width="600">
</p>



---
Design 4: multiple_module_opt.v


```
module sub_module1(input a , input b , output y);
 assign y = a & b;
endmodule

module sub_module2(input a , input b , output y);
 assign y = a^b;
endmodule

module multiple_module_opt(input a , input b , input c , input d , output y);
wire n1,n2,n3;

sub_module1 U1 (.a(a) , .b(1'b1) , .y(n1));
sub_module2 U2 (.a(n1), .b(1'b0) , .y(n2));
sub_module2 U3 (.a(b), .b(d) , .y(n3));

assign y = c | (b & n1); 
endmodule
```



<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/cfef4bfc-37d6-4b60-8dd9-c8b3b6487c64" alt="Image" width="600">
</p>



---





### Sequential Logic Optimizations: 





**Synthesize the Design**

```
# Read the Liberty library file
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read the Verilog design file
read_verilog <design>.v

# Specify the top module for synthesis
synth -top <design_name>

# Map flip-flops to library cells
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Perform technology mapping
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Display the design in Yosys
show
```


**Simulate the Design**
```
# Compile Verilog files
iverilog <design>.v <tb_design>.v -o <design>.out

# Run the simulation
./<design>.out

# View the waveform using GTKWAVE
gtkwave <tb_design>.vcd

```
Make sure to replace <design>, <design_name>, and <tb_design> with the appropriate file names and module names as needed for your specific design and testbench.


Design 1: dff_const1.v
```
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end

endmodule

```




<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/a432e0d1-78e4-454d-8cef-e88f2e5fbd1a" alt="Image" width="900">
</p>



---
Design 2: dff_const2.v
```
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b1;
	else
		q <= 1'b1;
end

endmodule
```



<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/179f4ba3-7b02-4e34-92ea-3ac02b864abd" alt="Image" width="900">
</p>


---

Design 3: dff_const3.v

```
module dff_const3(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b1;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule

```



<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/80239909-4512-4edd-89f3-3ccda0b9180d" alt="Image" width="900">
</p>



---

### Sequential optimizations for unused outputs:

Design 1: counter_opt.v
```
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = count[0];

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end

endmodule

```




<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/941ab670-0f29-4341-9420-5d92e73d1185" alt="Image" width="900">
</p>

---
Design 2: counter_opt2.v
```
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = (count[2:0] == 3'b100);

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end

endmodule
```
<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/93bb14bb-ac23-4a3e-84a6-72887eaf43c0" alt="Image" width="1000">
</p>


</details>


<details>
<summary> Day 4: Gate Level simulation </summary>
<br>

# Day 4: Gate Level simulation [ GLS ] 


## Gate-Level Simulation

Gate-level simulation is a crucial method in electronics design for verifying digital circuits at the level of individual logic gates and flip-flops. It offers several key benefits:

- **Functionality Check**: It allows for comprehensive functionality testing.
- **Timing Verification**: Ensures that timing requirements are met.
- **Power Consumption Analysis**: Assesses power consumption.
- **Test Pattern Generation**: Generates test patterns for integrated circuits.

This simulation operates at a lower abstraction level than higher-level simulations, making it essential for debugging and ensuring circuit correctness.
 
**Usage**

Gate-level simulation is typically used for post-synthesis verification to ensure that the design meets functionality and timing requirements. The required inputs include:

- **Testbench**: A testbench for the design.
- **Synthesized Netlist**: The netlist of the synthesized design.
- **Gate-Level Verilog Models**: Verilog models of the individual gates used in the design.

In cases where there's a discrepancy in simulation results for the post-synthesis netlist, it's referred to as a "synthesis simulation mismatch."



### Gate-Level Simulation Steps
These steps outline the process of gate-level simulation, a critical phase in the verification and validation of digital circuit designs.

1. **Write RTL Code**: Begin by creating RTL (Register-Transfer Level) code to describe the digital circuit. Verify its functionality using a testbench.
   ```
   iverilog <design>.v <tb_desgin>.v
   ./a.out
   gtkwave <tb_design>.vcd
   
   ```

3. **Synthesize RTL**: Perform RTL synthesis to convert the high-level RTL code into a gate-level netlist.
   ```
   read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
   read_verilog <design>.v
   synth -top blocking_caveat
   abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
   write_verilog -noattr <design_netlist>.v
   show
   ```

5. **Compile and Simulate**: Compile the gate-level netlist and simulate it using the same testbench that was used for RTL verification.
   ```
   iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v <design_netlist>.v <desing_tb>.v
   ./a.out
   gtkwave <desing_tb>.vcd
   ```

7. **Timing Analysis (If Necessary)**: If required, conduct timing analysis to ensure that the design meets timing constraints. Additionally, verify that the functionality matches expectations.

### GLS Errors

**Synthesis-Simulation Mismatch**
- **Definition**: Differences between a digital circuit's behaviour in RTL-level simulation and its behaviour post gate-level synthesis.
- **Causes**: Optimization, clock domain issues, library discrepancies, etc.
- **Resolution**: Ensure consistent tool versions, verify synthesis settings, debug with simulation tools, and follow best RTL coding practices.
- **Importance**: Crucial for reliable hardware implementation.


---
**Blocking vs. Non-Blocking Statements**
**Blocking Statements**
- **Execution**: Sequentially, in the order they appear.
- **Usage**: Describe combinational logic, with execution order significance.
- **Example**:
 ```
  a = b + c; // Waits for 'b' and 'c' before calculating 'a'
 ```

**Non-Blocking Statements**
- **Execution**: Concurrently, within procedural blocks.
- **Usage**: Model synchronous digital circuits, with parallel execution.
- **Example**:
```
always @(posedge clk)
begin
b <= a; // Concurrently scheduled assignment
c <= b; // Concurrently scheduled assignment
end
```

---

**Caveats with Blocking Statements**
- **Sequential Execution**: Blocking statements execute sequentially, potentially misrepresenting concurrent hardware behaviour.
- **Order Dependency**: The order of blocking statements can impact results, leading to race conditions.
- **Combinational Logic**: Primarily used for combinational logic modelling.
- **Testbench Usage**: Excessive use in testbenches can lead to simulation race conditions.
- **Initialization Issues**: Order-dependent initialization with blocking assignments can yield unexpected results.
- **Mitigation**: Use non-blocking statements for sequential logic modelling, employ good coding practices to minimize order dependencies, and enhance code clarity.









### Labs on GLS 
#### Synthesis-Simulation Mismatch
Design 1: ternary_operator_mux.v
``` 
module ternary_operator_mux (input i0 , input i1 , input sel , output y);
	assign y = sel?i1:i0;
endmodule
```


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/99602a06-2390-445a-ba82-84a9dfe0fa47" alt="Image" width="900">
</p>


---
Design 2:bad_mux.v
```
module bad_mux (input i0 , input i1 , input sel , output reg y);
always @ (sel)
begin
	if(sel)
		y <= i1;
	else 
		y <= i0;
end
endmodule
```


<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/9882efa5-81ab-42b8-8205-20adeedd3fd2" alt="Image" width="900">
</p>

---
#### Synth-Sim mismatch for blocking statement

Design 3: blocking_caveat.v
```
module blocking_caveat (input a , input b , input  c, output reg d); 
reg x;
always @ (*)
begin
	d = x & c;
	x = a | b;
end
endmodule
```



<p align="center">
  <img src="https://github.com/VardhanSuroshi/demo/assets/132068498/543b8cb3-8d01-401b-b1b8-352dd3d1cfd6" alt="Image" width="900">
</p>








</details>

</details>









