# Containerlab: 10-Client Virtual Network

A minimal, reproducible [Containerlab](https://containerlab.dev/) topology that
spins up **10 Alpine Linux clients** connected through a **Linux bridge** acting
as a virtual switch. Ideal for testing L2 connectivity, ARP behavior, ping
sweeps, or as a starting point for more complex network labs.

## 📐 Topology

| Node        | Kind    | Image           | IP Address     |
|-------------|---------|-----------------|----------------|
| `br-clab`   | bridge  | (host bridge)   | —              |
| `client1`   | linux   | `alpine:latest` | `10.0.0.11/24` |
| `client2`   | linux   | `alpine:latest` | `10.0.0.12/24` |
| `client3`   | linux   | `alpine:latest` | `10.0.0.13/24` |
| `client4`   | linux   | `alpine:latest` | `10.0.0.14/24` |
| `client5`   | linux   | `alpine:latest` | `10.0.0.15/24` |
| `client6`   | linux   | `alpine:latest` | `10.0.0.16/24` |
| `client7`   | linux   | `alpine:latest` | `10.0.0.17/24` |
| `client8`   | linux   | `alpine:latest` | `10.0.0.18/24` |
| `client9`   | linux   | `alpine:latest` | `10.0.0.19/24` |
| `client10`  | linux   | `alpine:latest` | `10.0.0.20/24` |

All clients share the subnet `10.0.0.0/24` and communicate at Layer 2 via `br-clab`.

## 📋 Requirements

- Linux host (or WSL2 on Windows)
- [Docker](https://docs.docker.com/engine/install/) ≥ 20.10
- [Containerlab](https://containerlab.dev/install/) ≥ 0.40
- Root / `sudo` privileges (required to create bridges and container interfaces)

Quick install of Containerlab:

```bash
bash -c "$(curl -sL https://get.containerlab.dev)"# containerlab-10-clients
