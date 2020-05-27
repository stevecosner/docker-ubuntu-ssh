FROM ubuntu:18.04



RUN apt-get update

RUN apt-get install openssh-server -y

RUN apt-get install sudo -y

RUN mkdir /root/.ssh

ADD authorized_keys /root/.ssh

RUN chmod 600 /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh





# Add non root user



RUN useradd -p $(openssl passwd -1 nest1234) steve

RUN mkdir /home/steve

RUN chmod 700 /home/steve

RUN chown steve:steve /home/steve

RUN usermod -s /bin/bash steve

RUN mkdir /home/steve/.ssh

ADD authorized_keys /home/steve/.ssh

RUN chown steve:steve /home/steve/.ssh

RUN chown steve:steve /home/steve/.ssh/authorized_keys

RUN chmod 700 /home/steve/.ssh

RUN chmod 600 /home/steve/.ssh/authorized_keys

RUN echo 'steve ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD .profile /home/steve

ADD .bashrc /home/steve 

