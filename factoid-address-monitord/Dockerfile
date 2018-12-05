FROM node:alpine

USER root

RUN set -xe \
  && apk add --no-cache git

USER node

# Create the working dir as node. Otw it gets created as root
RUN mkdir /home/node/app

WORKDIR /home/node/app

RUN set -xe \
  && git clone https://github.com/Factoshi/factoid-address-monitord.git . \
  && rm -r csv config.json.copy README.md \
  && npm install \
  && mkdir -p config db/csv \
  && touch config/config.json db/stopBlocks.json \
  && ln -s config/config.json config.json \
  && ln -s db/stopBlocks.json stopBlocks.json \
  && ln -s db/csv csv

VOLUME ["/home/node/app/config"]

VOLUME ["/home/node/app/db"]

ENTRYPOINT ["node", "index.js"]
