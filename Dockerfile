FROM diegomarangoni/hhvm

MAINTAINER "Diego Marangoni" <diegomarangoni@me.com>

ENV HHVM_FASTCGI_PORT 9000

EXPOSE $HHVM_FASTCGI_PORT

CMD hhvm --mode=server -vServer.Type=fastcgi -vServer.Port=$HHVM_FASTCGI_PORT
