FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD startup.sh /

ENV SSH_ROOT_PASSWORD="root"

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

EXPOSE 22

ENTRYPOINT ["/startup.sh"]

CMD ["/usr/sbin/sshd", "-D"]
