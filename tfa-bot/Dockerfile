FROM mono:latest AS build

ARG SIPP_BRANCH="v3.5.2"
ARG BOT_BRANCH="master"

ENV TZ=UTC

WORKDIR /app

RUN set -xe \
\
  # Update package lists and install build and runtime dependencies
  && apt-get update \
	&& apt-get -y install \
    autoconf \
    build-essential \
    git \
    iputils-ping \
    mtr-tiny \
    net-tools \
    libncurses5-dev \
    libncursesw5-dev \
    locales \
    locales-all \
    net-tools \
    ssh \
    wget \
\
  # Additional dependency installation
  && git clone --branch ${SIPP_BRANCH} https://github.com/SIPp/sipp.git \
  && wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe \
\
  # Clone the bot repo
  && git clone -b ${BOT_BRANCH} https://git.factoid.org/TFA/TFA-Bot.git \
\
  # Build the bot
  && cd sipp \
  && ./build.sh \
  && cd ../TFA-Bot \
  && mono ../nuget.exe restore TFA-Bot.sln \
  && msbuild -p:Configuration=Release -property:GitCommit=$(git rev-parse HEAD) TFA-Bot.sln \
\
  # Clean up after the build
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
\
  # Post-build configuration
  && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
  && chmod +x ./entrypoint.sh \
  && ln -s ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

# mono doesn't seem to respond to the SIGTERM, so...
STOPSIGNAL SIGKILL