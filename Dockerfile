FROM hashicorp/terraform

USER root

RUN apk update && apk add && apk add openssl 

RUN echo -e "\n"|ssh-keygen -t rsa -N "" -m PEM

RUN openssl rsa -in ~/.ssh/id_rsa -outform pem > id_rsa.pem

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN pip install awscli

RUN echo "hello"

RUN cd /root

RUN mkdir /root/.aws/

RUN cd /root/.aws/


ENTRYPOINT "tail" "-f" "/dev/null"
