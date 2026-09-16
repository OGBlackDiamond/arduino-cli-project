FQBN ?= arduino:avr:mega
SKETCH ?= ./project
PORT ?= /dev/ttyACM0
BUILD_DIR ?= $(SKETCH)/build

DEBUG ?= 0

ifeq ($(DEBUG), 1)
	BUILD_FLAGS = -D DEBUG_MODE=1
else
	BUILD_FLAGS = -D DEBUG_MODE=0
endif

.DEFAULT_GOAL := deploy

.PHONY: build lsp upload deploy monitor debug-build debug clean

deploy: build upload
	@printf '\n\n\n%b	\033[32mDeploy Complete!\033[0m\n\n\n'
	@printf 'starting monitor...\n'
	sleep 1 && $(MAKE) monitor

build:
	arduino-cli compile --fqbn $(FQBN) \
		--build-path $(BUILD_DIR) \
		--build-property "build.extra_flags=$(BUILD_FLAGS)" \
		$(SKETCH)
	@printf '\n\n\n%b	\033[32mBuild complete!\033[0m\n\n\n'

upload:
	arduino-cli upload -p $(PORT) --fqbn $(FQBN) $(SKETCH)
	@printf '\n\n\n%b	\033[32mUpload complete!\033[0m\n\n\n'

debug-build:
	$(MAKE) build DEBUG=1

debug:
	$(MAKE) deploy DEBUG=1

monitor:
	arduino-cli monitor -p $(PORT)

clean:
	arduino-cli compile --clean --fqbn $(FQBN) --build-path $(BUILD_DIR) $(SKETCH)


# this is only for compiling libraries for the lsp
lsp:
	arduino-cli compile --only-compilation-database --fqbn $(FQBN) \
		--build-path $(BUILD_DIR) \
		--build-property "build.extra_flags=$(BUILD_FLAGS)" \
		$(SKETCH)
