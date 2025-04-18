# Jalview Docker (GUI for macOS via XQuartz)

Run Jalview in a clean Linux environment via Docker with X11 forwarding to macOS.

## Prerequisites

- macOS with [XQuartz](https://www.xquartz.org/) installed
- Docker Desktop for Mac
- Run `xhost + 127.0.0.1` in Terminal after starting XQuartz

## Build

```bash
docker build -t jalview-gui .
```

## Run
```bash
docker run -e DISPLAY=host.docker.internal:0 \
  -v $PWD:/data \
  --rm jalview-gui
```
