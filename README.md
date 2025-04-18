# Jalview Docker (GUI for macOS via XQuartz)

Run Jalview in a clean Linux environment via Docker with X11 forwarding to macOS.

## Prerequisites

- macOS with [XQuartz](https://www.xquartz.org/) installed
- Docker Desktop for Mac
- Run `xhost + 127.0.0.1` in Terminal after starting XQuartz (you may also need to run `export DISPLAY=:0` before `xhost`)

## Additional XQuartz Settings

XQuartz should be configured with the following settings:

1. Open XQuartz and go to `Preferences` (Command + ,).
2. Under the `Security` tab, ensure the following options are checked:
   - `Allow connections from network clients`
3. It's good to restart XQuartz.

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
