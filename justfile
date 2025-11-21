OPTIMIZER_NAME := "leftcurve/bob"
OPTIMIZER_VERSION := "0.2.0"
BOB_GIT_COMMIT := "main"
BINARYEN_GIT_TAG := "version_125"

# List available recipes
default:
  @just --list

# Run rustfmt
fmt:
  cargo +nightly fmt --all

# Perform linting
lint:
  cargo clippy --bins --tests --benches --examples --all-features --all-targets -- -D warnings

# Build the optimizer Docker image for the amd64 platform
docker-build-amd64:
  docker buildx build \
    --load \
    --platform linux/amd64 \
    --build-arg BOB_GIT_COMMIT={{BOB_GIT_COMMIT}} \
    --build-arg BINARYEN_GIT_TAG={{BINARYEN_GIT_TAG}} \
    --tag {{OPTIMIZER_NAME}}:{{OPTIMIZER_VERSION}} \
    --target optimizer \
    .

# Build the optimizer Docker image for the arm64 platform
docker-build-arm64:
  docker buildx build \
    --load \
    --platform linux/arm64 \
    --build-arg BOB_GIT_COMMIT={{BOB_GIT_COMMIT}} \
    --build-arg BINARYEN_GIT_TAG={{BINARYEN_GIT_TAG}} \
    --tag {{OPTIMIZER_NAME}}-arm64:{{OPTIMIZER_VERSION}} \
    --target optimizer \
    .

# TODO: build multi-platform image instead.
