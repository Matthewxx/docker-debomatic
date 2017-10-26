FROM debian:stable
RUN apt-get update && apt-get -y install python3 sbuild schroot debootstrap python3-toposort python3-sphinx texlive-latex-base texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra gettext git dput
WORKDIR /root
RUN git clone https://github.com/debomatic/debomatic.git
RUN git clone https://github.com/debomatic/instances.git
WORKDIR /root/debomatic
RUN python3 setup.py install
ADD amd64.config /root/
ADD amd64.distrib /root/
ADD schroot.fstab /root/instances/schroot/fstab
ADD dput.cf /etc/
RUN ln -s /root/instances/schroot /etc/schroot/debomatic
RUN mkdir /root/incoming
CMD debomatic -i -c /root/amd64.config

