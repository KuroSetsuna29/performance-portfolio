# Portfolio Performance in Docker

Portfolio Performance is an open source tool to calculate the overall performance of an investment portfolio - across all accounts - using True-Time Weighted Return or Internal Rate of Return.

This runs Portfolio Performance inside a container with [KasmVNC](https://github.com/linuxserver/docker-baseimage-kasmvnc). The container will check on every start/restart if there is a newer version available.

## Run example

```bash
docker run --name portfolio-performance -d
    -p 3000:3000
    -v /host/path/config:/config
    --restart=unless-stopped
    ghcr.io/kurosetsuna29/portfolio-performance:latest
```

Webgui address: http://localhost:3000/
