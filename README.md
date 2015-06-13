# Supported tags and respective `Dockerfile` links

-   [`latest`, `cli` (*latest/Dockerfile*)](https://github.com/diegomarangoni/docker-hhvm/blob/release/cli/Dockerfile)
-   [`fastcgi` (*latest/fastcgi/Dockerfile*)](https://github.com/diegomarangoni/docker-hhvm/blob/release/fastcgi/Dockerfile)
-   [`src`, `src-cli` (*src/Dockerfile*)](https://github.com/diegomarangoni/docker-hhvm/blob/release/src-cli/Dockerfile)
-   [`src-fastcgi` (*src/fastcgi/Dockerfile*)](https://github.com/diegomarangoni/docker-hhvm/blob/release/src-fastcgi/Dockerfile)

# What is HHVM?

HHVM is an open-source virtual machine designed for executing programs written in Hack and PHP. HHVM uses a just-in-time (JIT) compilation approach to achieve superior performance while maintaining the development flexibility that PHP provides.

> [hhvm.com](http://hhvm.com)

![logo](https://raw.githubusercontent.com/diegomarangoni/docker-hhvm/master/hhvm.png)

# How to use this image.

## With `docker run`

For Hack/PHP projects run through the command line interface (CLI), you can do the following.

### Create a `Dockerfile` in your Hack/PHP project

    FROM diegomarangoni/hhvm:cli
    COPY . /usr/src/myapp
    WORKDIR /usr/src/myapp
    CMD [ "hhvm", "./your-script.php" ]

Then, run the commands to build and run the Docker image:

    docker build -t my-app .
    docker run -it --rm --name my-running-app my-app

I recommend that you add a custom `php.ini` configuration. `COPY` it into `/etc/hhvm/php.ini` by adding one more line to the Dockerfile above and running the same commands to build and run:

    FROM diegomarangoni/hhvm:cli
    COPY config/php.ini /etc/hhvm/php.ini

You can grab a fresh copy of `php.ini` from inside the image.

### Run a single Hack/PHP script

For many simple, single file projects, you may find it inconvenient to write a complete `Dockerfile`. In such cases, you can run a Hack/PHP script by using the image directly:

    docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp diegomarangoni/hhvm:cli hhvm your-script.php

## With alias

### Create a alias

    alias hhvm="docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp diegomarangoni/hhvm:cli hhvm"

### Then test it

    hhvm --version

### And finally...

    hhvm your-script.php

And you can also add a custom `php.ini` file, just by mounting it as a volume:

    docker run -it --rm --name my-running-script -v /path/to/php.ini:/etc/hhvm/php.ini -v "$PWD":/usr/src/myapp -w /usr/src/myapp diegomarangoni/hhvm:cli hhvm your-script.php

And the alias should look like:

    alias hhvm="docker run --rm -v /path/to/php.ini:/etc/hhvm/php.ini -v "$PWD":/usr/src/myapp -w /usr/src/myapp diegomarangoni/hhvm:cli hhvm"

## With a web server

You can run a fastcgi server that will work within a web server like nginx or apache:

    docker run -it diegomarangoni/hhvm:fastcgi

By default, the image expose the port 9000, you can change that by editing `/etc/hhvm/server.ini`.

And if you want to add a custom `php.ini` file:

    docker run -it \
        -v /path/to/php.ini:/etc/hhvm/php.ini \
        diegomarangoni/hhvm:fastcgi
