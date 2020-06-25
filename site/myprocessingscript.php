<?php
if(isset($_POST['field1'])) {
    $data = $_POST['field1'] . '-' . $_POST['field2'] . "\r\n";
    $ret = file_put_contents('streamname.txt', $data, FILE_APPEND | LOCK_EX);
    if($ret === false) {
        die('There was an error writing this file');
    }
    else {
        echo "$ret bytes written to file";
        echo "attempting to play the stream $data"
    }

    exec("bash /home/ndi/ndi-receiver-config/all_start_and_play_from_file.sh");
}
else {
   die('no NDI stream name given');
}
?>