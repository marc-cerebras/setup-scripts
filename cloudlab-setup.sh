sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository -y 'deb http://llvm.org/apt/jessie llvm-toolchain-jessie-3.8 main'
sudo apt-get update
sudo apt-get install -y build-essential gcc-4.9 g++-4.9 clang-3.8 lldb-3.8 gdb cmake git 
sudo apt-get install -y protobuf-compiler libprotobuf-dev flex bison libnuma-dev numactl
sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 20
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 20
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.8 20
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.8 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 20
sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-3.8 20
sudo update-alternatives --install /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-3.8 20
sudo apt-get install -y dstat
sudo apt-get install -y tmux vim htop

(echo n; echo ; echo ; echo ; echo ; echo w) | sudo fdisk /dev/sdb
sudo mkfs.ext4 /dev/sdb1
sudo mkdir /slowdisk
sudo mount /dev/sdb1 /slowdisk

(echo n; echo ; echo ; echo ; echo ; echo w) | sudo fdisk /dev/sdc
sudo mkfs.ext4 /dev/sdc1
sudo mkdir /fastdisk
sudo mount /dev/sdc1 /fastdisk

sudo chmod a+r /slowdisk
sudo chmod a+r /fastdisk
sudo chmod a+w /slowdisk
sudo chmod a+w /fastdisk

cd /fastdisk
git clone https://github.com/cramja/incubator-quickstep.git 
git clone https://github.com/cramja/obamadb.git

#TODO: clone UWQuickstep repos

git config --global core.editor vim
git config --global user.name "cramja"
git config --global user.email marc.spehlmann@gmail.com
