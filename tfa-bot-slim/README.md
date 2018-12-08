# tfa-bot-slim

Dockerfile for the amazing TFA Bot (https://git.factoid.org/TFA/TFA-Bot), focused on
small image size.

This image does not contain a build environment. As such, all bot commands that relate to
the build in some way do not work. The following commands will not work correctly:

  * bot update
  * bot previous
  * git
