<div align="center">
  <img width="200" height="200"
    src="https://cdn.worldvectorlogo.com/logos/circleci.svg">
  <a href="https://github.com/easymetrics">
    <img width="200" height="200" vspace="" hspace="25"
      src="https://cdn.worldvectorlogo.com/logos/webpack-icon.svg">
  </a>
  <h1>CircleCI 2.0 JRE (JDK 7) / NodeJS 8 LTS build container</h1>
</div>

<h2 align="center">Usage</h2>

```bash
# config.yml
    docker:
      - image: kalote/circleci-node8-jre
```

<h2 align="center">Container Includes</h2>

- CircleCI specific dependencies & runtime user configuration.
- NodeJS version 8 LTS
- serverless / mocha / babel global nodejs packages
- JRE (JDK 7)

> This container does not have a headless browser configuration
