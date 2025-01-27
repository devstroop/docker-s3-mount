#!/bin/bash

# Fail on any error
set -e

# Ensure the bucket name is set
if [ -z "$AWS_BUCKET" ]; then
  echo "Error: AWS_BUCKET environment variable is not set."
  exit 1
fi

# Ensure the mountpoint directory exists
mkdir -p /mountpoint/$AWS_BUCKET

# Execute the mount-s3 command
exec mount-s3 -f "$AWS_BUCKET" "/mountpoint/$AWS_BUCKET" --allow-other
