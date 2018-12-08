# TFA Bot

Docker images of the wonderful TFA Bot, developed by The Factoid Authority.
  
  * [Website (*www.factoid.org*)](http://www.factoid.org)
  
  * [Github (*git.factoid.org*)](https://git.factoid.org/TFA/TFA-Bot)

## Supported tags and Dockerfile links

* [`latest` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/master/tfa-bot/Dockerfile)

* [`1.12` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/tfa-bot-1.12/tfa-bot/Dockerfile)

* [`slim` (*Dockerfile.slim*)](https://github.com/BedrockSolutions/dockerfile/blob/master/tfa-bot/Dockerfile.slim)

* [`1.1.12-slim` (*Dockerfile.slim*)](https://github.com/BedrockSolutions/dockerfile/blob/tfa-bot-1.12/tfa-bot/Dockerfile.slim)

## Usage

`docker run  -e 'BOTURL=<url-to-config-doc>' --name tfa-bot bedrocksolutions/tfa-bot:<tag>`
