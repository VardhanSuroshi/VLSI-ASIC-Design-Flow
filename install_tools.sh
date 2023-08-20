
echo " Beginning tool chian installation  "
sudo apt-get install vim -y #installs vim editor with "Yes" for all permissions that will be requested while doing the task
sudo apt-get install autoconf -y #tool to generate configure script
sudo apt-get install automake -y #tool to generate makefiles(to build software)
sudo apt-get install autotools-dev -y #development files for above autotool suites
sudo apt-get install curl -y #transfer data using URL(HTTPS,FTP)
sudo apt-get install libmpc-dev libmpfr-dev libgmp-dev -y #for arbitrary precision arithmetic on FP,Int, etc
sudo apt-get install gawk -y #text processing
sudo apt-get install build-essential -y #package of essential tools for building softwares
sudo apt-get install bison flex -y #to tokenize input streams
sudo apt-get install texinfo gperf -y #generate formatted manuals and perfect hash functions
sudo apt-get install -y #library support script used to manage dynamic libraries
sudo apt-get install patchutils bc -y 
sudo apt-get install zlib1g-dev libexpat1-dev -y #development files for zlib and xml libraries
sudo apt-get install git -y
sudo apt-get install gtkwave -y #Waveform viewer
cd
pwd=$PWD
mkdir riscv_toolchain
cd riscv_toolchain
wget "https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz"
tar -xvzf riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz #extract contents of tar file
export PATH=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin:$PATH #adding path to the environment
sudo apt-get install device-tree-compiler -y #tool used to compile and decompile device tree source files, which are used to describe hardware components in a system in a platform-independent manner.
git clone https://github.com/riscv/riscv-isa-sim.git
cd riscv-isa-sim/ #enter into the cloned directory
mkdir build #directory to configure isa-simulator
cd build
../configure --prefix=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14
make -j 4 #allocate 4 threads for parallel process
sudo make install
cd ~/riscv_toolchain
git clone https://github.com/riscv/riscv-pk.git #ISC-V Proxy Kernel, a thin software layer that acts as a bridge between a RISC-V application and the underlying hardware. It provides a basic environment for running user-level software on RISC-V systems. The primary purpose of riscv-pk is to provide an execution environment for RISC-V programs that are compiled to run in user mode.
cd riscv-pk/
mkdir build
cd build/
../configure --prefix=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14 --host=riscv64-unknown-elf
make -j 4
sudo make install
export PATH=$pwd/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/bin:$PATH
cd $pwd/riscv_toolchain
git clone https://github.com/steveicarus/iverilog.git #opensource HDL simulator
cd iverilog/
git checkout --track -b v10-branch origin/v10-branch 
git pull 
chmod 777 autoconf.sh #chmod - command to change permissions ; 777 - owner,group,others - read,write,execute permission enabled
./autoconf.sh
./configure
make -j 4
sudo make install
echo 'export PATH=~/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin:$PATH' >> ~/.bashrc
echo 'export PATH=~/riscv_toolchain/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/riscv64-unknown-elf/bin:$PATH' >> ~/.bashrc
source ~/.bashrc


echo " Done with toolchain installation !! "
