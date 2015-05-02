FROM phusion/passenger-ruby21
MAINTAINER mbrugger "martin@brugger.eu"
ENV HOME /root
ENV RAILS_ENV production
CMD ["/sbin/my_init"]
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD timetracking/Gemfile /home/app/Gemfile
ADD timetracking/Gemfile.lock /home/app/Gemfile.lock
WORKDIR /home/app/
RUN bundle install --without heroku
ADD wrapper-env.sh /home/app/wrapper-env.sh
ENTRYPOINT ["/home/app/wrapper-env.sh"]
ADD nginx.conf /etc/nginx/sites-enabled/timetracking-webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf
ADD timetracking /home/app/timetracking-webapp
WORKDIR /home/app/timetracking-webapp
RUN chown -R app:app /home/app/timetracking-webapp
RUN bundle install --without heroku
RUN sudo -u app RAILS_ENV=production DATABASE_TYPE=mysql SECRET_KEY_BASE=dummy bundle exec rake assets:precompile

RUN sudo -u app -E bash -c 'whenever --update-crontab'

RUN mkdir -p /etc/my_init.d
ADD prepare_env.sh /etc/my_init.d/prepare_env.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
