# Nheqminer Docker with NVIDIA CUDA

## Requirements

This assumes the NVIDIA drivers and Docker are properly installed, it also requires the [nvidia-docker plugin](https://github.com/NVIDIA/nvidia-docker) which allows the image to easily leverage the host GPU and drivers with minimal extra requirements on the host.

nvidia-docker [install requirements](https://github.com/NVIDIA/nvidia-docker/wiki/Installation)

### An example of installing nvidia-docker on Ubuntu 

```
# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Test nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi

```

*It really isn't so bad...*

## Quickstart instructions
A few command examples to get things up and running.

### RUN
`nvidia-docker run --rm -i -d -h nheqminer --name nheqminer unsalted/nheqminer`

### EXEC nheqminer command
`docker exec -it nheqminer bash -c "nheqminer -l zec-us1.dwarfpool.com:3335 -u YOUR_ZEC_ADDRESS.user -cd 0"`

### Enter the container
`docker exec -it nheqminer bash`

**For more information about using nheqminer see [their repository](https://github.com/nicehash/nheqminer)**

