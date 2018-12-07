FROM mono:5.16.0.179 AS build

ARG SIPP_BRANCH="v3.5.2"
ARG BOT_BRANCH="master"

ENV TZ=UTC

WORKDIR /app

# Update package lists, install build and runtime packages, and clean up
RUN set -xe \
  && apt-get update \
	&& apt-get --no-install-recommends -y install \
    autoconf \
    automake \
    build-essential \
    git \
    iputils-ping \
    libncurses5-dev \
    libncursesw5-dev \
    locales \
    locales-all \
    mtr-tiny \
    net-tools \
    ssh \
    wget \
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Additional dependency installation
RUN set -xe \
  && git clone --branch ${SIPP_BRANCH} https://github.com/SIPp/sipp.git \
  && wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe

# Clone the bot repo
RUN set -xe \
  && git clone -b ${BOT_BRANCH} https://git.factoid.org/TFA/TFA-Bot.git

# Build the bot
RUN set -xe \
  && cd sipp \
  && ./build.sh \
  && cd ../TFA-Bot \
  && mono ../nuget.exe restore TFA-Bot.sln \
  && msbuild -p:Configuration=Release -property:GitCommit=$(git rev-parse HEAD) TFA-Bot.sln

# Post-build configuration
RUN set -xe \
  && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
  && cp ./TFA-Bot/entrypoint.sh / \
  && chmod +x /entrypoint.sh

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]

# mono doesn't seem to respond to the SIGTERM, so...
STOPSIGNAL SIGKILL