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

RUN echo "[default]" > /root/.aws/config
RUN echo "aws_access_key_id=AKIAQSJYPYLGKTFZNNWE" >> /root/.aws/config
RUN echo "aws_secret_access_key=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" >> /root/.aws/config
RUN echo "region=ap-south-1" >> /root/.aws/config
RUN echo "output=json" >> /root/.aws/config

ENTRYPOINT "tail" "-f" "/dev/null"
