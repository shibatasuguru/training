FROM ruby:2.3.3

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -qq
RUN apt-get install -y build-essential 
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs

# ワーキングディレクトリの設定
RUN mkdir /web
WORKDIR /web

# gemfileを追加する
ADD Gemfile /web/Gemfile
ADD Gemfile.lock /web/Gemfile.lock

# gemfileのinstall
RUN bundle install
ADD . /web