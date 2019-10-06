# Minimal Raylib Template for Linux

## Reasoning

Sometimes I like to play aroud with some game development, but I don't do much C-based work, so building C-based projects is always cumbersome, this template will help to don't forget how it's done.
Many functionality is missing from it, but basic building works, that's enough for me for now

## Steps

### Remove previous raylib libs

```bash
sudo rm -r \
    /usr/local/lib/libraylib.* \
    /usr/local/lib/pkgconfig/raylib.pc \
    /usr/local/lib/cmake/raylib/raylib-config-version.cmake
```


### Required packages

```bash
sudo apt install \
    build-essential \
    libasound2-dev \
    mesa-common-dev \
    libx11-dev \
    libxrandr-dev \
    libxi-dev \
    xorg-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev
```


# ## Install latest cmake (to build raylib)

```bash
sudo mkdir -p /opt/cmake
sudo curl -L  https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4-Linux-x86_64.sh -o /opt/cmake/installer.sh
cd /opt/cmake/
sudo sh installer.sh --prefix=/opt/cmake --skip-license 
sudo rm installer.sh
sudo update-alternatives --install /usr/bin/cmake cmake /opt/cmake/bin/cmake 1 --force
```


### Clone Raylib, build and install

```bash
git clone https://github.com/raysan5/raylib.git
cd raylib && mkdir build && cd build
cmake ..
cmake --build . --target install
```
