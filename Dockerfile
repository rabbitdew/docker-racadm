FROM centos:7

RUN yum -y install wget perl dmidecode openssl openssl-devel

WORKDIR /tmp
RUN wget http://linux.dell.com/repo/hardware/latest/bootstrap.cgi 
RUN bash /tmp/bootstrap.cgi 
RUN yum -y install srvadmin-idrac

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

