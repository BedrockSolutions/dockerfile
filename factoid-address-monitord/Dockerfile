FROM node:alpine

USER root

RUN set -xe \
  && apk add --no-cache git

USER node

# Create the working dir as node. Otw it gets created as root
RUN mkdir /home/node/factoid-address-monitord

WORKDIR /home/node/factoid-address-monitord

RUN set -xe \
  && git clone https://github.com/Factoshi/factoid-address-monitord.git . \
  && npm install

VOLUME ["/home/node/factoid-address-monitord/config.json"]

VOLUME ["/home/node/factoid-address-monitord/stopBlocks.json"]

CMD ["node", "index.js"]
