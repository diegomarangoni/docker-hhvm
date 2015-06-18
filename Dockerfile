FROM diegomarangoni/hhvm

MAINTAINER "Diego Marangoni" <diegomarangoni@me.com>

EXPOSE 9000

CMD ["hhvm", "--mode=server"]
