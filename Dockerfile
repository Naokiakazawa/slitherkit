FROM python:3.7
LABEL maintainer="Naoki Akazawa"
ARG SOLC=0.8.4
RUN pip --no-cache-dir install solc-select slither-analyzer \
	&& solc-select install $SOLC
ENV SOLC_VERSION=$SOLC
WORKDIR /src
CMD [ "/bin/bash" ]