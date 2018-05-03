FROM heroku/heroku:16
ARG version

# Set the working directory to /app
WORKDIR /app

RUN echo "Building ${version}"

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Now set up the build environment for SWI
RUN apt-get install -y build-essential gcc m4 autoconf zlib1g-dev
COPY compile.sh /app/

# And build it
RUN /app/compile.sh ${version}
