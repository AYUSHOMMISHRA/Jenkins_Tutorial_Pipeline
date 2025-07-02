FROM ubuntu:22.04

# Prevent interactive prompt during build (for tzdata)
ARG DEBIAN_FRONTEND=noninteractive

# Use reliable mirrors and install only essential packages
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirror.math.princeton.edu/pub/ubuntu/|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y tzdata apache2 curl wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose Apache HTTP default port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
