FROM        arm64v8/node:14

LABEL       author="macosbutbetter" maintainer="example@example.com"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 python3 tzdata ca-certificates dnsutils build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev chromium-browser \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
