FROM openjdk:7-jre-alpine

LABEL maintainer="Aplyca" description="Solr search engine for eZ Platform"

ARG EZFIND_VERSION=v2017.12.0

RUN wget -q https://github.com/ezsystems/ezfind/archive/${EZFIND_VERSION}.zip -O /tmp/ezfind-ls.zip && \ 
    unzip /tmp/ezfind-ls.zip '*/java/*' -d /usr/local && \
    mv /usr/local/ezfind-2017.12.0/java /usr/local/solr && \
    rm -rf /tmp/ezfind-ls.zip

WORKDIR /usr/local/solr

EXPOSE 8983

CMD ["sh", "-c", "java -jar start.jar"]