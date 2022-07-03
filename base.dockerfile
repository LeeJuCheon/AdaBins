FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install build-essential -y && \

# Related to build...
apt-get install cmake -y && \
apt-get install git -y && \
apt-get install sudo -y && \
apt-get install wget -y && \
apt-get install ninja-build -y && \
apt-get install software-properties-common -y && \
apt-get install python3 -y && \
apt-get install python3-pip -y && \
apt-get install libeigen3-dev -y && \
apt-get install libgoogle-glog-dev -y && \ 
apt-get install libgtest-dev -y && \ 
apt-get install libsuitesparse-dev -y && \ 
apt-get install libopencv-dev -y && \ 
apt-get install libzip-dev -y && \ 
apt-get install libboost-all-dev -y && \

# Related to JetBrains CLion Docker develpoment...

apt-get install -y ssh && \
apt-get install -y gcc && \
apt-get install -y g++ && \
apt-get install -y gdb && \
apt-get install -y clang && \
apt-get install -y cmake && \
apt-get install -y rsync && \
apt-get install -y tar && \
apt-get install -y mesa-utils && \
apt-get install -y libpython2.7-dev && \
# Related to X11 remote display
apt-get install -y libgl1-mesa-glx && \
apt-get install -y libglu1-mesa-dev && \
apt-get install -y mesa-common-dev && \
apt-get install -y x11-utils && \
apt-get install -y x11-apps && \
apt-get install x11-xserver-utils && \
apt-get clean
 
RUN pip3 install pyyaml
RUN pip3 install gitpython

RUN cd ~ && mkdir workspace && cd workspace && \
mkdir dataset && \ 
git clone https://github.com/LeeJuCheon/AdaBins.git

RUN pip3 install numpy && \
pip3 install gdown && \ 
pip3 install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html && \ 
pip3 install wandb && \  
pip3 install tqdm && \ 
pip3 install matplotlib && \
pip3 install scipy && \ 
pip3 install pytorch3d

RUN cd ~/workspace/AdaBins && \ 
gdown https://drive.google.com/uc?id=1lvyZZbC9NLcS8a__YPcUP7rDiIpbRpoF && \
mkdir pretrained && \
mv AdaBins_nyu.pt pretrained/AdaBins_nyu.pt

# RUN pip3 install gdown && \ 
# pip3 install torch==1.6.0 torchvision==0.7.0 -f https://download.pytorch.org/whl/cu101/torch_stable.html
# pip3 install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
# pip3 install torch==1.7.0+cu101 torchvision==0.8.0+cu101 torchaudio==0.7.0 -f https://download.pytorch.org/whl/torch_stable.html
# pip3 install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
# pip3 install torch==1.6.0 torchvision==0.7.0
# pip3 install torch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0
# pip3 install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
# pip3 install https://download.pytorch.org/whl/cu101/torch-1.6.0%2Bcu101-cp37-cp37m-linux_x86_64.whl



# RUN add-apt-repository ppa:graphics-drivers/ppa && \
# apt update && \
# ubuntu-drivers autoinstall

# RUN sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb && \ 
# sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub && \ 
# sudo apt-get update && \ 
# sudo apt-get install cuda && \ 
# patch && \ 
# sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-nvjpeg-update-1_1.0-1_amd64.deb && \ 
# sudo apt-get update && \ 
# sudo apt-get upgrade cuda