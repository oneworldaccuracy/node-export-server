FROM node:8.16.0

WORKDIR /usr/share/fonts/truetype
ADD ./fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
ADD ./fonts/OpenSans-Light.ttf OpenSans-Light.ttf
ADD ./fonts/OpenSans-Semibold.ttf OpenSans-Semibold.ttf
ADD ./fonts/OpenSans-Bold.ttf OpenSans-Bold.ttf
ADD ./fonts/OpenSans-ExtraBold.ttf OpenSans-ExtraBold.ttf
ADD ./fonts/OpenSans-Italic.ttf OpenSans-Italic.ttf
ADD ./fonts/OpenSans-LightItalic.ttf OpenSans-LightItalic.ttf
ADD ./fonts/OpenSans-BoldItalic.ttf OpenSans-BoldItalic.ttf
ADD ./fonts/OpenSans-SemiboldItalic.ttf OpenSans-SemiboldItalic.ttf
ADD ./fonts/OpenSans-ExtraBoldItalic.ttf OpenSans-ExtraBoldItalic.ttf

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"

RUN mkdir -p /server/tmp && chown -R node:node /server
VOLUME /server/tmp
WORKDIR /server
USER node
COPY --chown=node:node . .
RUN npm install --no-optional && npm cache clean --force

EXPOSE 8080
ENTRYPOINT ["/server/bin/cli.js", "--enableServer", "1", "--port", "8080", "--queueSize", "15", "--workers", "15", "--logLevel", "4"]
