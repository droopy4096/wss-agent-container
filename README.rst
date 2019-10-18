===================
WSS Agent container
===================

Whitesource Agent container aims to have all the tools pre-installed for successfull processing of:

* Golang sources
* Python sources
* Nodejs sources

Usage
=====

Sample invocation::

  docker run -e WSS_CONFIG=$(WSS_CONFIG) \
           -e WSS_PRODUCT=$(WSS_PRODUCT) \
           -e WSS_PROJECT=$(WSS_PROJECT) \
           -e WSS_API_KEY=$(WSS_API_KEY) \
           -e WSS_WORKDIR=$(WSS_WORKDIR) \
           -v $(PWD):/src \
           -v $(PWD)/wss-pip-preinstall.sh:/opt/whitesource/wss-agent-pre.sh \
           --rm -it droopy4096/wss-agent

where variables are as follows:

WSS_CONFIG
  path to wss-unified-agent.config for this project

WSS_PRODUCT
  product name

WSS_PROJECT
  project name

WSS_API_KEY
  API key from your dashboard

WSS_WORKDIR
  directory where source files will be located and where agent will be executed

/opt/whitesource/wss-agent-pre.sh
  Hook script that will be executed **prior** to the scan within the same container (so any dependency installs or other env. manipulations go here)
