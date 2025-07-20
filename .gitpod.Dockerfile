FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Tambahkan arsitektur i386
RUN dpkg --add-architecture i386

# Buat user gitpod secara manual (hindari error GID)
RUN groupadd -g 33333 gitpod && \
    useradd -u 33333 -g 33333 -m gitpod && \
    apt update && \
    apt install -y \
      sudo git curl wget unzip xterm \
      tightvncserver xfce4 xfce4-goodies dbus-x11 x11-xserver-utils \
      wine64 wine32 winbind fonts-wine \
      libgd3:i386 libglu1-mesa \
      libx11-6 libxext6 libxrender1 libxi6 libfreetype6 \
      fonts-liberation \
      && apt clean

# Tambahkan user gitpod ke sudoers
RUN echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch ke user gitpod
USER gitpod
