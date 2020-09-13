#!/usr/local/bin/php -q
<?php
$backup_day = 7;

// 오픈할 디렉토리 패스 
$dir_path = "/wecan2/llsunll/BACKUP";

// 디렉토리를 연다. 
$dir_handle = opendir($dir_path);

// 전체 디렉토리 내용을 출력한다. 
while($tmp = readdir($dir_handle))
{
        if(!is_dir($dir_path.$tmp))
        {
                $tmp2 = explode("-", $tmp);
                if(strlen($tmp2[1]) > 7)
                {
                        $date = substr($tmp2[1],0,8);
                        $stime = mktime(0,0,0,date(m),date(d),date(Y));
                        $etime = mktime(0,0,0,date(m),date(d)-$backup_day,date(Y));
                        $is_delete = 1;
                        for($i=$etime; $i<=$stime; $i = $i + 86400)
                        {
                                if($date==date("Ymd",$i))
                                {
                                        $is_delete = 0;
                                        break;
                                }
                        }
                        if($is_delete)
                        {
                                $cmd = "rm -f $dir_path/".$tmp;
                                exec($cmd);
                        }
                }
        }
}
// 백업
chdir("/wecan2/llsunll");
$cmd = "tar cvfpz BACKUP/blog-".date("Ymd").".tar.gz hurk.dash1st.net/";
exec($cmd);
$cmd = "mysqldump -u llsunll -p'PASSWORD' user_llsunll > BACKUP/blog-".date("Ymd").".sql";
exec($cmd);
$cmd = "chown llsunll.llsunll BACKUP/*";
exec($cmd);
?>

