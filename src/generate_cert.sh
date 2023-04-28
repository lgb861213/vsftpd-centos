#!/bin/bash

sudo openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout vsftpd.pem -out vsftpd.pem
