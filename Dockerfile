FROM ruby:2.7.0
MAINTAINER Yamada, Yasuhiro <yamada@gr3.ie>
RUN apt update && \
    apt install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.utf8 && \
    cd ~ && \
    git clone https://github.com/greymd/cureutils.git && \
    cd cureutils && \
    gem install bundler rake && \
    bundle install && \
    rake build && \
    find ./pkg/ -type f | head -n 1 | xargs gem install && \
    cd .. && \
    rm -rf cureutils
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
