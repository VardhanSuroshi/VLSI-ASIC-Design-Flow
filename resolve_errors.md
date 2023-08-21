## This file is a contribution from Yagna Vivek 

## Ususally occuring errors while installing prerequisites 

### 1. when configuring iverilog : 
```check for following error "checking whether C compiler works..... no"```

<p align="center">
  <img src="https://github.com/yagnavivek/PES_ASIC_CLASS/assets/93475824/991acdaa-2d53-4858-aebe-9fa7b4b707b2" alt="Error Screenshot">
</p>


####  Solution : 
  This error usually occurs if you have a gcc version less than 12. You can check it using 
  ``` gcc --version```
  to resolve this You have to upgrade your gcc version. To do that, follow the below commands

  first try closing terminal,open again , go to the directory where the error popped up and execute 
  ```./configure```
  
  else
  
  ```
# Update the package database to fetch information about available updates.
sudo apt update

# Upgrade installed packages to their latest versions.
sudo apt upgrade

# Install essential build tools like compilers and libraries.
sudo apt install build-essential

# Install GCC version 12 and G++ version 12.
sudo apt -y install gcc-12 g++-12

# Add an alternative for the default GCC version with priority 12.
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12

# Add an alternative for the default G++ version with priority 12.
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 12

# Interactively configure the default GCC version to use.
sudo update-alternatives --config gcc

# Interactively configure the default G++ version to use.
sudo update-alternatives --config g++

# Display the version of GCC and G++ to confirm the update.
gcc --version; g++ --version

  ```
  ** if you see both the versions as 12.x.y then the upgrade is successfull ** 
  Now close the terminal and open again (or refresh) start with the command where the error occured.

### 2. Please follow this if the error is presistent ever after following above steps : 
  ```
 # Install the GNU Objective-C++ compiler.
sudo apt install gobjc++

# Reinstall the build-essential package to ensure essential tools are properly configured.
sudo apt-get install --reinstall build-essential

# Reinstall the GCC package to ensure it is properly configured.
sudo apt-get install --reinstall gcc

# Reconfigure the build-essential package.
sudo dpkg-reconfigure build-essential

# Reconfigure the GCC package.
sudo dpkg-reconfigure gcc

# Install GCC version 12 and G++ version 12.
sudo apt -y install gcc-12 g++-12

# Add an alternative for the default GCC version with priority 12.
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12

# Add an alternative for the default G++ version with priority 12.
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 12

# Interactively configure the default GCC version to use.
sudo update-alternatives --config gcc

# Interactively configure the default G++ version to use.
sudo update-alternatives --config g++

# Display the version of GCC and G++ to confirm the update.
gcc --version; g++ --version

  ```
  This should resolve the mentioned pproblem.
  **MAKE SURE YOU REFRESH or OPEN NEW TERMINAL BEFORE CONTINUING THE SCRIPT**

### 3. fatal error: 
```stdio.h : No such file or directory```
<p align="center">
  <img src="https://github.com/yagnavivek/PES_ASIC_CLASS/assets/93475824/dcd4cc9e-00be-44a6-836d-7697d5267d0a" alt="Error Screenshot">
</p>

```
cd 
vim ~/.bashrc
```
add these 2 paths in .bashrc file 
```
export PATH=~/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin:$PATH
export PATH=~/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/bin:$PATH
source .bashrc 
```
Refresh the terminal
**MAKE SURE YOU REFRESH or OPEN NEW TERMINAL BEFORE CONTINUING THE SCRIPT**


## resolve : 
```as unrecoginized error --64 ```

![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/b838a58c-d2a1-40e7-9e9b-38d57b2a17e6)

This issue comes when too many gcc compiler are in your path , there are multiple ways to resolve this . The jugaad that I did was to remove  these paths : 
```
PATH=~/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin:$PATH
PATH=~/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/bin:$PATH

```
path from .bashrc file and compile the c code and create a object file . Once that is done replace back the 2 paths that we removed from .bashrc file and proceed further . This might not be the correct way to resolve this issue but this jugaad works !!
Use this link to find more about how to resolve this [issue](https://askubuntu.com/questions/781972/how-can-i-update-gcc-5-3-to-6-1)

**we hope this resolves all the issues pertaining to tool installation**
 

  
  

  
