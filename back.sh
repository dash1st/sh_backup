#!/bin/sh

TAR=/bin/tar
PATH=/usr/bin:/bin

# ������ ǥ��
DOW='date +%a'

# ����� ������ ���
HOME_ROOT='/wecan2/llsunll'

# ����� ������ ����� ���
BACKUPDIR='/wecan2/llsunll/BACKUP'

# Ǯ����� �ð��� ����� ���
TIMEDIR='/wecan2/llsunll/last-full'

# ������� ������ ���� �޾ƿ´�.
for HOME_NAME in $(ls) 
do 
if [ -d "$HOME_ROOT/$HOME_NAME" ] ; then 
        if [ $($DOW) = "Mon" ]; then
                NEWER=""
                NOW='date +%d-%b'
# Ǯ����� ��¥ ������Ʈ
                echo $($NOW) > $TIMEDIR/full-date
                $TAR -cf $BACKUPDIR/$HOME_NAME.tar $HOME_ROOT/$HOME_NAME
        else

# ������ Ǯ��� ��¥ ���ϱ�
               LAST='cat /wecan2/llsunll/BACKUP/last-full/full-date'
                NEWER="--newer $($LAST)"

# ���й�� ����� ������ ������Ͽ� ��������
                $TAR -cf $BACKUPDIR/$HOME_NAME.tar $HOME_ROOT/$HOME_NAME

        fi
fi 
done
