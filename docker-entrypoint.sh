#!/bin/ash
#
# docker-entrypoint for docker-solr

set -e

pwd

ln -s ezp-default solr/${CORE_NAME}
sed -ri -e 's/ezp-default/'"$CORE_NAME"'/g' /usr/local/solr/solr/solr.xml

exec "$@"