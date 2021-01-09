FROM ubuntu:20.04
RUN apt update
RUN apt install -y ruby-full
RUN apt-get install -y build-essential zlib1g-dev
RUN gem install jekyll bundler
RUN apt-get install -y git

ENV HOME=/home/user
ENV GEM_HOME=/home/user/gems
ENV PATH=/home/user/gems/bin:$PATH
EXPOSE 4000
RUN ruby --version
RUN gem --version
WORKDIR /home/user/

RUN git clone https://github.com/xpyx/xpyx.github.io.git
WORKDIR /home/user/xpyx.github.io
CMD [ "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]

