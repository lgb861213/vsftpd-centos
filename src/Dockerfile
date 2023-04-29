FROM centos:7

RUN yum update ;yum install -y  vsftpd db-util net-tools;yum clean all

ENV FTP_USER admin
ENV FTP_PASS admin
ENV FTP_ANON NO
ENV PASV_ADDRESS 127.0.0.1
ENV PASV_MIN_PORT 30001
ENV PASV_MAX_PORT 30020
ENV PASV_ADDR_RESOLVE NO
ENV PASV_ENABLE YES
ENV SSL_ENABLE NO
ENV PORT_ENABLE NO
ENV CONNECT_FROM_PORT_20 NO

COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd_virtual /etc/pam.d/
COPY run-vsftpd.sh /usr/sbin/
COPY vsftpd.pem /etc/vsftpd/
RUN chmod +x /usr/sbin/run-vsftpd.sh && \
                mkdir -p /var/run/vsftpd/empty

VOLUME /home/www
VOLUME /var/log/vsftpd

EXPOSE 20 21 $PASV_MIN_PORT-$PASV_MAX_PORT

CMD ["/usr/sbin/run-vsftpd.sh"]
