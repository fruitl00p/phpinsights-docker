# Dockerized PhpInsights

This is a dockerized version of PHPInsights.

## running

Go to your code and execute the following

    docker run -v $(pwd):/app gekkie/phpinsights

That will run PHPinsights on your local code. If you would like to examine the image / container overload the entrypoint:

    docker run -v $(pwd):/app --entrypoint=/bin/bash gekkie/phpinsights
