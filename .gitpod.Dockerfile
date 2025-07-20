FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Siapkan arsitektur i386 + install dependensi
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
    git wget curl unzip sudo lsb-release \
    tightvncserver xfce4 xfce4-goodies dbus-x11 x11-xserver-utils \
    wine64 wine32 winbind fonts-wine \
    libgd3:i386 libglu1-mesa \
    libx11-6 libxext6 libxrender1 libxi6 libfreetype6 \
    fonts-liberation xterm && \
    apt clean

# Pastikan semua dijalankan sebagai root, GI turut diset otomatis oleh Gitpod
USER root
