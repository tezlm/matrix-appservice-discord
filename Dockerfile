FROM node:16-slim AS BUILD
COPY . /tmp/src
# install some dependencies needed for the build process
<<<<<<< HEAD
RUN apk update
RUN apk add --no-cache -t build-deps make gcc g++ python3 ca-certificates libc-dev wget git
=======
RUN apt update && apt install -y build-essential make gcc g++ python3 ca-certificates libc-dev wget git

>>>>>>> 749c0f0c2bc269927fdbafd9eb04a47f2e019128
RUN cd /tmp/src \
    && yarn install \
    && yarn build

FROM node:16-slim
ENV NODE_ENV=production
COPY --from=BUILD /tmp/src/build /build
COPY --from=BUILD /tmp/src/config /config
COPY --from=BUILD /tmp/src/node_modules /node_modules
RUN sh -c 'cd /build/tools; for TOOL in *.js; do LINK="/usr/bin/$(basename $TOOL .js)"; echo -e "#!/bin/sh\ncd /data;\nnode /build/tools/$TOOL \$@" > $LINK; chmod +x $LINK; done'
CMD node --max-old-space-size=4096 /build/src/discordas.js -p 9005 -c /data/config.yaml -f /data/discord-registration.yaml
EXPOSE 9005
VOLUME ["/data"]
