FROM node

USER root

RUN git clone https://github.com/sachin412/newnode.git

RUN apt -y update

RUN apt install -y mongodb

RUN service  mongodb start

EXPOSE 27017

COPY docker-entrypoint.sh /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin


RUN cp -r newnode/* .

RUN  npm install

RUN npm install eslint

ENTRYPOINT ["docker-entrypoint.sh"]

CMD tail -f /dev/null
