PLATFORM                    ?= PLATFORM_DESKTOP
PROJECT_NAME                ?= game
RAYLIB_LIBTYPE              ?= STATIC
USE_EXTERNAL_GLFW           ?= FALSE

CC                          := gcc
DEBUGGING                   := TRUE
MAKE                        := make
UNAMEOS                     := $(shell uname)

# Compiler flags:
# -std=c99                  define C language mode (Standard C 1999 revision)
# -Wall                     enable most, but not all compiler warnings
# -Wextra                   enable additional compiler warnings
# -Wno-missing-braces       ignore invalid warning (GCC bug 53119)
# -g                        enable debugging
# -O1                       optimization level
# -s                        strip unnecessary data from build

CFLAGS += -std=c99 -Wall -Wextra -Wno-missing-braces
ifeq ($(DEBUGGING), TRUE)
	CFLAGS += -g
else
	CFLAGS += -O1 -s
endif

# Include paths for headers
INCLUDE_PATHS = -I. -I./src

# Library paths
LDFLAGS += -L. -L./lib

# Libraries to use
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

# Locations
SRC_DIR = src
OBJ_DIR = obj
OUT_DIR = out

# Source to build
OBJS := main.c $(shell find $(SRC_DIR) -name '*.c')

# Targets
.PHONY: all clean

all:
	make $(PROJECT_NAME)

$(PROJECT_NAME): $(OBJS)
	mkdir -p $(OUT_DIR)
	$(CC) -o $(OUT_DIR)/$(PROJECT_NAME) $(OBJS) $(CFLAGS) $(INCLUDE_PATHS) $(LDFLAGS) $(LDLIBS) -D$(PLATFORM)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c $< -o $@ $(CFLAGS) $(INCLUDE_PATHS) -D$(PLATFORM)

clean:
	rm -rf $(OUT_DIR)
