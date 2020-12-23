FROM ubuntu:18.04

RUN apt update && apt install make g++ libc6-dev nasm -fy

COPY . /workdir

WORKDIR /workdir

RUN make OS=linux ARCH=x86_64

ENV MAYHEM_CMD_TARGET_INPUT /input.264
ENV MAYHEM_CMD_TYPE h264

CMD /workdir/h264dec /input.264
