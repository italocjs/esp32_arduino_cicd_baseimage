/**
 * @file main.cpp
 * @brief Main entry point for the application.
 * @version 0.1
 * @date 2024-03-28
 * @author Italo Soares (italocjs@live.com)
 * @copyright Copyright (c) 2024
 */

#ifndef ESP32
#include <stdio.h>
/**
 * This function is the entry point for the NATIVE application.
 * It simply prints a message to the console.
 */
int main()
{
	printf("Hello World from PlatformIO!\n");
	return 0;
}
#endif

#ifdef ESP32
#include <Arduino.h>
/**
 * This function is the entry point for the ESP32DEV application.
 * It simply prints a message to the console at setup and at every loop.
 */
void setup()
{
	Serial.begin(115200);
    Serial.println("Setup ok");
}

int32_t counter = 0;
void loop()
{
    Serial.printf("Loop %d\n", counter);
    counter++;
	delay(1000);
}
#endif