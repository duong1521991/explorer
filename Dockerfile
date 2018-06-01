## Build via:
#
# docker build -t scan:latest .
#
## Run via:
#
# docker run -d \
# -p 8010:80 \
# --name scaner \
# stevekhong/scan:latest

FROM node:9.3.0
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
RUN npm install -g bower
COPY . /usr/src/app
RUN bower install --allow-root
EXPOSE 80
CMD ["npm", "start"]