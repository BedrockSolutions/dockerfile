# Create an image to hold the build process
FROM mono:latest AS build

ARG SIPP_BRANCH="v3.5.2"
ARG BOT_BRANCH="master"

WORKDIR /app

RUN set -xe \
\
  # Update package lists and install build dependencies
  && apt-get update \
	&& apt-get -y install \
    autoconf \
    build-essential \
    git \
    iputils-ping \
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
  && msbuild -p:Configuration=Release -property:GitCommit=$(git rev-parse HEAD) TFA-Bot.sln

# Create an image for the runtime
FROM mono:slim

ENV TZ=UTC

WORKDIR /app

RUN set -xe \
\
  # Update package lists and install runtime dependencies
  && apt-get update \
	&& apt-get -y install \
    iputils-ping \
    libmono-system-net-http4.0-cil \
    libmono-system-runtime4.0-cil \
    libmono-system-runtime-serialization4.0-cil \
    libmono-system-web-services4.0-cil \
    libncurses5-dev \
    libncursesw5-dev \
    mtr-tiny \
    net-tools \
\
  # Clean up after the package installation
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
\
  # Configure timezone
  && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime

# Copy build artifacts from the build image
COPY --from=build /app/TFA-Bot/TFA-Bot/bin/Release .

# Updates happen via image updates, so no need for entrypoint.sh
ENTRYPOINT ["mono", "TFA-Bot.exe"]

# mono doesn't seem to respond to the SIGTERM, so...
STOPSIGNAL SIGKILL