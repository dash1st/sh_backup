#!/bin/sh

TAR=/bin/tar

#오늘 날짜 구하기
today=`date +%Y%m%d`

#백업할 데이터 
backup_data='hurk.dash1st.net'

#백업될 장소
backup_dir='BACKUP'

$TAR cfpz $backup_dir/$today.tar.gz $backup_data 

mysqldump -u llsunll -p'PSSSWORD' user_llsunll > ./BACKUP/DB_llsunll.sql

