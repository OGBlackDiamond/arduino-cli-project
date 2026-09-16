#ifndef DEBUG_H
#define DEBUG_H

#include <Arduino.h>

#ifndef DEBUG_MODE
    #define DEBUG_MODE 0
#endif

#if DEBUG_MODE
    #define DPRINTLN(x) Serial.println(x)
    #define DPRINT(x)   Serial.print(x)
    #define DPRINTF(...) Serial.printf(__VA_ARGS__)
#else
    #define DPRINTLN(x)
    #define DPRINT(x)
    #define DPRINTF(...)
#endif

#endif // DEBUG_H
