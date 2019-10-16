FROM openjdk:8-jre-alpine as prod

ENV SOLR_VERSION "7.7.2"

RUN wget -q http://archive.apache.org/dist/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.zip -O /tmp/solr-${SOLR_VERSION}.zip && \ 
    unzip /tmp/solr-${SOLR_VERSION}.zip -d /usr/local && \
    mv /usr/local/solr-7.7.2 /usr/local/solr && \
    rm -rf /tmp/solr-${SOLR_VERSION}.zip

WORKDIR /usr/local/solr/server
ENV CORE_NAME=app

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8983
ENTRYPOINT ["docker-entrypoint.sh"]
LABEL maintainer="Aplyca" description="Solr 7.0 search engine for eZ Platform"

CMD ["java", "-jar", "start.jar", "--module=http"]
