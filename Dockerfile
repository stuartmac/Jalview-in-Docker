# Base image with Java (you can switch to openjdk:11-slim if needed)
FROM openjdk:8-slim

# Install dependencies for GUI rendering and decent fonts
RUN apt-get update && \
    apt-get install -y \
      libxext6 \
      libxrender1 \
      libxtst6 \
      libxi6 \
      libx11-6 \
      libxau6 \
      libxdmcp6 \
      libgtk2.0-0 \
      wget \
      fonts-dejavu \
      fonts-liberation && \
    rm -rf /var/lib/apt/lists/*

# Create Jalview directory
WORKDIR /opt/jalview

# Download Jalview JAR
RUN wget https://www.jalview.org/downloads/jar/release/jalview-all-2.11.4.1-j1.8.jar -O jalview.jar

# Use user-mounted /data directory for input/output
VOLUME ["/data"]
WORKDIR /data

# Launch Jalview with improved GUI compatibility
ENTRYPOINT ["java", \
  "-Dsun.java2d.uiScale=1", \
  "-Dsun.java2d.opengl=false", \
  "-Djava.awt.headless=false", \
  "-cp", "/opt/jalview/jalview.jar", \
  "jalview.bin.Jalview"]