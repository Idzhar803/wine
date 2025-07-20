FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
    git \
    wget curl unzip sudo lsb-release \
    xfce4 xfce4-goodies tightvncserver dbus-x11 x11-xserver-utils \
    wine64 wine32 winbind fonts-wine \
    libgd3:i386 libglu1-mesa libx11-6 libxext6 libxrender1 libxi6 libfreetype6 fonts-liberation \
    xterm && \
    apt clean

# Buat user gitpod agar bisa VNC & Wine
RUN useradd -m gitpod && echo 'gitpod:gitpod' | chpasswd && adduser gitpod sudo

USER gitpod
WORKDIR /home/gitpod
