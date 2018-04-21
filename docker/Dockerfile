from python:3.6

ARG DOMAIN_NAME
ARG USER_MAIL

RUN apt-get update
RUN apt-get install -y nginx

# flask動かすため
RUN pip install flask uwsgi line-bot-sdk requests

# SSL化
RUN git clone https://github.com/certbot/certbot /usr/local/certbot
RUN /usr/local/certbot/certbot-auto --help

# nginxの設定
COPY default /etc/nginx/conf.d/bot.conf
RUN sed -i -e "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/conf.d/bot.conf

# その他設定
COPY start.sh /
COPY uwsgi.ini /
RUN sed -i -e "s/DOMAIN_NAME/$DOMAIN_NAME/g" /start.sh
RUN sed -i -e "s/USER_MAIL/$USER_MAIL/g" /start.sh

CMD ["sh", "/start.sh"]
