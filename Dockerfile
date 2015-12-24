FROM debian:jessie

MAINTAINER ZhiFeng Hu "hufeng1987@gmail.com"

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 ; \
	    echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list ; \
	    apt-get update; \
	    apt-get install hhvm -y  ;\
		rm -rf /var/lib/apt/lists/* 
VOLUME /www
ENV TERM xterm
COPY entrypoint.sh /entrypoint.sh
COPY php.ini /etc/hhvm/php.ini

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000

CMD ["hhvm", "--mode", "server", "-vServer.Type=fastcgi", "-vServer.Port=9000"]
