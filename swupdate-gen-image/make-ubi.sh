#!/bin/bash

sudo mkfs.ubifs -q -r $1 -m 16384 -e 2064384 -c 2048 -o rootfs.ubifs
