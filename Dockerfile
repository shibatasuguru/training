FROM ruby:2.3.3

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -qq
RUN apt-get install -y build-essential 
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs

# ���[�L���O�f�B���N�g���̐ݒ�
RUN mkdir /web
WORKDIR /web

# gemfile��ǉ�����
ADD Gemfile /web/Gemfile
ADD Gemfile.lock /web/Gemfile.lock

# gemfile��install
RUN bundle install
ADD . /web