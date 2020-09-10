<?php
shell_exec("/var/www/html/test.sh");
header('Location: http://192.168.1.75/index.html?success=true');

echo "hi there";
?>

