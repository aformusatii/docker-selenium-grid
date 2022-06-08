FROM debian:latest

ADD ./data /root/

RUN apt-get update \
 && apt-get -y install procps vim net-tools wget unzip default-jdk chromium chromium-driver x11vnc xvfb locales novnc\
 && rm -rf /var/lib/apt/lists/* \
 && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
 
 
ENV LANG en_US.utf8

ENV DISPLAY :20

RUN cd /root \
 && wget https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar -O selenium-server-standalone.jar \
 && unzip fonts.zip \
 && mkdir /usr/share/fonts/Terminus/ \
 && cp ./terminus-ttf-4.47.0/*.ttf /usr/share/fonts/Terminus/ \
 && fc-cache -f -v

EXPOSE 5920
EXPOSE 4444
EXPOSE 6080

ENTRYPOINT [ "/root/entrypoint.sh" ]
