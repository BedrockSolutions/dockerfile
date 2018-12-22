# TFA Bot

Docker images of the wonderful TFA Bot, developed by The Factoid Authority.
  
  * [Website (*www.factoid.org*)](http://www.factoid.org)
  
  * [Github (*git.factoid.org*)](https://git.factoid.org/TFA/TFA-Bot)

## Supported tags and Dockerfile links

* [`latest` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/master/tfa-bot/Dockerfile)
  
## Environment variables

The image requires a single environment variable:

* **BOTURL**: The URL of Google Sheet configuration

## Example

`docker run  -e 'BOTURL=https://url.of.google.sheet' --name tfa-bot bedrocksolutions/tfa-bot:latest`
