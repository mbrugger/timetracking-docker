FROM ubuntu:14.04

MAINTAINER Martin Brugger <martin@brugger.eu>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
libmysqlclient18 nginx supervisor curl libmysqlclient-dev

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash
ENV PATH /usr/local/rvm/bin/:$PATH
RUN rvm install 2.1.6
#RUN rvm use ruby-2.1.6 --default
ENV PATH /usr/local/rvm/rubies/ruby-2.1.6/bin/:$PATH
RUN gem install bundler

ADD unicorn.rb /etc/unicorn.rb
#ADD nginx.conf /etc/nginx/nginx.conf

# add time as the only nginx site
ADD time.nginx.conf /etc/nginx/sites-available/time
RUN ln -s /etc/nginx/sites-available/time /etc/nginx/sites-enabled/time
RUN rm /etc/nginx/sites-enabled/default

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

RUN mkdir /home/app
WORKDIR /home/app

ADD timetracking/Gemfile /home/app/Gemfile
ADD timetracking/Gemfile.lock /home/app/Gemfile.lock

RUN bundle install --without heroku
ADD timetracking /home/app
WORKDIR /home/app
RUN bundle install --without heroku
RUN RAILS_ENV=production DATABASE_TYPE=mysql SECRET_KEY_BASE=dummy bundle exec rake assets:precompile


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
