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

EXPOSE 20 21 30001-30020

CMD ["/usr/sbin/run-vsftpd.sh"]
[ec2-user@ip-172-31-1-121 v6]$
[ec2-user@ip-172-31-1-121 v6]$ cat run-vsftpd.sh
#!/bin/bash

# Create home dir and update vsftpd user db:
#
#useradd www-data -s /sbin/nologin
mkdir -p /home/www
chown -R ftp:ftp /home/www
mkdir -p /var/log/vsftpd
chown -R ftp:ftp /var/log/vsftpd

echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd/virtual_users.txt
db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

echo "anonymous_enable=${FTP_ANON}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=${PASV_ADDRESS}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=${PASV_MAX_PORT}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=${PASV_MIN_PORT}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_addr_resolve=${PASV_ADDR_RESOLVE}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=${PASV_ENABLE}" >> /etc/vsftpd/vsftpd.conf
echo "ssl_enable=${SSL_ENABLE}" >> /etc/vsftpd/vsftpd.conf
echo "force_local_data_ssl=YES" >> /etc/vsftpd/vsftpd.conf
echo "force_local_logins_ssl=YES" >> /etc/vsftpd/vsftpd.conf
echo "port_enable=${PORT_ENABLE}" >> /etc/vsftpd/vsftpd.conf
echo "connect_from_port_20=${CONNECT_FROM_PORT_20}" >> /etc/vsftpd/vsftpd.conf


# Run vsftpd:
vsftpd /etc/vsftpd/vsftpd.conf

exec "$@"
