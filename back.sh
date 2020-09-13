#!/bin/sh

TAR=/bin/tar
PATH=/usr/bin:/bin

# 요일을 표시
DOW='date +%a'

# 백업할 데이터 경로
HOME_ROOT='/wecan2/llsunll'

# 백업할 데이터 저장될 경로
BACKUPDIR='/wecan2/llsunll/BACKUP'

# 풀백업의 시간이 저장될 경로
TIMEDIR='/wecan2/llsunll/last-full'

# 백업받을 계정을 값을 받아온다.
for HOME_NAME in $(ls) 
do 
if [ -d "$HOME_ROOT/$HOME_NAME" ] ; then 
        if [ $($DOW) = "Mon" ]; then
                NEWER=""
                NOW='date +%d-%b'
# 풀백업의 날짜 업데이트
                echo $($NOW) > $TIMEDIR/full-date
                $TAR -cf $BACKUPDIR/$HOME_NAME.tar $HOME_ROOT/$HOME_NAME
        else

# 마지막 풀백업 날짜 구하기
               LAST='cat /wecan2/llsunll/BACKUP/last-full/full-date'
                NEWER="--newer $($LAST)"

# 증분백업 만들기 지난주 백업파일에 덮어진다
                $TAR -cf $BACKUPDIR/$HOME_NAME.tar $HOME_ROOT/$HOME_NAME

        fi
fi 
done
