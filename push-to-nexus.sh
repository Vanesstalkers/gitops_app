#!/usr/bin/env sh
set -eu

# Usage:
#   ./push-to-nexus.sh [tag]
# Example:
#   ./push-to-nexus.sh nexus-v3

TAG="${1:-nexus-v3}"
REGISTRY="${REGISTRY:-172.17.0.1:18082}"
IMAGE_NAME="${IMAGE_NAME:-php-hello}"
USERNAME="${USERNAME:-admin}"
NEXUS_PASSWORD="${NEXUS_PASSWORD:-}"

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
