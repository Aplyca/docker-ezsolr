FROM openjdk:7-jre-alpine as prod

RUN wget -q https://github.com/ezsystems/ezfind/archive/v2017.12.0.zip -O /tmp/ezfind-ls.zip && \ 
    unzip /tmp/ezfind-ls.zip '*/java/*' -d /usr/local && \
    mv /usr/local/ezfind-2017.12.0/java /usr/local/solr && \
    rm -rf /tmp/ezfind-ls.zip

WORKDIR /usr/local/solr
ENV CORE_NAME=core

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8983
ENTRYPOINT ["docker-entrypoint.sh"]
LABEL maintainer="GEB" description="GEB_TRECSA Portals Network Search" environment="Production"

CMD ["java", "-jar", "start.jar"]
