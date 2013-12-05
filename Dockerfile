FROM        ubuntu
MAINTAINER  Love Nyberg "love.nyberg@lovemusic.se"

# Update apt sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Update the package repository
RUN apt-get update; apt-get upgrade -y; apt-get install locales

# Configure timezone and locale
RUN echo "Europe/Stockholm" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN export LANGUAGE=en_US.UTF-8; export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; locale-gen en_US.UTF-8; DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

# Install base system
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl python-software-properties

# Install phppgadmin
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-contrib phppgadmin

# Expose port 80
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]