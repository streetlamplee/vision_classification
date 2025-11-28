cd "$(dirname "${BASH_SOURCE[0]}")" || exit

CURRENT_DIR=$(basename "$(pwd)")
VERSION="v1"

IMAGE_NAME="${CURRENT_DIR}:${VERSION}"
IMAGE_TAR="${CURRENT_DIR}.tar"

sudo docker build -t "$IMAGE_NAME" .

sudo docker save "$IMAGE_NAME" -o "$IMAGE_TAR"

sudo k3s ctr images import "$IMAGE_TAR"