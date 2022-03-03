#!/bin/bash

CONTAINER_VER=$(date +"%Y.%m.%d")
PRODUCT_NAME="ntc-chip"
FILES="sw-description installscript.sh rootfs.ubifs"
for i in $FILES;do
	echo $i;done | cpio -ov -H crc >  ${PRODUCT_NAME}_${CONTAINER_VER}.swu
