FROM golang:1.15.8-buster

ENV PATH="/usr/local/go/bin:/opt/W3C-Validator:${PATH}"

# Install sudo
RUN apt-get update && \
    apt-get -y install curl python3-pip

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt-get install -y --no-install-recommends \
	nodejs=14.* \
	make=4.* \
	# Cleanup APT cache to ease extension of this image
	&& apt-get clean \
  	&& rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@9.5.1

# Download Hugo binary
ARG HUGO_VERSION="0.84.0"
ARG HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
RUN curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}"
RUN dpkg -i ${HUGO_BINARY}
RUN rm ${HUGO_BINARY}

ARG GOLANGCILINT_VERSION="1.52.2"
RUN curl --silent --show-error --location --output /tmp/golangci-lint.deb \
     "https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCILINT_VERSION}/golangci-lint-${GOLANGCILINT_VERSION}-linux-amd64.deb"
RUN dpkg -i /tmp/golangci-lint.deb
RUN rm -f /tmp/golangci-lint.deb

RUN npm install --global \
  markdownlint-cli@0.26.0 \
  markdown-link-check@3.8.6

CMD ["/bin/bash"]
