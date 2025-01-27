#!/bin/bash

# Ensure the mountpoint directory exists
mkdir -p /mountpoint/$AWS_BUCKET

# Execute the mount-s3 command
exec mount-s3 $AWS_BUCKET /mountpoint/$AWS_BUCKET --allow-other
