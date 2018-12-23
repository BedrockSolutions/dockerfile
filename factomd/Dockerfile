FROM factominc/factomd:v6.1.0-alpine

COPY ./entrypoint.sh /root/entrypoint.sh

WORKDIR /home/factomd

RUN set -xe && \
  cat /etc/group && \
  apk add --no-cache gettext shadow && \
  groupadd -g 1000 factomd && \
  useradd -r -m -u 1000 -g factomd factomd && \
  mv /root/.factom . && \
  mv /root/entrypoint.sh . && \
  mkdir -p ./.factom/private ./.factom/private-conv && \
  touch ./.factom/private/factomd.conf && \
  chown -R factomd:factomd .

VOLUME /home/factomd/.factom/m2

VOLUME /home/factomd/.factom/private

USER factomd

ENTRYPOINT ["./entrypoint.sh", "-config=/home/factomd/.factomd/private-conv/factomd.conf"]
