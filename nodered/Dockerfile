FROM resin/raspberrypi3-alpine-node:8-slim

WORKDIR /usr/src/node-red

RUN mkdir -p /data \
    && apk add --no-cache make gcc g++ linux-headers udev libusb libusb-dev libusb-compat libusb-compat-dev python py-rpigpio

COPY src hub-ctrl.c usbreset.c usbreset.sh ./

RUN gcc -o hub-ctrl hub-ctrl.c -lusb \
    && gcc usbreset.c -o usbreset \
    && chmod a+x usbreset hub-ctrl usbreset.sh \
    && mv usbreset hub-ctrl /usr/bin

RUN npm install serialport@6.2.2 --build-from-source

RUN npm install \
    && chmod a+x start.sh

RUN apk del make gcc g++ && rm -rf /var/cache/apk/*

ENV LOG_LEVEL="info" \
    NODE_PATH="/usr/src/node-red/node_modules" \
    NODE_RED_USER="admin" NODE_RED_PASSWORD="" \
    INITSYSTEM="on"

EXPOSE 1880
VOLUME ["/data"]

ENTRYPOINT [ "./start.sh" ]
