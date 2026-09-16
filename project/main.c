#include "main.h"

#include "src/debug.h"

void startMain() {

    if (DEBUG_MODE) Serial.begin(9600);

    DPRINTLN("Testing");
}
