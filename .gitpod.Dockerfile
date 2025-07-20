FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y software-properties-common && \
    apt update && \
    apt install -y \
    wine64 wine32 winbind \
    libgd3:i386 \
    libx11-6 libxext6 libxrender1 libxi6 libfreetype6 \
    libglu1-mesa fonts-liberation

# Tes wine
RUN winecfg || true
