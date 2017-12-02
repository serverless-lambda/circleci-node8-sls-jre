# svls/serverless

Run serverless deploy, dynamodb-local, serverless offline plugin and unit test in docker container.

## Usage

```bash
# build, tag, push image to docker hub, update git tag with latest serverless release 
# (one-time task for each new serverless release)
$ make release

# Run serverless deploy in the image.
$ docker pull svls/serverless:1.24.1
$ docker run --rm -it -v $(pwd):/opt/app -v ~/.aws:/root/.aws -v ~/.ssh:/root/.ssh svls/serverless:1.24.1 deploy

# Run serverless unit test locally
$ docker run --rm -it -v $(pwd):/opt/app svls/serverless:1.24.1 bash
circleci@eba227feccb7:/opt/app$ sls config credentials --provider aws --key KEY --secret SECRET
circleci@eba227feccb7:/opt/app$ npm install
circleci@eba227feccb7:/opt/app$ sls plugin install -n serverless-dynamodb-local
circleci@eba227feccb7:/opt/app$ sls plugin install -n serverless-offline
circleci@eba227feccb7:/opt/app$ sls dynamodb install
circleci@eba227feccb7:/opt/app$ sls offline start -r us-east-2 --noTimeout --corsDisallowCredentials false &
circleci@eba227feccb7:/opt/app$ npm run test
```

## Docker image

The Docker image has the following:

- Node 8: we leverage Babel to be compatible with AWS Lambda runtime
- [Serverless Framework](https://serverless.com)
- jre 7: required by serverless plugins
