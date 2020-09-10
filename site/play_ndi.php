<html>
<body>

<!-- <?php

$stream_name = $_GET["stream_name"]
$make_it_work_command = "bash /home/ndi/ndi-receiver-config/make_them_work.sh "

exec($make_it_work_command);

?>

Attempting to play the stream <?php echo $stream_name; ?>. This may take several minutes, depending on if the NDI recivers need to be turned on.  Note that tv screens will not be turned on by this command; you will have to do that manually. -->


<?php
if(isset($_POST['field1']) && isset($_POST['field2'])) {
    $data = $_POST['field1'] . '-' . $_POST['field2'] . "\r\n";
    $ret = file_put_contents('/tmp/mydata.txt', $data, FILE_APPEND | LOCK_EX);
    if($ret === false) {
        die('There was an error writing this file');
    }
    else {
        echo "$ret bytes written to file";
    }
}
else {
   die('no post data to process');
}
?>


</body>
</html> 
