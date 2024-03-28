# Use Python 3 as the base image
FROM python:3 as base

# Install PlatformIO
RUN pip install platformio

# Preinstall the 'native' platform
RUN platformio platform install native

# Preinstall the 'espressif32' platform and the specific Arduino framework version
RUN platformio platform install espressif32 --with-package framework-arduinoespressif32@https://github.com/italocjs/arduino-esp32.git#idf-release/v4.4

# Preinstall the 'googletest' library
RUN platformio lib -g install googletest

# Copy a basic code so we can run the build
COPY workspace/ /workspace/
WORKDIR /workspace

# Run a PlatformIO build for each environment to download dependencies
# This step assumes your platformio.ini is configured for esp32dev and native environments
RUN platformio run -e native
RUN platformio run -e esp32dev


# Clean up unnecessary files to keep the image size down
RUN rm -rf /workspace