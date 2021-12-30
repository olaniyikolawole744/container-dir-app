FROM amazonlinux
COPY . /project
WORKDIR /project
ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.ssh/id_rsa.pub
ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 755 script.sh
CMD ./script.sh