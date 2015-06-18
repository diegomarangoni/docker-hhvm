FROM diegomarangoni/hhvm:src

MAINTAINER "Diego Marangoni" <diegomarangoni@me.com>

EXPOSE 9000

CMD ["hhvm", "--config=/etc/hhvm/php.ini", "--mode=server"]
