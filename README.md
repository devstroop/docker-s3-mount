# Docker S3 Mount

```
AWS_ENDPOINT_URL=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_BUCKET=
LOCAL_PATH=/home/ubuntu/your-path
```

# Mountpoint (Guide)

```
  <DIRECTORY>
          Directory or FUSE file descriptor to mount the bucket at.
          
          For directory mount points, the passed path must be an existing directory.
          
          For FUSE file descriptors (Linux-only), it should be of the format `/dev/fd/N`.
          Learn more in Mountpoint's configuration documentation (CONFIGURATION.md).

Options:
  -f, --foreground
          Run as foreground process

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]

      --region <REGION>
          AWS region of the bucket [default: auto-detect region]

      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]

      --force-path-style
          Force path-style addressing

      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.

      --dual-stack
          Use dual-stack endpoints when accessing S3

      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests

      --bucket-type <BUCKET_TYPE>
          Type of S3 bucket to use [default: inferred from bucket name]
          
          [possible values: general-purpose, directory]

      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects

      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

      --sse <SSE>
          Server-side encryption algorithm to use when uploading new objects
          
          [possible values: aws:kms, aws:kms:dsse, AES256]

      --sse-kms-key-id <AWS_KMS_KEY_ARN>
          AWS Key Management Service (KMS) key ARN to use with KMS server-side encryption when uploading new objects. Key ID, Alias and Alias ARN are all not supported.

      --upload-checksums <ALGORITHM>
          Checksum algorithm to use for S3 uploads [default: crc32c]
          
          [possible values: crc32c, off]

AWS credentials options:
      --no-sign-request
          Do not sign requests. Credentials will not be loaded if this argument is provided.

      --profile <PROFILE>
          Use a specific profile from your credential file.

Mount options:
      --read-only
          Mount file system in read-only mode

      --allow-delete
          Allow delete operations on file system

      --allow-overwrite
          Allow overwrite operations on file system

      --incremental-upload
          Enable incremental uploads and support for appending to existing objects

      --auto-unmount
          Automatically unmount on exit

      --allow-root
          Allow root user to access file system

      --allow-other
          Allow other users, including root, to access file system

      --uid <UID>
          Owner UID [default: current user's UID]

      --gid <GID>
          Owner GID [default: current user's GID]

      --dir-mode <DIR_MODE>
          Directory permissions [default: 0755]

      --file-mode <FILE_MODE>
          File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>
          Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]

      --max-threads <N>
          Maximum number of FUSE daemon threads
          
          [default: 16]

      --part-size <SIZE>
          Part size for multi-part GET and PUT in bytes
          
          [default: 8388608]

      --read-part-size <SIZE>
          Part size for GET in bytes [default: 8388608]

      --write-part-size <SIZE>
          Part size for multi-part PUT in bytes [default: 8388608]

      --bind <NETWORK_INTERFACE>
          One or more network interfaces for Mountpoint to use when accessing S3. Requires Linux 5.7+ or running as root. This feature is a work-in-progress.

Logging options:
  -l, --log-directory <DIRECTORY>
          Write log files to a directory [default: logs written to syslog]

      --log-metrics
          Enable logging of summarized performance metrics

  -d, --debug
          Enable debug logging for Mountpoint

      --debug-crt
          Enable debug logging for AWS Common Runtime

      --no-log
          Disable all logging. You will still see stdout messages.

Caching options:
      --cache <DIRECTORY>
          Enable caching of object content to the given directory and set metadata TTL to 60 seconds

      --metadata-ttl <SECONDS|indefinite|minimal>
          Time-to-live (TTL) for cached metadata in seconds [default: minimal, or 60 seconds if --cache is set]

      --max-cache-size <MiB>
          Maximum size of the cache directory in MiB [default: preserve 5% of available space]

      --cache-xz <BUCKET>
          Enable caching of object content to the specified bucket on S3 Express One Zone (same region only)

Advanced options:
      --user-agent-prefix <PREFIX>
          Configure a string to be prepended to the 'User-Agent' HTTP request header for all S3 requests
Mountpoint for Amazon S3

Usage: mount-s3 [OPTIONS] <BUCKET_NAME> <DIRECTORY>

Arguments:
  <BUCKET_NAME>
          Name of bucket to mount

  <DIRECTORY>
          Directory or FUSE file descriptor to mount the bucket at.
          
          For directory mount points, the passed path must be an existing directory.
          
          For FUSE file descriptors (Linux-only), it should be of the format `/dev/fd/N`.
          Learn more in Mountpoint's configuration documentation (CONFIGURATION.md).

Options:
  -f, --foreground
          Run as foreground process

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]

      --region <REGION>
          AWS region of the bucket [default: auto-detect region]

      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]

      --force-path-style
          Force path-style addressing

      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.

      --dual-stack
          Use dual-stack endpoints when accessing S3

      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests

      --bucket-type <BUCKET_TYPE>
          Type of S3 bucket to use [default: inferred from bucket name]
          
          [possible values: general-purpose, directory]

      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects

      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

      --sse <SSE>
          Server-side encryption algorithm to use when uploading new objects
          
          [possible values: aws:kms, aws:kms:dsse, AES256]

      --sse-kms-key-id <AWS_KMS_KEY_ARN>
          AWS Key Management Service (KMS) key ARN to use with KMS server-side encryption when uploading new objects. Key ID, Alias and Alias ARN are all not supported.

      --upload-checksums <ALGORITHM>
          Checksum algorithm to use for S3 uploads [default: crc32c]
          
          [possible values: crc32c, off]

AWS credentials options:
      --no-sign-request
          Do not sign requests. Credentials will not be loaded if this argument is provided.

      --profile <PROFILE>
          Use a specific profile from your credential file.

Mount options:
      --read-only
          Mount file system in read-only mode

      --allow-delete
          Allow delete operations on file system

      --allow-overwrite
          Allow overwrite operations on file system

      --incremental-upload
          Enable incremental uploads and support for appending to existing objects

      --auto-unmount
          Automatically unmount on exit

      --allow-root
          Allow root user to access file system

      --allow-other
          Allow other users, including root, to access file system

      --uid <UID>
          Owner UID [default: current user's UID]

      --gid <GID>
          Owner GID [default: current user's GID]

      --dir-mode <DIR_MODE>
          Directory permissions [default: 0755]

      --file-mode <FILE_MODE>
          File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>
          Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]

      --max-threads <N>
          Maximum number of FUSE daemon threads
          
          [default: 16]

      --part-size <SIZE>
          Part size for multi-part GET and PUT in bytes
          
          [default: 8388608]

      --read-part-size <SIZE>
          Part size for GET in bytes [default: 8388608]

      --write-part-size <SIZE>
          Part size for multi-part PUT in bytes [default: 8388608]

      --bind <NETWORK_INTERFACE>
          One or more network interfaces for Mountpoint to use when accessing S3. Requires Linux 5.7+ or running as root. This feature is a work-in-progress.

Logging options:
  -l, --log-directory <DIRECTORY>
          Write log files to a directory [default: logs written to syslog]

      --log-metrics
          Enable logging of summarized performance metrics

  -d, --debug
          Enable debug logging for Mountpoint

      --debug-crt
          Enable debug logging for AWS Common Runtime

      --no-log
          Disable all logging. You will still see stdout messages.

Caching options:
      --cache <DIRECTORY>
          Enable caching of object content to the given directory and set metadata TTL to 60 seconds

      --metadata-ttl <SECONDS|indefinite|minimal>
          Time-to-live (TTL) for cached metadata in seconds [default: minimal, or 60 seconds if --cache is set]

      --max-cache-size <MiB>
          Maximum size of the cache directory in MiB [default: preserve 5% of available space]

      --cache-xz <BUCKET>
          Enable caching of object content to the specified bucket on S3 Express One Zone (same region only)

Advanced options:
      --user-agent-prefix <PREFIX>
          Configure a string to be prepended to the 'User-Agent' HTTP request header for all S3 requests
Mountpoint for Amazon S3

Usage: mount-s3 [OPTIONS] <BUCKET_NAME> <DIRECTORY>

Arguments:
  <BUCKET_NAME>
          Name of bucket to mount

  <DIRECTORY>
          Directory or FUSE file descriptor to mount the bucket at.
          
          For directory mount points, the passed path must be an existing directory.
          
          For FUSE file descriptors (Linux-only), it should be of the format `/dev/fd/N`.
          Learn more in Mountpoint's configuration documentation (CONFIGURATION.md).

Options:
  -f, --foreground
          Run as foreground process

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]

      --region <REGION>
          AWS region of the bucket [default: auto-detect region]

      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]

      --force-path-style
          Force path-style addressing

      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.

      --dual-stack
          Use dual-stack endpoints when accessing S3

      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests

      --bucket-type <BUCKET_TYPE>
          Type of S3 bucket to use [default: inferred from bucket name]
          
          [possible values: general-purpose, directory]

      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects

      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

      --sse <SSE>
          Server-side encryption algorithm to use when uploading new objects
          
          [possible values: aws:kms, aws:kms:dsse, AES256]

      --sse-kms-key-id <AWS_KMS_KEY_ARN>
          AWS Key Management Service (KMS) key ARN to use with KMS server-side encryption when uploading new objects. Key ID, Alias and Alias ARN are all not supported.

      --upload-checksums <ALGORITHM>
          Checksum algorithm to use for S3 uploads [default: crc32c]
          
          [possible values: crc32c, off]

AWS credentials options:
      --no-sign-request
          Do not sign requests. Credentials will not be loaded if this argument is provided.

      --profile <PROFILE>
          Use a specific profile from your credential file.

Mount options:
      --read-only
          Mount file system in read-only mode

      --allow-delete
          Allow delete operations on file system

      --allow-overwrite
          Allow overwrite operations on file system

      --incremental-upload
          Enable incremental uploads and support for appending to existing objects

      --auto-unmount
          Automatically unmount on exit

      --allow-root
          Allow root user to access file system

      --allow-other
          Allow other users, including root, to access file system

      --uid <UID>
          Owner UID [default: current user's UID]

      --gid <GID>
          Owner GID [default: current user's GID]

      --dir-mode <DIR_MODE>
          Directory permissions [default: 0755]

      --file-mode <FILE_MODE>
          File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>
          Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]

      --max-threads <N>
          Maximum number of FUSE daemon threads
          
          [default: 16]

      --part-size <SIZE>
          Part size for multi-part GET and PUT in bytes
          
          [default: 8388608]

      --read-part-size <SIZE>
          Part size for GET in bytes [default: 8388608]

      --write-part-size <SIZE>
          Part size for multi-part PUT in bytes [default: 8388608]

      --bind <NETWORK_INTERFACE>
          One or more network interfaces for Mountpoint to use when accessing S3. Requires Linux 5.7+ or running as root. This feature is a work-in-progress.

Logging options:
  -l, --log-directory <DIRECTORY>
          Write log files to a directory [default: logs written to syslog]

      --log-metrics
          Enable logging of summarized performance metrics

  -d, --debug
          Enable debug logging for Mountpoint

      --debug-crt
          Enable debug logging for AWS Common Runtime

      --no-log
          Disable all logging. You will still see stdout messages.

Caching options:
      --cache <DIRECTORY>
          Enable caching of object content to the given directory and set metadata TTL to 60 seconds

      --metadata-ttl <SECONDS|indefinite|minimal>
          Time-to-live (TTL) for cached metadata in seconds [default: minimal, or 60 seconds if --cache is set]

      --max-cache-size <MiB>
          Maximum size of the cache directory in MiB [default: preserve 5% of available space]

      --cache-xz <BUCKET>
          Enable caching of object content to the specified bucket on S3 Express One Zone (same region only)

Advanced options:
      --user-agent-prefix <PREFIX>
          Configure a string to be prepended to the 'User-Agent' HTTP request header for all S3 requests
Mountpoint for Amazon S3

Usage: mount-s3 [OPTIONS] <BUCKET_NAME> <DIRECTORY>

Arguments:
  <BUCKET_NAME>
          Name of bucket to mount

  <DIRECTORY>
          Directory or FUSE file descriptor to mount the bucket at.
          
          For directory mount points, the passed path must be an existing directory.
          
          For FUSE file descriptors (Linux-only), it should be of the format `/dev/fd/N`.
          Learn more in Mountpoint's configuration documentation (CONFIGURATION.md).

Options:
  -f, --foreground
          Run as foreground process

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]

      --region <REGION>
          AWS region of the bucket [default: auto-detect region]

      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]

      --force-path-style
          Force path-style addressing

      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.

      --dual-stack
          Use dual-stack endpoints when accessing S3

      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests

      --bucket-type <BUCKET_TYPE>
          Type of S3 bucket to use [default: inferred from bucket name]
          
          [possible values: general-purpose, directory]

      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects

      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

      --sse <SSE>
          Server-side encryption algorithm to use when uploading new objects
          
          [possible values: aws:kms, aws:kms:dsse, AES256]

      --sse-kms-key-id <AWS_KMS_KEY_ARN>
          AWS Key Management Service (KMS) key ARN to use with KMS server-side encryption when uploading new objects. Key ID, Alias and Alias ARN are all not supported.

      --upload-checksums <ALGORITHM>
          Checksum algorithm to use for S3 uploads [default: crc32c]
          
          [possible values: crc32c, off]

AWS credentials options:
      --no-sign-request
          Do not sign requests. Credentials will not be loaded if this argument is provided.

      --profile <PROFILE>
          Use a specific profile from your credential file.

Mount options:
      --read-only
          Mount file system in read-only mode

      --allow-delete
          Allow delete operations on file system

      --allow-overwrite
          Allow overwrite operations on file system

      --incremental-upload
          Enable incremental uploads and support for appending to existing objects

      --auto-unmount
          Automatically unmount on exit

      --allow-root
          Allow root user to access file system

      --allow-other
          Allow other users, including root, to access file system

      --uid <UID>
          Owner UID [default: current user's UID]

      --gid <GID>
          Owner GID [default: current user's GID]

      --dir-mode <DIR_MODE>
          Directory permissions [default: 0755]

      --file-mode <FILE_MODE>
          File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>
          Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]

      --max-threads <N>
          Maximum number of FUSE daemon threads
          
          [default: 16]

      --part-size <SIZE>
          Part size for multi-part GET and PUT in bytes
          
          [default: 8388608]

      --read-part-size <SIZE>
          Part size for GET in bytes [default: 8388608]

      --write-part-size <SIZE>
          Part size for multi-part PUT in bytes [default: 8388608]

      --bind <NETWORK_INTERFACE>
          One or more network interfaces for Mountpoint to use when accessing S3. Requires Linux 5.7+ or running as root. This feature is a work-in-progress.

Logging options:
  -l, --log-directory <DIRECTORY>
          Write log files to a directory [default: logs written to syslog]

      --log-metrics
          Enable logging of summarized performance metrics

  -d, --debug
          Enable debug logging for Mountpoint

      --debug-crt
          Enable debug logging for AWS Common Runtime

      --no-log
          Disable all logging. You will still see stdout messages.

Caching options:
      --cache <DIRECTORY>
          Enable caching of object content to the given directory and set metadata TTL to 60 seconds

      --metadata-ttl <SECONDS|indefinite|minimal>
          Time-to-live (TTL) for cached metadata in seconds [default: minimal, or 60 seconds if --cache is set]

      --max-cache-size <MiB>
          Maximum size of the cache directory in MiB [default: preserve 5% of available space]

      --cache-xz <BUCKET>
          Enable caching of object content to the specified bucket on S3 Express One Zone (same region only)

Advanced options:
      --user-agent-prefix <PREFIX>
          Configure a string to be prepended to the 'User-Agent' HTTP request header for all S3 requests
Mountpoint for Amazon S3

Usage: mount-s3 [OPTIONS] <BUCKET_NAME> <DIRECTORY>

Arguments:
  <BUCKET_NAME>
          Name of bucket to mount

  <DIRECTORY>
          Directory or FUSE file descriptor to mount the bucket at.
          
          For directory mount points, the passed path must be an existing directory.
          
          For FUSE file descriptors (Linux-only), it should be of the format `/dev/fd/N`.
          Learn more in Mountpoint's configuration documentation (CONFIGURATION.md).

Options:
  -f, --foreground
          Run as foreground process

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]

      --region <REGION>
          AWS region of the bucket [default: auto-detect region]

      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]

      --force-path-style
          Force path-style addressing

      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.

      --dual-stack
          Use dual-stack endpoints when accessing S3

      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests

      --bucket-type <BUCKET_TYPE>
          Type of S3 bucket to use [default: inferred from bucket name]
          
          [possible values: general-purpose, directory]

      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects

      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

      --sse <SSE>
          Server-side encryption algorithm to use when uploading new objects
          
          [possible values: aws:kms, aws:kms:dsse, AES256]

      --sse-kms-key-id <AWS_KMS_KEY_ARN>
          AWS Key Management Service (KMS) key ARN to use with KMS server-side encryption when uploading new objects. Key ID, Alias and Alias ARN are all not supported.

      --upload-checksums <ALGORITHM>
          Checksum algorithm to use for S3 uploads [default: crc32c]
          
          [possible values: crc32c, off]

AWS credentials options:
      --no-sign-request
          Do not sign requests. Credentials will not be loaded if this argument is provided.

      --profile <PROFILE>
          Use a specific profile from your credential file.

Mount options:
      --read-only
          Mount file system in read-only mode

      --allow-delete
          Allow delete operations on file system

      --allow-overwrite
          Allow overwrite operations on file system

      --incremental-upload
          Enable incremental uploads and support for appending to existing objects

      --auto-unmount
          Automatically unmount on exit

      --allow-root
          Allow root user to access file system

      --allow-other
          Allow other users, including root, to access file system

      --uid <UID>
          Owner UID [default: current user's UID]

      --gid <GID>
          Owner GID [default: current user's GID]

      --dir-mode <DIR_MODE>
          Directory permissions [default: 0755]

      --file-mode <FILE_MODE>
          File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>
          Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]

      --max-threads <N>
          Maximum number of FUSE daemon threads
          
          [default: 16]

      --part-size <SIZE>
          Part size for multi-part GET and PUT in bytes
          
          [default: 8388608]

      --read-part-size <SIZE>
          Part size for GET in bytes [default: 8388608]

      --write-part-size <SIZE>
          Part size for multi-part PUT in bytes [default: 8388608]

      --bind <NETWORK_INTERFACE>
          One or more network interfaces for Mountpoint to use when accessing S3. Requires Linux 5.7+ or running as root. This feature is a work-in-progress.

Logging options:
  -l, --log-directory <DIRECTORY>
          Write log files to a directory [default: logs written to syslog]

      --log-metrics
          Enable logging of summarized performance metrics

  -d, --debug
          Enable debug logging for Mountpoint

      --debug-crt
          Enable debug logging for AWS Common Runtime

      --no-log
          Disable all logging. You will still see stdout messages.

Caching options:
      --cache <DIRECTORY>
          Enable caching of object content to the given directory and set metadata TTL to 60 seconds

      --metadata-ttl <SECONDS|indefinite|minimal>
          Time-to-live (TTL) for cached metadata in seconds [default: minimal, or 60 seconds if --cache is set]

      --max-cache-size <MiB>
          Maximum size of the cache directory in MiB [default: preserve 5% of available space]

      --cache-xz <BUCKET>
          Enable caching of object content to the specified bucket on S3 Express One Zone (same region only)

Advanced options:
      --user-agent-prefix <PREFIX>
          Configure a string to be prepended to the 'User-Agent' HTTP request header for all S3 requests
Mountpoint for Amazon S3

Usage: mount-s3 [OPTIONS] <BUCKET_NAME> <DIRECTORY>

Arguments:
  <BUCKET_NAME>
          Name of bucket to mount

  <DIRECTORY>
          Directory or FUSE file descriptor to mount the bucket at.
          
          For directory mount points, the passed path must be an existing directory.
          
          For FUSE file descriptors (Linux-only), it should be of the format `/dev/fd/N`.
          Learn more in Mountpoint's configuration documentation (CONFIGURATION.md).

Options:
  -f, --foreground
          Run as foreground process

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]

      --region <REGION>
          AWS region of the bucket [default: auto-detect region]

      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]

      --force-path-style
          Force path-style addressing

      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.

      --dual-stack
          Use dual-stack endpoints when accessing S3

      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests

      --bucket-type <BUCKET_TYPE>
          Type of S3 bucket to use [default: inferred from bucket name]
          
          [possible values: general-purpose, directory]

      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects

      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

      --sse <SSE>
          Server-side encryption algorithm to use when uploading new objects
          
          [possible values: aws:kms, aws:kms:dsse, AES256]

      --sse-kms-key-id <AWS_KMS_KEY_ARN>
          AWS Key Management Service (KMS) key ARN to use with KMS server-side encryption when uploading new objects. Key ID, Alias and Alias ARN are all not supported.

      --upload-checksums <ALGORITHM>
          Checksum algorithm to use for S3 uploads [default: crc32c]
          
          [possible values: crc32c, off]

AWS credentials options:
      --no-sign-request
          Do not sign requests. Credentials will not be loaded if this argument is provided.

      --profile <PROFILE>
          Use a specific profile from your credential file.

Mount options:
      --read-only
          Mount file system in read-only mode

      --allow-delete
          Allow delete operations on file system

      --allow-overwrite
          Allow overwrite operations on file system

      --incremental-upload
          Enable incremental uploads and support for appending to existing objects

      --auto-unmount
          Automatically unmount on exit

      --allow-root
          Allow root user to access file system

      --allow-other
          Allow other users, including root, to access file system

      --uid <UID>
          Owner UID [default: current user's UID]

      --gid <GID>
          Owner GID [default: current user's GID]

      --dir-mode <DIR_MODE>
          Directory permissions [default: 0755]

      --file-mode <FILE_MODE>
          File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>
          Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]

      --max-threads <N>
          Maximum number of FUSE daemon threads
          
          [default: 16]

      --part-size <SIZE>
          Part size for multi-part GET and PUT in bytes
          
          [default: 8388608]

      --read-part-size <SIZE>
          Part size for GET in bytes [default: 8388608]

      --write-part-size <SIZE>
          Part size for multi-part PUT in bytes [default: 8388608]

      --bind <NETWORK_INTERFACE>
          One or more network interfaces for Mountpoint to use when accessing S3. Requires Linux 5.7+ or running as root. This feature is a work-in-progress.

Logging options:
  -l, --log-directory <DIRECTORY>
          Write log files to a directory [default: logs written to syslog]

      --log-metrics
          Enable logging of summarized performance metrics

  -d, --debug
          Enable debug logging for Mountpoint

      --debug-crt
          Enable debug logging for AWS Common Runtime

      --no-log
          Disable all logging. You will still see stdout messages.

Caching options:
      --cache <DIRECTORY>
          Enable caching of object content to the given directory and set metadata TTL to 60 seconds

      --metadata-ttl <SECONDS|indefinite|minimal>
          Time-to-live (TTL) for cached metadata in seconds [default: minimal, or 60 seconds if --cache is set]

      --max-cache-size <MiB>
          Maximum size of the cache directory in MiB [default: preserve 5% of available space]

      --cache-xz <BUCKET>
          Enable caching of object content to the specified bucket on S3 Express One Zone (same region only)

Advanced options:
      --user-agent-prefix <PREFIX>
          Configure a string to be prepended to the 'User-Agent' HTTP request header for all S3 requests

```
