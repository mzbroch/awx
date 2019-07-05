# ntc-awx-template

## AWX installation via Docker-compose

High-level goal of this project is to introduce a standard AWX's installation @ NTC.

AWX + docker-compose recommendations:
- For customers who start with containers / minimal knowledge / no existing orchestration
- Ideally 1 AWX instance per a dedicated virtual-machine
- Disaster-recovery ideally offloaded to VM layer (failover via hypervisor)
- PostgreSQL and data installed locally in /opt/ntc

### Assumptions
This template automates following steps:
- Installs virtual environment for host only (including Ansible needed to install AWX)
- Downloads current AWX's sources
- Installs AWX from sources (local variables are provided by awx_install/ntc_inventory customized file)

Additionally, this template provides:
- Makefile for managing custom virtual environments

### Installation:

#### Pre-requirements:
- Python3 installed on host
- Docker installed on host

#### Clone template into base-dir:
```git clone https://github.com/mzbroch/awx.git /opt/ntc```

#### Install AWX:
```cd /opt/ntc/ && make ntc_awx```
