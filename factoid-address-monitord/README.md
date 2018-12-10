# TFA Bot

Docker images of the wonderful TFA Bot, developed by The Factoid Authority.
  
  * [Website (*www.factoid.org*)](http://www.factoid.org)
  
  * [Github (*git.factoid.org*)](https://git.factoid.org/TFA/TFA-Bot)

## Supported tags and Dockerfile links

* [`latest` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/master/tfa-bot/Dockerfile)

* [`1.12` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/tfa-bot-1.12/tfa-bot/Dockerfile)

* [`slim` (*Dockerfile.slim*)](https://github.com/BedrockSolutions/dockerfile/blob/master/tfa-bot/Dockerfile.slim)

* [`1.1.12-slim` (*Dockerfile.slim*)](https://github.com/BedrockSolutions/dockerfile/blob/tfa-bot-1.12/tfa-bot/Dockerfile.slim)

## Image types

* Regular: `latest` & `1.12`
  > This image supports all features. Use this one if you want to update your bot via the
  discord command `bot update`

* Slim: `slim` & `1.12-slim`
  > This image lacks a build environment. The discord commands `bot update` and `git` do not
  work. Use this image if you are concerned about image size, and plan on updating your bot
  via a `docker pull`.
  
## Environment variables

The image requires a single environment variable:

* **BOTURL**: The URL of Google Sheet configuration

## Example

`docker run  -e 'BOTURL=https://url.of.google.sheet' --name tfa-bot bedrocksolutions/tfa-bot:1.12-slim`
