#Remove previous cuda installation (if you installed cuda before):
sudo apt-get purge nvidia* -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo rm -rf /usr/local/cuda*

#Add key and download:
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list

#Install CUDA-10.0:
sudo apt-get update -y
sudo apt-get -o Dpkg::Options::="--force-overwrite" install cuda-10-0 cuda-drivers -y

#type
exec -l $SHELL
echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

#For check if install was successful: after executing next command you need to see version of your nvidia-drivers and GPU:
nvidia-smi

#Install cuDNN
