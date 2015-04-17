#!/bin/bash

echo "rake db:create db:migrate"
sudo -u app -E bash -c 'bundle exec rake db:create db:migrate'

echo "export COMPANY_NAME=\"$COMPANY_NAME\"" >> /home/app/.bashrc
echo "export DATABASE_HOST=\"$DATABASE_HOST\"" >> /home/app/.bashrc
echo "export DATABASE_NAME=\"$DATABASE_NAME\"" >> /home/app/.bashrc
echo "export DATABASE_PASSWORD=\"$DATABASE_PASSWORD\"" >> /home/app/.bashrc
echo "export DATABASE_PORT=\"$DATABASE_PORT\"" >> /home/app/.bashrc
echo "export DATABASE_TYPE=\"$DATABASE_TYPE\"" >> /home/app/.bashrc
echo "export DATABASE_USERNAME=\"$DATABASE_USERNAME\"" >> /home/app/.bashrc
echo "export DEVISE_SECRET_KEY=\"$DEVISE_SECRET_KEY\"" >> /home/app/.bashrc
echo "export HOME=\"$HOME\"" >> /home/app/.bashrc
echo "export HOSTNAME=\"$HOSTNAME\"" >> /home/app/.bashrc
echo "export MAIL_FROM=\"$MAIL_FROM\"" >> /home/app/.bashrc
echo "export MAIL_HOSTNAME=\"$MAIL_HOSTNAME\"" >> /home/app/.bashrc
echo "export RAILS_ENV=\"$RAILS_ENV\"" >> /home/app/.bashrc
echo "export SECRET_KEY_BASE=\"$SECRET_KEY_BASE\"" >> /home/app/.bashrc
echo "export SMTP_AUTHENTICATION=\"$SMTP_AUTHENTICATION\"" >> /home/app/.bashrc
echo "export SMTP_DOMAIN=\"$SMTP_DOMAIN\"" >> /home/app/.bashrc
echo "export SMTP_PASSWORD=\"$SMTP_PASSWORD\"" >> /home/app/.bashrc
echo "export SMTP_PORT=\"$SMTP_PORT\"" >> /home/app/.bashrc
echo "export SMTP_SERVER=\"$SMTP_SERVER\"" >> /home/app/.bashrc
echo "export SMTP_SSL=\"$SMTP_SSL\"" >> /home/app/.bashrc
echo "export SMTP_USER_NAME=\"$SMTP_USER_NAME\"" >> /home/app/.bashrc
echo "export DEFAULT_LOCALE=\"$DEFAULT_LOCALE\"" >> /home/app/.bashrc
