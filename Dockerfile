from node:7.7.2

LABEL highcharts.export.server=2.0.19

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"

WORKDIR /server
COPY package*json /server/
RUN npm install
COPY . /server
RUN npm link

WORKDIR /usr/share/fonts/truetype
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-Light.ttf OpenSans-Light.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-Semibold.ttf OpenSans-Semibold.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-Bold.ttf OpenSans-Bold.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-ExtraBold.ttf OpenSans-ExtraBold.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-Italic.ttf OpenSans-Italic.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-LightItalic.ttf OpenSans-LightItalic.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-BoldItalic.ttf OpenSans-BoldItalic.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-SemiboldItalic.ttf OpenSans-SemiboldItalic.ttf
ADD https://github.com/oneworldaccuracy/node-export-server/tree/master/fonts/OpenSans-ExtraBoldItalic.ttf OpenSans-ExtraBoldItalic.ttf

WORKDIR /
EXPOSE 8080
ENTRYPOINT ["highcharts-export-server", "--enableServer", "1", "--port", "8080", "--queueSize", "15", "--workers", "15", "--logLevel", "4"]
