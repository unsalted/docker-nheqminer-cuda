## Nheqminer *with* NVIDIA CUDA support
---
### Requirements
---
This assumes the NVIDIA drivers and Docker are properly installed, it also requires the [nvidia-docker plugin](https://github.com/NVIDIA/nvidia-docker) which allows the image to access the host GPU and drivers with minimal extra requirements on *you* or  the host.

For convenience there is also a *cpu only* build.

**nvidia-docker [install requirements](https://github.com/NVIDIA/nvidia-docker/wiki/Installation)**

##### An example of installing nvidia-docker on Ubuntu 
*It really isn't so bad...*
```
# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Test nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi

```
---
### Quickstart instructions
---
A few examples commands to help get things up and running quickly.

**RUN**
`nvidia-docker run --rm -i -d -h nheqminer --name nheqminer unsalted/nheqminer`

**EXEC command (start, help, benchmark)**
`docker exec nheqminer bash -c "nheqminer -l zec-us1.dwarfpool.com:3335 -u YOUR_ZEC_ADDRESS.user -cd 0"`

**Enter the container**
`docker exec -it nheqminer bash`

**For more information about using nheqminer see [their repository](https://github.com/nicehash/nheqminer)**.

