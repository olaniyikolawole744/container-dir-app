FROM amazonlinux
COPY . /project
WORKDIR /project
RUN chmod 755 script222.sh
CMD ./script222.sh