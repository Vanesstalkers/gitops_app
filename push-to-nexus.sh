#!/usr/bin/env sh
set -eu

# Usage:
#   ./push-to-nexus.sh [tag]
# Example:
#   ./push-to-nexus.sh nexus-v3

TAG="${1:-nexus-v3}"
REGISTRY="${REGISTRY:-localhost:18082}"
IMAGE_NAME="${IMAGE_NAME:-php-hello}"
USERNAME="admin"
NEXUS_PASSWORD="${NEXUS_PASSWORD:-f7346f95-2b96-4466-bba1-dace504331a2}"

if [ -z "$NEXUS_PASSWORD" ]; then
  echo "ERROR: set NEXUS_PASSWORD env variable before running."
  echo "Example: NEXUS_PASSWORD='***' ./push-to-nexus.sh nexus-v3"
  exit 1
fi

IMAGE="${REGISTRY}/${IMAGE_NAME}:${TAG}"

echo "Logging into ${REGISTRY} as ${USERNAME}..."
printf '%s' "$NEXUS_PASSWORD" | docker login "$REGISTRY" -u "$USERNAME" --password-stdin

echo "Building image ${IMAGE}..."
docker build -t "$IMAGE" .

echo "Pushing image ${IMAGE}..."
docker push "$IMAGE"

echo "Done. Pushed ${IMAGE}"
