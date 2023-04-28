docker build --no-cache -t ftp .

docker run -d --name ftp -p 21:21 -p 30001-30020:30001-30020 -e PASV_ADDRESS=example.com -e PASV_ADDR_RESOLVE=YES -e SSL_ENABLE=YES -e FTP_USER=aloda -e FTP_PASS=aloda  ftp
