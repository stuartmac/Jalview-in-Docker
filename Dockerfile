FROM openjdk:8-slim

# Install required GUI/X11 libraries
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
      wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/jalview

# Download Jalview
RUN wget https://www.jalview.org/downloads/jar/release/jalview-all-2.11.4.1-j1.8.jar -O jalview.jar

# Set up the environment
COPY jalview_properties /root/.jalview_properties
ENV DISPLAY=:0

# # Run with sensible scaling and ensure it's not headless
# ENTRYPOINT ["java", "-Dsun.java2d.uiScale=1", "-Djava.awt.headless=false", "-jar", "jalview.jar"]

# Bypass launcher and run Jalview directly
ENTRYPOINT ["java", "-Djava.awt.headless=false", "-cp", "jalview.jar", "jalview.bin.Jalview"]