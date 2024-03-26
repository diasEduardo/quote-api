ARG NODE_VERSION=19.5.0
# https://github.com/nikolaik/docker-python-nodejs
FROM nikolaik/python-nodejs:python3.12-nodejs21-slim AS builder

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

#If the runtime environment is musl-based Linux (e.g. Alpine) but the install time environment is glibc-based Linux (e.g. Debian),
# you'll need to pass --platform=linuxmusl at npm install time.

RUN npm install --save
# need python
RUN npm install canvas@2.11.2 --save
RUN npm install smartcrop-sharp@2.0.7 --save
RUN npm install sharp@0.33.3 --save

CMD node index.js
