#!/bin/sh -x

WSS_HOME=/opt/whitesource

WSS_CONFIG=${WSS_CONFIG:-${WSS_HOME}/wss-unified-agent.config}
WSS_WORKDIR=${WSS_WORKDIR:-.}
WSS_OPTIONS=""

[ -n "${WSS_PRODUCT}" ] && WSS_OPTIONS="${WSS_OPTIONS} -product ${WSS_PRODUCT}"
[ -n "${WSS_PRODUCT_TOKEN}" ] && WSS_OPTIONS="${WSS_OPTIONS} -productToken ${WSS_PRODUCT_TOKEN}"
[ -n "${WSS_PRODUCT_VERSION}" ] && WSS_OPTIONS="${WSS_OPTIONS} -productVersion ${WSS_PRODUCT_VERSION}"

[ -n "${WSS_PROJECT}" ] && WSS_OPTIONS="${WSS_OPTIONS} -project ${WSS_PROJECT}"
[ -n "${WSS_PROJECT_TOKEN}" ] && WSS_OPTIONS="${WSS_OPTIONS} -projectToken ${WSS_PROJECT_TOKEN}"
[ -n "${WSS_PROJECT_VERSION}" ] && WSS_OPTIONS="${WSS_OPTIONS} -projectVersion ${WSS_PROJECT_VERSION}"

java -jar ${WSS_HOME}/wss-unified-agent-${WSS_VERSION}.jar -c ${WSS_CONFIG} -apiKey ${WSS_API_KEY} -d ${WSS_WORKDIR} ${WSS_OPTIONS} "$@"
