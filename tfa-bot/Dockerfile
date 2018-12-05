FROM mono:latest AS build

ARG BRANCH="master"

# Set the timezone.
ENV TZ=UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

RUN apt-get update \
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
  wget

RUN mkdir -p /app
WORKDIR /app
RUN git clone --branch v3.5.2 https://github.com/SIPp/sipp.git
WORKDIR /app/sipp
RUN ./build.sh

WORKDIR /app
RUN git clone -b ${BRANCH} https://git.factoid.org/TFA/TFA-Bot.git
RUN wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
WORKDIR /app/TFA-Bot
RUN mono ../nuget.exe restore TFA-Bot.sln
RUN msbuild -p:Configuration=Release -property:GitCommit=$(git rev-parse HEAD) TFA-Bot.sln

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

FROM mono:slim

RUN apt-get update \
	&& apt-get -y install \
  git \
  iputils-ping \
  libmono-system-net-http4.0-cil \
  libmono-system-runtime4.0-cil \
  libmono-system-runtime-serialization4.0-cil \
  libmono-system-web-services4.0-cil \
  libncurses5-dev \
  libncursesw5-dev \
  mtr-tiny \
  net-tools \
  ssh \
  wget

COPY --from=build /app/TFA-Bot/TFA-Bot/bin/Release /app/TFA-Bot/TFA-Bot/bin/Release

COPY --from=build /app/TFA-Bot/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]