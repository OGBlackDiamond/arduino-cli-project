# arduino-cli-project
A simple template that contains a framework for a project that uses the arduino-cli

## How to use this template
1. Rename instances of `project` in the directory be the name of the project
2. Edit `makefile` to match the parameters for your project.
    * `FQBN`: the board type, these need to be installed with `arduino-cli`
    * `SKETCH`: the name of your project / sketch
    * `PORT`: the tty port that the device will appear on, this is commonly `ttyACM0` for arduino boards or `ttyUSB0` for ESP32 boards.
    * `BUILD_DIR`: the output build directory, this is mainly used for lsp libraries
3. Create a `.clangd` in the root of the sketch for the `build lsp` command. A good default is shown below, but non-arduino boards may need more configuration:
```
CompileFlags:
  CompilationDatabase: build
```
4. Install lsp files: `make lsp` will install libraries that the lsp can pull from for accurate completions

## Dependencies
* `arduino-cli`

## Building

### Arduino-CLI
The makefile includes several helpful tools to build the project with the Arduino CLI.
`make` points to the `deploy` target by default.

Targets:
* `build` - compiles the project
* `upload` - uploads the built project to the target device
* `deploy` - compiles and uploads the project, then opens the serial monitor
* `monitor` - opens the serial monitor to listen for debugging messages over the serial interface
