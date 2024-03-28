#ifdef ESP32
#include <Arduino.h>
void setup() {
    
    Serial.begin(115200);
}
void loop() {
    Serial.println("Hello, PlatformIO!");
    printf("Hello, PlatformIO!\n");
    delay(1000);
}
#endif

#ifndef ESP32
#include <cstdio>

int main() {
    printf("Hello, PlatformIO!\n");
}
#endif
