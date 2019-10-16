FROM java

ARG WSS_VERSION=19.9.1.1
ENV WSS_VERSION=${WSS_VERSION}
# ENV WSS_API_KEY
RUN mkdir /opt/whitesource && \
    cd /opt/whitesource && \
    curl -LJO https://unified-agent.s3.amazonaws.com/wss-unified-agent-${WSS_VERSION}.jar && \
    curl -LJO https://github.com/whitesource/unified-agent-distribution/raw/master/standAlone/wss-unified-agent.config
COPY wss-agent.sh /opt/whitesource
# RUN curl -LJO https://github.com/whitesource/unified-agent-distribution/releases/latest/download/wss-unified-agent.jar

ENTRYPOINT ["/opt/whitesource/wss-agent.sh"]
# CMD ["-help"]