#!/bin/bash -xe

NDK_PATH=~/Android
NDK_BIN=${NDK_PATH}/toolchains/aarch64-linux-android-4.9/bin/

CXX=aarch64-linux-android-clang++

export PATH=${NDK_BIN}:${PATH}

ARM_COMPUTE_PATH=~/projects/arm_compute-v18.01-bin

WHICH_EXAMPLE=graph_mobilenet

${CXX} \
  ${WHICH_EXAMPLE}.cpp \
  ${ARM_COMPUTE_PATH}/utils/Utils.cpp \
  ${ARM_COMPUTE_PATH}/utils/GraphUtils.cpp \
  -I${ARM_COMPUTE_PATH} \
  -I${ARM_COMPUTE_PATH}/include \
  -std=c++11 \
  -Wl,--whole-archive -larm_compute_graph-static -Wl,--no-whole-archive \
  -larm_compute-static \
  -larm_compute_core-static \
  -L${ARM_COMPUTE_PATH}/ \
  -L${ARM_COMPUTE_PATH}/lib/android-arm64-v8a-neon-cl/ \
  -o ${WHICH_EXAMPLE}_aarch64 \
  -static-libstdc++ \
  -pie
