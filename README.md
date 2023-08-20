![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)


# About the repository 

Welcome to my GitHub repository dedicated to VLSI Physical Design for ASICs using open-source tools! Here, we embark on a journey that starts with processor specifications and leverages the power of the RISC-V ISA. We'll build processors from scratch, taking them through the entire RTL to GDS process  that meets various Performance, Power, Area ( PPA ) and manufacturability requirements. The best part? We're doing it all with open-source tools, including the RISC-V toolchain and OpenLane anad many more .
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/00ea3403-674e-4c70-a86e-a4d39aff4ff8" alt="Image" width="800">
</p>



# Table of Contents
+ [Tools Installations](#tools-installation)
## Week 1:
+ [Day 1:Introduction to RISC-V ISA and GNU Compiler Toolchain](#day-1-introduction-to-risc-v-isa-and-gnu-compiler-toolchain)
+ [Day 2:Introduction to ABI and Basic Verification Flow](#day-2-introduction-to-abi-and-basic-verification-flow)

## Week 2:

## Week 3:

## Week 4:

## Week 5:



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

#### TO summarise : 
<p align="center">
  <img src="https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/ecea0456-d480-494f-912d-97f6708d39b5" alt="Image" width="800">
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




















