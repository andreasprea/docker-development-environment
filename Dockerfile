FROM debian:stable

COPY . /opt

USER root
WORKDIR /opt

RUN apt update && apt install -y git wget python pip
RUN pip install -r python_requirements.txt

RUN aws/install

RUN ./install_terraform.sh

CMD [ "sleep", "infinity" ]
