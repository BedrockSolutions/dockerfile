# Create an image to hold the build process
FROM mono:5.16.0.179 AS build

ARG SIPP_BRANCH="v3.5.2"
ARG BOT_BRANCH="master"

WORKDIR /app

# Update package lists and install build dependencies
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
    net-tools \
    ssh \
    wget

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

# Create an image for the runtime
FROM mono:5.16.0.179-slim

ENV TZ=UTC

WORKDIR /app

# Update package lists, install runtime dependencies, and clean up
RUN set -xe \
  && apt-get update \
	&& apt-get --no-install-recommends -y install \
    iputils-ping \
    libmono-system-net-http4.0-cil \
    libmono-system-runtime4.0-cil \
    libmono-system-runtime-serialization4.0-cil \
    libmono-system-web-services4.0-cil \
    libncurses5-dev \
    libncursesw5-dev \
    mtr-tiny \
    net-tools \
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Configure timezone
RUN set -xe \
  && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime

# Copy build artifacts from the build image
COPY --from=build /app/TFA-Bot/TFA-Bot/bin/Release .

# Updates happen via image updates, so no need for entrypoint.sh
ENTRYPOINT ["mono", "TFA-Bot.exe"]

# mono doesn't seem to respond to the SIGTERM, so...
STOPSIGNAL SIGKILL