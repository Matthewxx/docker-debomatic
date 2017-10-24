FROM debian:stable
RUN apt-get update && apt-get -y install python3 sbuild schroot debootstrap python3-toposort python3-sphinx texlive-latex-base texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra gettext git
WORKDIR /root
RUN git clone https://github.com/debomatic/debomatic.git
WORKDIR /root/debomatic
RUN python3 setup.py install
ADD amd64.config /root/
ADD amd64.distrib /root/
RUN mkdir /root/incoming
CMD debomatic -i -c /root/amd64.config

