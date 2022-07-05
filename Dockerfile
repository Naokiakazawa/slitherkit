FROM python:3.7-slim-buster
LABEL maintainer="Naoki Akazawa (naoki@fracton.ventures)"
ARG SOLC=0.8.4
RUN apt-get update \
	&& apt-get install gcc -y \
	&& pip --no-cache-dir install solc-select slither-analyzer \
	&& solc-select install $SOLC \
	&& apt-get remove gcc -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
ENV SOLC_VERSION=$SOLC
WORKDIR /src
CMD [ "/bin/bash" ]