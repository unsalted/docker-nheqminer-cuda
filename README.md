## [Nheqminer *with* NVIDIA CUDA](https://github.com/unsalted/docker-nheqminer-cuda) support

### Releases

#### Ubuntu 16.04
- `v0.5c`, ` cuda`, `latest` [(CUDA 8.0/v0.5c)](https://github.com/unsalted/docker-nheqminer-cuda/blob/master/Dockerfile)
- `v0.5c-cpu`, `cpu` [(CPU/v0.5c)](https://github.com/unsalted/docker-nheqminer-cuda/blob/cpu/Dockerfile)

### Requirements
---
This assumes that current versions of NVIDIA drivers and Docker is installed, it also requires the [nvidia-docker plugin](https://github.com/NVIDIA/nvidia-docker) which allows the image to access the host GPU and drivers with minimal extra requirements on *you* or  the host.

For convenience there is also a [*cpu only*](https://github.com/unsalted/docker-nheqminer-cuda/blob/cpu/Dockerfile) build.

**nvidia-docker [install requirements](https://github.com/NVIDIA/nvidia-docker/wiki/Installation)**

##### An example of installing nvidia-docker on Ubuntu 16.04
*It really isn't so bad...*
```
# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Test nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi

```
---

#### Quickstart instructions
---
A few example commands to help get things up and running quickly.
**Do not** run more than two threads per instance, if you want to run CPU and GPU on the same machine spin up seperate instances.
**DO RUN *two threads* per instance** for example `-cd 0 0 1 1`.
On a stock GTX1070 with two threads the djezo solver runs at around 380 Sol/s.

**RUN**

`nvidia-docker run --rm -i -d -h nheqminer --name nheqminer unsalted/nheqminer`

**EXEC nheq command (start, help, benchmark)**

`docker exec nheqminer bash -c "nheqminer -l zec-us1.dwarfpool.com:3335 -u YOUR_ZEC_ADDRESS.user -cd 0 0"`

**Enter the container**

`docker exec -it nheqminer bash`

---
#### Nheqminer CPU *only*
---

**RUN**

`docker run --rm -i -d -h nheqminer --name nheqminer unsalted/nheqminer:cpu`

**EXEC command (start, help, benchmark)**

`docker exec nheqminer bash -c "nheqminer -l zec-us1.dwarfpool.com:3334 -u YOUR_ZEC_ADDRESS.user -t 2"`

**Enter the container**

`docker exec -it nheqminer bash`


**For more information about using nheqminer see [the nicehash nheqminer repo](https://github.com/nicehash/nheqminer)**.

**Please ask questions and post bugs to [github](https://github.com/unsalted/docker-nheqminer-cuda).**
