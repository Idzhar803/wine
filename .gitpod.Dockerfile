FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && apt update && \
    apt install -y sudo wget gnupg2 software-properties-common lxde tigervnc-standalone-server \
    xterm x11-utils xfce4-terminal dbus-x11 \
    wine64 libx11-6 libxext6 libxrender1 libxi6 libfreetype6 fonts-liberation libglu1-mesa && \
    apt clean

# Buat user gitpod
RUN useradd -m gitpod && echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER gitpod
WORKDIR /home/gitpod

CMD ["bash"]
