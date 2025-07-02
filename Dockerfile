FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirror.math.princeton.edu/pub/ubuntu/|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y tzdata apache2 curl wget && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose Apache HTTP default port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
