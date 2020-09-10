<?php
if($_REQUEST['btn_submit']=="Power on NDI receivers")
{
  shell_exec("touch /var/www/html/commands/poweron");
}
else if($_REQUEST['btn_submit']=="Start NDI stream")
{
  shell_exec("touch /var/www/html/commands/startndi");
}
else if($_REQUEST['btn_submit']=="Stop NDI stream")
{
  shell_exec("touch /var/www/html/commands/stopndi");
}

else if($_REQUEST['btn_submit']=="Power off NDI receivers")
{
  shell_exec("touch /var/www/html/commands/poweroff");
}

sleep(2);
header('Location: /index.html');


?>

