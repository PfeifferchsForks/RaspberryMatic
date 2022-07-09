#!/bin/bash

# Stop on error
set -e

#BOARD_DIR=${1}
PRODUCT=${2}
PRODUCT_VERSION=${3}
BOARD=$(echo "${PRODUCT}" | cut -d'_' -f2-)

# copy prepared docker image to release path
cp -a "build-${PRODUCT}/images/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tar" ./release/
#(cd "./release/updatepkg/${PRODUCT}" && tar --numeric-owner --owner=root --group=root -rvf "../../RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tar" update_script EULA.de EULA.en)
gzip -f "./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tar"
mv "./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tar.gz" "./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tgz"
(cd ./release && sha256sum "RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tgz" >"RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tgz.sha256")

# create manifest file with checksum+sizes
rm -f "./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.mf"

# shellcheck disable=SC2129
echo "$(stat -c %s "./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tgz") $(cat "./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.tgz.sha256")" >>"./release/RaspberryMatic-${PRODUCT_VERSION}-${BOARD}.mf"

exit $?
