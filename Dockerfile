FROM debian:stable

COPY . /opt

USER root
WORKDIR /opt

RUN apt update && apt install -y git wget curl python pip
RUN pip install -r python_requirements.txt

RUN tools/aws/install

RUN rm -rf /usr/local/go && \
    tar -C /usr/local -xzf tools/go1.19.linux-amd64.tar.gz && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.bashrc

# download kubebuilder and install locally.
RUN curl -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(/usr/local/go/bin/go env GOOS)/$(/usr/local/go/bin/go env GOARCH) && \
    chmod +x kubebuilder && mv kubebuilder /usr/local/bin/

RUN ./install_terraform.sh

WORKDIR /

CMD [ "sleep", "infinity" ]
