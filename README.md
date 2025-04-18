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

## Integrating Jalview with a Slivka Stack

This Docker setup is especially useful for integrating Jalview with a containerized Slivka service. By pre-configuring Jalview to connect to your running Slivka instance, you can:

- Use Slivka-exposed tools directly within Jalview
- Customise Jalview’s analysis capabilities by adding compatible tools to your Slivka container
- Rapidly prototype and deploy new bioinformatics tools that are immediately accessible via Jalview’s GUI

This integration is ideal for development environments where you want to test or share new Jalview-compatible services with minimal setup.

## Add Jalview to XQuartz Applications

For easier access, you can add Jalview to the Applications menu in XQuartz:

1. Open XQuartz and go to `Applications > Customize...`.
2. Click the `+` button to add a new application.
3. Set the following:
   - **Name**: Jalview
   - **Command**: `docker run -e DISPLAY=:0 -v ~:/data --rm jalview-gui`
4. Click `Done` to save the changes.

You can now launch Jalview directly from the XQuartz Applications menu.
