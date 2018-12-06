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

WORKDIR /app

RUN set -xe \
  && git clone --branch v3.5.2 https://github.com/SIPp/sipp.git \
  && git clone -b ${BRANCH} https://git.factoid.org/TFA/TFA-Bot.git \
  && wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe \
  && cd sipp \
  && ./build.sh \
  && cd ../TFA-Bot \
  && mono ../nuget.exe restore TFA-Bot.sln \
  && msbuild -p:Configuration=Release -property:GitCommit=$(git rev-parse HEAD) TFA-Bot.sln

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