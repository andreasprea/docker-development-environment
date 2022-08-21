FROM debian:stable

COPY . /opt

USER root

RUN apt update && apt install -y git wget python pip
RUN pip install -r /opt/python_requirements.txt

RUN /opt/aws/install

RUN /opt/install_terraform.sh

CMD [ "sleep", "infinity" ]
