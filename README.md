# Image Sync Action

- Use [image-syncer](https://github.com/AliyunContainerService/image-syncer) to sync images between docker registries.

## How to use

#### Typical Use Case

```yaml
- name: Checkout
  uses: actions/checkout@v3
- uses: hhyasdf/image-sync-action@v1.1
  with:
    auth_file: ./auth.yaml # The auth information file of registries, optional.
    images_file: ./images.yaml # The images file descirbes which images need to sync, always needed.
    version: latest # The version of image-syncer, use the latest version if not specified.
    proc: 6 # The max number of goroutines to sync images, default value is 5.
  env:
    TEST_PASSWORD: ${{ secrets.TEST_PASSWORD }} # For safty consideration, passing registry password by github action secrets is needed.
```

To use the `TEST_PASSWORD` environment variable as a password, the auth file needs to include something like:

```yaml
registry.cn-beijing.aliyuncs.com:
  username: test
  password: ${TEST_PASSWORD}
```

For more information of how to create an auth file or images file, refer to the [image-syncer configure files](https://github.com/AliyunContainerService/image-syncer/blob/master/README.md#configure-files).

#### Example

[image-sync-action-example](https://github.com/hhyasdf/image-sync-action-example)