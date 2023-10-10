FROM debian:stable-slim

WORKDIR /tmp

RUN apt update && apt upgrade -y && apt install curl unzip python3.11 python3.11-venv -y

RUN curl -v --request GET -sL \
	--url 'https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_117.0.2045.55-1_amd64.deb'\
	--output 'edge.deb' \
	&& apt install ./edge.deb -y && rm ./edge.deb

RUN curl -v --request GET -sL \
    --url 'https://msedgedriver.azureedge.net/117.0.2045.55/edgedriver_linux64.zip'\
    --output 'edge.zip' \
    && unzip edge.zip -d /usr/local/bin && rm edge.zip
