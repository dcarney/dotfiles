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
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN mkdir -p /root/src
RUN cd /root/src && git clone https://github.com/dcarney/dotfiles.git
ENV DOTFILES /root/src/dotfiles
RUN ln -s $DOTFILES/.oh-my-zsh/themes/dcarney.zsh-theme /root/.oh-my-zsh/themes/dcarney.zsh-theme
RUN ln -s $DOTFILES/.tmux.conf /root/.tmux.conf
RUN ln -s $DOTFILES/.gitconfig /root/.gitconfig
RUN ln -s $DOTFILES/.vimrc /root/.vimrc
RUN ln -s $DOTFILES/.vim /root/.vim
RUN ln -s $DOTFILES/.zshrc /root/.zshrc
RUN find $DOTFILES/ -name "*.zsh" | xargs -I {} basename {} | xargs -I {} ln -s $DOTFILES/{} /root/{}

# Dropship
RUN mkdir -p /usr/local/dropship
RUN curl -o /usr/local/dropship/dropship.jar http://repo1.maven.org/maven2/com/zulily/dropship/dropship/1.1/dropship-1.1.jar
RUN echo "java -jar /usr/local/dropship/dropship.jar \$*" > /usr/bin/dropship
RUN chmod +x /usr/bin/dropship

# the pythons
RUN easy_install readline
RUN pip install pyopenssl virtualenvwrapper
RUN apt-get install --no-install-recommends -y ipython-notebook

# a dedicated virtualenv for data manipulation
ENV WORKON_HOME $HOME/.virtualenvs
RUN mkdir -p $WORKON_HOME

RUN virtualenv -p python $WORKON_HOME/pydata
ENV VIRTUAL_ENV $WORKON_HOME/pydata

RUN $VIRTUAL_ENV/bin/pip install numpy && \
        $VIRTUAL_ENV/bin/pip install scipy && \
        $VIRTUAL_ENV/bin/pip install pandas && \
        $VIRTUAL_ENV/bin/pip install pyzmq && \
        $VIRTUAL_ENV/bin/pip install tornado && \
        $VIRTUAL_ENV/bin/pip install jinja2 && \
        $VIRTUAL_ENV/bin/pip install IPython && \
        $VIRTUAL_ENV/bin/pip install matplotlib && \
        $VIRTUAL_ENV/bin/pip install patsy && \
        $VIRTUAL_ENV/bin/pip install statsmodels && \
        $VIRTUAL_ENV/bin/pip install pymc && \
        $VIRTUAL_ENV/bin/pip install scikit-learn

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
