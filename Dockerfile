FROM ubuntu:16.04

MAINTAINER Alexey Kiselev <alexey.kiselev@gmail.com>

EXPOSE 6863 6869

RUN mkdir /waves /waves/data /waves/wallet

VOLUME ["/waves"]

RUN apt-get update && apt-get install -y --no-install-recommends curl jq software-properties-common && rm -rf /var/lib/apt/lists/* && \
	add-apt-repository -y ppa:webupd8team/java && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt-get update && apt-get install -y oracle-java8-set-default && rm -rf /var/lib/apt/lists/*

RUN curl https://api.github.com/repos/wavesplatform/Waves/releases | jq '[.[] | {tag: .tag_name, name: .name, assets: [.assets[].browser_download_url]} | select(.name | startswith("Testnet")), select(.name == .tag)] | .[0] | [.assets] | flatten | .[] | select(test("systemd"; "ix"))' | xargs wget && \
	dpkg -i *.deb

RUN sed -i "s+\"walletDir\": \"/tmp/scorex\",+\"walletDir\": \"/waves/wallet\",+g;s+\"dataDir\": \"/tmp/scorex\",+\"dataDir\": \"/waves/data\",+g;s+\"rpcEnabled\": false,+\"rpcEnabled\": true,+g" /etc/waves-testnet.json

ENTRYPOINT waves-testnet /usr/share/waves/settings.json
