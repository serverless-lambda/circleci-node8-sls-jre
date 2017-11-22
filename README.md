# svls/serverless

Run serverless deploy, dynamodb-local, serverless offline plugin and unit test in docker container.

## Usage

```bash
# build, tag, push image to docker hub, update git tag with latest serverless release (one-time task)
$ make release

# Run serverless deploy in the image.
$ docker pull svls/serverless:1.24.1
$ docker run --rm -it -v $(pwd):/opt/app -v ~/.aws:/root/.aws -v ~/.ssh:/root/.ssh svls/serverless:1.24.1 bash
bash-4.3# sls plugin install -n serverless-dynamodb-local
bash-4.3# sls plugin install -n serverless-offline
bash-4.3# sls dynamodb install
bash-4.3# sls offline start -r us-east-2 --noTimeout --corsDisallowCredentials false &
bash-4.3# npm run test
```

## Docker image

The Docker image has the following:

- Node 8: we leverage Babel to be compatible with AWS Lambda runtime
- [Serverless Framework](https://serverless.com)
- jre 7: required by serverless plugins
