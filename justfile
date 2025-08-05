OPTIMIZER_NAME := "leftcurve/optimizer"
OPTIMIZER_VERSION := "0.2.0"
BOB_GIT_COMMIT := "main"
BINARYEN_GIT_TAG := "version_123"

# Build the optimizer Docker image for the amd64 platform
docker-build-amd64:
  docker buildx build \
    --load \
    --platform linux/amd64 \
    --build-arg BOB_GIT_COMMIT={{BOB_GIT_COMMIT}} \
    --build-arg BINARYEN_GIT_TAG={{BINARYEN_GIT_TAG}} \
    --tag {{OPTIMIZER_NAME}}:{{OPTIMIZER_VERSION}} \
    --target optimizer \
    docker/optimizer

# Build the optimizer Docker image for the arm64 platform
docker-build-arm64:
  docker buildx build \
    --load \
    --platform linux/arm64 \
    --build-arg BOB_GIT_COMMIT={{BOB_GIT_COMMIT}} \
    --build-arg BINARYEN_GIT_TAG={{BINARYEN_GIT_TAG}} \
    --tag {{OPTIMIZER_NAME}}:{{OPTIMIZER_VERSION}}-arm64 \
    --target optimizer \
    docker/optimizer
