FROM golang:1.15.8-buster

ENV PATH="/usr/local/go/bin:/opt/W3C-Validator:${PATH}"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install sudo
RUN apt-get update && \
    apt-get -y --no-install-recommends install curl=* python3-pip=* \
	&& rm -rf /var/lib/apt/lists/*

#SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN	curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt-get install -y --no-install-recommends \
	nodejs=14.* \
	make=4.* \
	# Cleanup APT cache to ease extension of this image
	&& apt-get clean \
  	&& rm -rf /var/lib/apt/lists/* \
	&& npm install -g npm@9.5.1

# Download Hugo binary
ARG HUGO_VERSION="0.84.0"
ARG HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
RUN curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}" \
	&& dpkg -i ${HUGO_BINARY} \
	&& rm ${HUGO_BINARY}

ARG GOLANGCILINT_VERSION="1.52.2"
RUN curl --silent --show-error --location --output /tmp/golangci-lint.deb \
     "https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCILINT_VERSION}/golangci-lint-${GOLANGCILINT_VERSION}-linux-amd64.deb" \
	 && dpkg -i /tmp/golangci-lint.deb \
	 && rm -f /tmp/golangci-lint.deb \
	 && npm install --global \
  	 	markdownlint-cli@0.26.0 \
		markdown-link-check@3.8.6

ARG HADOLINT_VERSION=2.6.0
ARG HADOLINT_SHA256="152e3c3375f26711650d4e11f9e382cf1bdf3f912d7379823e8fac4b1bce88d6"
RUN curl --fail --silent --show-error --location --output /usr/local/bin/hadolint \
    "https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64" \
  && sha256sum /usr/local/bin/hadolint | grep -q "${HADOLINT_SHA256}" \
  && chmod a+x /usr/local/bin/hadolint \
  && hadolint --version 2>&1 | grep -q "${HADOLINT_VERSION}"

ARG CST_VERSION=1.10.0
ARG CST_SHA256="72deeea26c990274725a325cf14acd20b8404251c4fcfc4d34b7527aac6c28bc"
RUN curl --fail --silent --show-error --location --output /usr/local/bin/container-structure-test \
    "https://storage.googleapis.com/container-structure-test/v${CST_VERSION}/container-structure-test-linux-amd64" \
  && sha256sum /usr/local/bin/container-structure-test | grep -q "${CST_SHA256}" \
  && chmod a+x /usr/local/bin/container-structure-test \
  && container-structure-test version 2>&1 | grep -q "${CST_VERSION}" \
  && python3 -m pip install --no-cache-dir \
  requests==2.* yamllint==1.*

CMD ["/bin/bash"]
