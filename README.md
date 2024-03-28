# esp32_arduino_cicd_baseimage
This repository contains an base image for docker usage, that will have all the necessary tools ready to use for building, testing and flashing esp32 

Building the image locally:
```
PS C:\code\esp32_arduino_cicd_baseimage> docker login
Authenticating with existing credentials...
Login Succeeded
PS C:\code\esp32_arduino_cicd_baseimage>
```

docker build -t italocjs/track_env:latest .