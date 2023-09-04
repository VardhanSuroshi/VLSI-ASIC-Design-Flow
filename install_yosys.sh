sudo apt install git -y
git clone https://github.com/YosysHQ/yosys.git
cd yosys
sudo apt install make -y
sudo apt-get update -y
sudo apt-get install build-essential -y
sudo apt-get install clang -y
sudo apt-get install bison -y
sudo apt-get install flex  -y
sudo apt-get install libreadline-dev -y
sudo apt-get install gawk -y
sudo apt-get install tcl-dev -y
sudo apt-get install libffi-dev -y 
sudo apt-get install git -y
sudo apt-get install graphviz -y 
sudo apt-get install xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev -y
make config-gcc
make
sudo make install
sudo apt install gtkwave
