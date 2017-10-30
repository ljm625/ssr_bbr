FROM debian:jessie
MAINTAINER Justas Pikeils <ljm@wow.com>
# Install Wget
RUN apt-get update
RUN apt-get -y install wget iptables supervisor openssl libssl-dev curl wget unzip gcc automake autoconf make libtool

# Install BBR_Enhanced
RUN mkdir /apps
COPY rinetd /apps
COPY rinetd.conf /apps
RUN chmod +x /apps/rinetd
# Install SSR
RUN wget https://github.com/teddysun/shadowsocksr/archive/manyuser.zip -O /apps/ss.tar.gz
RUN unzip /apps/ss.tar.gz -d /apps
RUN rm -rf /apps/ss.tar.gz
# Install Lib
RUN wget https://github.com/jedisct1/libsodium/releases/download/1.0.15/libsodium-1.0.15.tar.gz -O /apps/libsodium.tar.gz
RUN tar -xzvf /apps/libsodium.tar.gz -C /apps
RUN cd /apps/libsodium-1.0.15/ && ./configure --prefix=/usr && make && make install
RUN ldconfig
RUN rm -rf /apps/libsodium.tar.gz
ENV SSRPASS defaultpass
ENV SSRENC chacha20-ietf
ENV SSRPRO auth_sha1_v4_compatible
ENV SSROBFS "tls1.2_ticket_fastauth_compatible"
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ENV PYTHONPATH $PYTHONPATH:/apps/shadowsocksr-manyuser/
EXPOSE 80 443 3389
CMD ["/usr/bin/supervisord"]
