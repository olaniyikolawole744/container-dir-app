FROM amazonlinux
COPY . /project
WORKDIR /project
ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.ssh/id_rsa.pub
ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 755 script.sh
CMD ./script.sh



#RUN yum install -y yum-utils
#RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
#RUN yum -y install packer
#RUN yum -y install terraform
#RUN packer init packer/golden_image_ami222.pkr.hcl
#RUN terraform -chdir=terraform-jobs/infrastructure_vpc/ init
#RUN terraform -chdir=terraform-jobs/remote_servers/ init
#RUN terraform -chdir=terraform-jobs/subnet_rt_assoc/ init
#RUN terraform -chdir=terraform-jobs/tools_server/ init
#CMD packer build packer/golden_image_ami222.pkr.hcl && \
#    terraform -chdir=terraform-jobs/infrastructure_vpc/ apply --auto-approve && \
#    terraform -chdir=terraform-jobs/tools_server/ apply -var-file=variable_values.tfvars --auto-approve && \
#    terraform -chdir=terraform-jobs/remote_servers/ apply -var-file=variable_values.tfvars --auto-approve && \
#    terraform -chdir=terraform-jobs/subnet_rt_assoc/ apply --auto-approve







#ENTRYPOINT ./auto-script.sh ; /bin/bash

#RUN amazon-linux-extras install ansible2 -y




#RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
#COPY . /workspace
#WORKDIR /workspace
##WORKDIR /usr/local/bin/
#VOLUME /var/run/docker.sock
#RUN yum install systemctl -y
#CMD ["./automation.sh"]
#ENTRYPOINT ["docker-entrypoint.sh"]
#ENV container docker
#RUN yum install docker -y
#RUN yum update -y
#RUN yum install docker-engine -y
#RUN service docker start

#RUN yum install docker -y
#FROM docker:dind
#ENV AWS_DEFAULT_REGION=us-east-1
#COPY . /infra
#WORKDIR /infra
#COPY . /infra
#WORKDIR /infra
#RUN cd ansible-jobs
#RUN cd packer/
#RUN cd scripts/
#RUN ls terraform-jobs/
#CMD ls /infra/code2/
#CMD [chmod 755 /infra/automation.sh]
#ENTRYPOINT ["/bin/sh","chmod","755","/infra/automation.sh","echo permission changed"]
#CMD ["/usr/local/bin/./automation.sh"]
# RUN chmod 755 automation.sh
#CMD ["chmod 755 /infra/automation.sh","./automation.sh"]
#CMD docker run --privileged -d docker:dind
#ADD /usr/bin/docker /usr/local/bin/docker
#COPY Dockerfile .
#RUN yum install sudo -y
#RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
#RUN /etc/init.d/docker start
#RUN docker run --privileged -d docker:dind
#RUN docker run -ti -v /var/run/docker.sock:/var/run/docker.sock docker
#RUN docker build -t appapp .
#CMD ["docker run --name appapp appapp"]






#RUN terraform init


# FROM xakra/ansible-dockerized

#ENV AWS_ACCESS_KEY_ID=AKIA4HXUQH5E3HNW5DGA  

#ENV AWS_SECRET_ACCESS_KEY=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

#ENV AWS_ACCESS_KEY_ID: !vault |
#          $ANSIBLE_VAULT;1.1;AES256
#          61356635666132316533663266626136393539303232353064303763303936646238373538383961
#          3633653963663932326134623230373233613930353861380a326135326435656535306433353865
#          37326635613733303365346461386136643831643565313432336265383632373535366464353839
#          3936663063343333330a366636643239663131646338383532396364666163323236663931363039
#          31373863383930363331333839656437353364616137316131333363303633316336

#ENV AWS_SECRET_ACCESS_KEY: !vault |
#          $ANSIBLE_VAULT;1.1;AES256
#          65623130383530623332313839663737376530303966373236313765363264613732613262383037
#          6662613535333163613338316564373133636163663562300a613437323938626530663662313238
#          65373235636139393265663034613236646232396430363863313331633433386631316531383438
#          6131306662613132350a656636623961373239663432633735643436663636363939316131346136
#          35366162396338336163353732643363383539313032653665393064356163366261383132353466
#          3234333035346664333761376630313532313265336331666230

