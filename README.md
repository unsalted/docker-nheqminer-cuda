## Nheqminer CPU *only*

### Quickstart instructions
---
A few examples commands to help get things up and running quickly.

**RUN**
`docker run --rm -i -d -h nheqminer --name nheqminer unsalted/nheqminer`

**EXEC command (start, help, benchmark)**
`docker exec nheqminer bash -c "nheqminer -l zec-us1.dwarfpool.com:3335 -u YOUR_ZEC_ADDRESS.user -t 4"`

**Enter the container**
`docker exec -it nheqminer bash`

**For more information about using nheqminer see [their repository](https://github.com/nicehash/nheqminer)**.

