FROM ubuntu:latest

MAINTAINER Dylan Carney, dcarney@gmail.com

RUN apt-get update

# ubuntu-restricted-extras \

RUN apt-get install --no-install-recommends -y \
  apt-file \
  apt-show-versions \
  build-essential \
  cmake \
  curl \
  gfortran \
  git \
  gitk \
  g++ \
  keepassx \
  libatlas-base-dev \
  libatlas-dev \
  libatlas3-base \
  libc6-dev \
  libffi-dev \
  libfreetype6 \
  libfreetype6-dev \
  libncurses5-dev \
  libpng-dev \
  libssl-dev \
  libxft-dev \
  libxml2-dev \
  locales \
  make \
  maven \
  nodejs \
  npm \
  python \
  python-dev \
  python-pip \
  python-virtualenv \
  rbenv \
  ssh \
  tmux \
  ttf-ubuntu-font-family \
  vim \
  wget \
  xclip \
  zsh

# environment
RUN mkdir -p /root
RUN chsh -s /usr/bin/zsh
ENV TERM xterm-256color
ENV HOME /root
RUN dpkg-reconfigure locales
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8

# github conf
RUN rm -rf /root/.ssh && mkdir -p /root/.ssh/
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# all-important dotfiles
RUN mkdir -p /root/src
RUN cd /root/src && git clone https://github.com/dcarney/dotfiles.git
RUN ln -s /root/src/dotfiles/.tmux.conf /root/.tmux.conf
RUN ln -s /root/src/dotfiles/.gitconfig /root/.gitconfig
RUN ln -s /root/src/dotfiles/.vimrc /root/.vimrc
RUN ln -s /root/src/dotfiles/.vim /root/.vim
RUN ln -s /root/src/dotfiles/.zshrc /root/.zshrc
RUN find -name "/root/src/dotfiles/*.zsh" -exec ln -s {} "/root" \;

# Dropship
RUN mkdir -p /usr/local/dropship
RUN curl -o /usr/local/dropship/dropship.jar http://repo1.maven.org/maven2/com/zulily/dropship/dropship/1.1/dropship-1.1.jar
RUN echo "java -jar /usr/local/dropship/dropship.jar \$*" > /usr/bin/dropship
RUN chmod +x /usr/bin/dropship

# the pythons
RUN easy_install readline
RUN pip install pyopenssl
RUN apt-get install --no-install-recommends -y \
  ipython-notebook

# node and coffeescript
RUN npm config set strict-ssl false
RUN npm config set registry "http://registry.npmjs.org/"
RUN npm install -g coffee-script

# hadoop
RUN wget http://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop_1.2.1-1_i386.deb
RUN dpkg -i hadoop_1.2.1-1_i386.deb

# misc utils
RUN pip install httpie csvkit

# Install oracle java
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN apt-get install -y oracle-java7-set-default

# Install maven
RUN apt-get install --no-install-recommends -y maven

ENTRYPOINT ["tmux"]
