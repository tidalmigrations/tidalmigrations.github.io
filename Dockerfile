FROM ruby:3.3.4
MAINTAINER mrafayaleem@gmail.com

RUN apt-get clean \
  && mv /var/lib/apt/lists /var/lib/apt/lists.broke \
  && mkdir -p /var/lib/apt/lists/partial

RUN apt-get update

RUN apt-get install -y \
    nodejs \
    python3-pygments \
    build-essential \
    libxml2-dev \
    libxslt-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN gem install bundler && bundle install

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0"]