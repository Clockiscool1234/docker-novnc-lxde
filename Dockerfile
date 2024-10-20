FROM debian:bullseye

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=720

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      firefox-esr \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      lxde \
      xvfb

COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
