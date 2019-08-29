FROM node

USER root

RUN git clone https://github.com/sachin412/newnode.git

RUN apt -y update

RUN apt install -y mongodb

RUN service  mongodb start

EXPOSE 27017

RUN cp -r newnode/* .

RUN  npm install

RUN npm install eslint

RUN chmod 777 /run/mongodb/mongodb.pid

CMD service mongodb start && tail -f /dev/null
