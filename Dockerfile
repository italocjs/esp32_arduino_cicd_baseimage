# Use Python 3 as the base image
FROM python:3 as base

# Install PlatformIO
RUN pip install platformio

# Preinstall the 'native' platform
RUN platformio platform install native

# Preinstall the 'espressif32' platform and the specific Arduino framework version
RUN platformio platform install espressif32 --with-package framework-arduinoespressif32@https://github.com/italocjs/arduino-esp32.git#idf-release/v4.4
RUN pio platform install espressif32 --with-package=toolchain-xtensa-esp32 --with-package=toolchain-esp32ulp --with-package=framework-arduinoespressif32 --with-package=framework-espidf --with-package=tool-esptoolpy --with-package=tool-cmake --with-package=tool-ninja

# Preinstall the 'googletest' library
RUN platformio lib -g install googletest

# Copy a basic code so we can run the build
COPY sample/ /workspace/
WORKDIR /workspace

# Run a PlatformIO build for each environment to download dependencies
# This step assumes your platformio.ini is configured for esp32dev and native environments
RUN platformio run -e native
RUN platformio run -e esp32dev

# This part of the process will NOT test agains any target, as this is meant to be an shared base image

# Clean up unnecessary files to keep the image size down
RUN rm -rf /workspace