# esp32_arduino_cicd_baseimage
This repository contains an base image for esp32 development, its meant to build an base image with all the required tools, basic packages and libraries.  The goal of the base image is to speed up future build and test.

Login to docker:
```
docker login
```

Build the image:
```
docker build -t italocjs/track_env:latest .
```


Push the image:
```
docker push italocjs/track_env:latest
```


useful https://piolabs.com/blog/insights/unit-testing-part-3.html
