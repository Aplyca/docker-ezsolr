#!/bin/ash
#
# docker-entrypoint for docker-solr

set -e

ln -s ../solr/configsets/_default/conf solr/${CORE_NAME}
cp solr/solr.xml solr/${CORE_NAME}/ 
cp solr/zoo.cfg solr/${CORE_NAME}/
#sed -ri -e 's/ezp-default/'"$CORE_NAME"'/g' /usr/local/solr/solr/solr.xml

exec "$@"
