FROM openjdk:buster

ARG WSS_VERSION=19.9.1.1
ENV WSS_VERSION=${WSS_VERSION}
ENV DEBIAN_FRONTEND=noninteractive
# ENV WSS_API_KEY
RUN mkdir /opt/whitesource && \
    cd /opt/whitesource && \
    curl -LJO https://unified-agent.s3.amazonaws.com/wss-unified-agent-${WSS_VERSION}.jar && \
    curl -LJO https://github.com/whitesource/unified-agent-distribution/raw/master/standAlone/wss-unified-agent.config
RUN apt-get update -y && apt-get install -y go-dep python-pip python-virtualenv
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs
RUN apt-get clean
COPY wss-agent.sh /opt/whitesource
# RUN curl -LJO https://github.com/whitesource/unified-agent-distribution/releases/latest/download/wss-unified-agent.jar

ENTRYPOINT ["/opt/whitesource/wss-agent.sh"]
# CMD ["-help"]
