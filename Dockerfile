# Docker container for compiling to WASM
FROM emscripten/emsdk:latest

RUN apt update && apt install -y git-core libsdl2-dev make

WORKDIR /opt
RUN mkdir -p dist src include
VOLUME ["/opt/dist", "/opt/src", "/opt/include"]

WORKDIR /opt/src
ENTRYPOINT ["bash", "-c"]
CMD ["OUT_DIR=/opt/dist make -j4"]
