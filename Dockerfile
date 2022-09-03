FROM debian:stable

COPY . /opt

USER root
WORKDIR /opt

RUN apt update && apt install -y git wget python pip
RUN pip install -r python_requirements.txt

RUN tools/aws/install

RUN rm -rf /usr/local/go && \
    tar -C /usr/local -xzf tools/go1.19.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin

RUN ./install_terraform.sh

WORKDIR /

CMD [ "sleep", "infinity" ]
