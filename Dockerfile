FROM ubuntu:latest

RUN apt update -y > /dev/null 2>&1 && apt upgrade -y > /dev/null 2>&1 && apt install locales -y \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN apt install ssh wget unzip nodejs npm neofetch curl -y > /dev/null 2>&1

ENV LANG en_US.utf8
ENV Password=abilek
ENV ngrokid=2JfFfiFJ9hk9QhHSfPesrdBQxaL_5st1GdS2AxFbJxM16NKNN

RUN wget -O ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok.zip

RUN echo "./ngrok config add-authtoken ${ngrokid}" >>/1.sh
RUN echo "./ngrok tcp 22 &>/dev/null" >>/1.sh
RUN echo 'response=$(curl -s http://127.0.0.1:4040/api/tunnels)' >>/1.sh
RUN echo "git clone https://SanzGanzs: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@github.com/SanzGanzs/info-judul a -b test"
RUN echo "sleep 5s" >>/1.sh
RUN echo 'echo $response' >>/1.sh

RUN mkdir /run/sshd
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo root:${Password}|chpasswd

RUN service ssh start

COPY . .

RUN chmod 755 /1.sh
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306
CMD /1.sh
