##!/bin/sh
mkdir -p /mountpoint/$AWS_BUCKET
mount-s3 -f $AWS_BUCKET /mountpoint/$AWS_BUCKET --allow-other
