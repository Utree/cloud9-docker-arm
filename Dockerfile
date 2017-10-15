# Use ARM Ubunutu base image
FROM armv7/armhf-ubuntu
MAINTAINER Simone Roberto Nunzi <simone.roberto.nunzi@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    curl \
    libssl-dev \
    apache2-utils \
    git \
    libxml2-dev \
    sshfs \
    python2.7

RUN ln -s /usr/bin/python2.7 /usr/bin/python

# Install cloud9ide
RUN git clone https://github.com/c9/core.git /home/cloud9ide/cloud9
RUN /home/cloud9ide/cloud9/scripts/install-sdk.sh

# Update config
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /home/cloud9ide/cloud9/configs/standalone.js

# Add workspace directory
RUN mkdir /workspace
VOLUME /workspace

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
  && apt-get install -y nodejs

# Install Bower, Grunt & Composer
RUN npm install -g bower grunt-cli getcomposer
RUN echo '{ "allow_root": true }' > /root/.bowerrc

# Install Yarn

#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get update && apt-get install yarn

# Cleanup apt-get
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
#Expose ports: Note port 8080 - node is not run as root
EXPOSE 8080
EXPOSE 3000
EXPOSE 80

# Setup entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
CMD ["/entrypoint.sh"]
