#!/bin/sh

TAR=/bin/tar

#���� ��¥ ���ϱ�
today=`date +%Y%m%d`

#����� ������ 
backup_data='hurk.dash1st.net'

#����� ���
backup_dir='BACKUP'

$TAR cfpz $backup_dir/$today.tar.gz $backup_data 

mysqldump -u llsunll -p'38317' user_llsunll > ./BACKUP/DB_llsunll.sql

