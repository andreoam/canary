#!/bin/bash

set -euo pipefail

# Armazena o diretório inicial
INITIAL_DIR=$(pwd)

# Variáveis
VCPKG_PATH=${1:-"$HOME"}
VCPKG_PATH=$VCPKG_PATH/vcpkg/scripts/buildsystems/vcpkg.cmake
BUILD_TYPE=${2:-"linux-release"}
ARCHITECTURE=$(uname -m)
ARCHITECTUREVALUE=0

# Function to print information messages
info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

# Function to check if a command is available
check_command() {
    if ! command -v "$1" >/dev/null; then
        echo "The command '$1' is not available. Please install it and try again."
        exit 1
    fi
}

# Function to check the architecture
check_architecture() {
    if [[ $ARCHITECTURE == "aarch64"* ]]; then
        info "Its architecture is ARM"
        ARCHITECTUREVALUE=1
        export VCPKG_FORCE_SYSTEM_BINARIES=1  # Export the variable early for ARM
    else
        info "Its architecture is $ARCHITECTURE"
    fi
}

# Preparation before build
prepare_build_environment() {
    info "Preparing build environment..."
    
    # Install necessary packages
    sudo apt update && sudo apt upgrade -y
    sudo apt install --reinstall libluajit-5.1-dev git cmake build-essential autoconf libtool ca-certificates \
                     curl zip unzip tar pkg-config ninja-build ccache linux-headers-$(uname -r) acl -y
    
    # Replace arm_acle.h file
    sudo curl -o /usr/lib/gcc/aarch64-linux-gnu/11/include/arm_acle.h \
        https://raw.githubusercontent.com/gcc-mirror/gcc/8e8f6434760cfe2a1c6c9644181189fdb4d987bb/gcc/config/aarch64/arm_acle.h

    # Update cmake
    sudo apt remove --purge cmake -y
    hash -r
    sudo apt install snapd -y
    sudo snap install cmake --classic
    cmake --version

    # Update gcc
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
    sudo apt update
    sudo apt install --reinstall gcc g++ gcc-13 g++-13 binutils libgcc-13-dev libstdc++-13-dev libc6-dev -y 

    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 100 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-13 \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-13 \
    --slave /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-13  \
    --slave /usr/bin/aarch64-linux-gnu-g++ aarch64-linux-gnu-g++ /usr/bin/aarch64-linux-gnu-g++-13

    sudo update-alternatives --set gcc /usr/bin/gcc-13
    sudo apt autoremove -y

    # Install or update vcpkg
    cd ~
    if [ -d "$HOME/vcpkg" ]; then
        cd vcpkg
        git pull
        ./vcpkg upgrade
        ./vcpkg upgrade --no-dry-run
        info "Ensuring VCPKG_FORCE_SYSTEM_BINARIES is set for ARM..."
        [[ $ARCHITECTUREVALUE == 1 ]] && export VCPKG_FORCE_SYSTEM_BINARIES=1
        ./bootstrap-vcpkg.sh
    else
        git clone https://github.com/microsoft/vcpkg
        cd vcpkg
        info "Ensuring VCPKG_FORCE_SYSTEM_BINARIES is set for ARM..."
        [[ $ARCHITECTUREVALUE == 1 ]] && export VCPKG_FORCE_SYSTEM_BINARIES=1
        ./bootstrap-vcpkg.sh
    fi

    # Volta para o diretório inicial após atualizar/instalar o vcpkg
    cd "$INITIAL_DIR"

    # Verify if the variable is correctly set
    if [[ $ARCHITECTUREVALUE == 1 ]]; then
        if [[ -z ${VCPKG_FORCE_SYSTEM_BINARIES+x} ]]; then
            echo "[ERROR] VCPKG_FORCE_SYSTEM_BINARIES is not set!"
            exit 1
        else
            info "VCPKG_FORCE_SYSTEM_BINARIES is set correctly."
        fi
    fi
}

# Function to configure Canary
setup_canary() {
    if [ -d "build" ]; then
        info "Removing existing build directory..."
        rm -rf build  # Remove the existing build directory
    fi
    
    mkdir -p build && cd build  # Recreate the build directory and enter it
    info "Canary is now being configured..."
}


# Function to build Canary
build_canary() {
    info "Configuring Canary..."
    [[ $ARCHITECTUREVALUE == 1 ]] && export VCPKG_FORCE_SYSTEM_BINARIES=1
    cmake -DCMAKE_TOOLCHAIN_FILE="$VCPKG_PATH" .. --preset "$BUILD_TYPE" >cmake_log.txt 2>&1 || {
        cat cmake_log.txt
        return 1
    }

    info "Starting the build process..."

    local total_steps=0
    local progress=0
    local build_status=0

    global_beats=0
    local temp_file="temp_global_beats.txt"
    echo "0" >$temp_file

    cmake --build "$BUILD_TYPE" 2>&1 > >(while IFS= read -r line; do
        echo "$line" >>build_log.txt
        if [[ $line =~ ^\[([0-9]+)/([0-9]+)\].* ]]; then
            current_step=${BASH_REMATCH[1]}
            total_steps=${BASH_REMATCH[2]}
            progress=$((current_step * 100 / total_steps))
            printf "\r\033[1;32m[INFO]\033[0m Progress build: [%3d%%]" $progress
            echo "1" >$temp_file
        fi
    done) || build_status=1

    global_beats=$(cat $temp_file)
    rm $temp_file

    if [[ $build_status -eq 0 ]]; then
        if [[ $global_beats == 1 ]]; then
            echo
        fi
        return 0
    else
        echo
        cat build_log.txt
        return 1
    fi
}

# Function to move the generated executable
move_executable() {
    local executable_name="canary"
    cd ..
    if [ -e "$executable_name" ]; then
        info "Saving old build"
        mv ./"$executable_name" ./"$executable_name".old
    fi
    info "Moving the generated executable to the canary folder directory..."
    cp ./build/linux-release/bin/"$executable_name" ./"$executable_name"
    info "Build completed successfully!"
}

# Main function
main() {
    check_command "cmake"
    check_architecture
    prepare_build_environment
    setup_canary

    if build_canary; then
        move_executable
    else
        echo -e "\033[31m[ERROR]\033[0m Build failed..."
        exit 1
    fi
}

main