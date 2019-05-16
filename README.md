# Dockerized PhpInsights

[![Docker stars](https://img.shields.io/docker/stars/gekkie/phpinsights.svg)](https://hub.docker.com/r/gekkie/phpinsights/)
[![Docker pulls](https://img.shields.io/docker/pulls/gekkie/phpinsights.svg)](https://hub.docker.com/r/gekkie/phpinsights/)
[![Image layers](https://images.microbadger.com/badges/image/gekkie/phpinsights.svg)](https://microbadger.com/images/gekkie/phpinsights)
[![Image release](https://images.microbadger.com/badges/version/gekkie/phpinsights.svg)](https://microbadger.com/images/gekkie/phpinsights)

This is a dockerized version of [PHPInsights](https://github.com/nunomaduro/phpinsights).

## running

Go to your code and execute the following

    docker run -v $(pwd):/app gekkie/phpinsights

That will run PHPinsights on your local code. If you would like to examine the image / container overload the entrypoint:

    docker run -v $(pwd):/app --entrypoint=/bin/bash gekkie/phpinsights
