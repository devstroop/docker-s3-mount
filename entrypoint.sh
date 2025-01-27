##!/bin/sh
mount-s3 -f $AWS_BUCKET /mountpoint/$AWS_BUCKET --allow-other
