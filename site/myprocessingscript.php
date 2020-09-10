<html>
<body>

FBCR NDI Stream Management results page<br> 

<?php

echo "1";

if(isset($_POST['field1'])) {
    echo "2";
    $data = $_POST['field1'] . "\r\n";
    echo "$data";
    $ret = file_put_contents('streamname.txt', $data);
    if($ret === false) {
        die('There was an error writing this file');
    }
    else {
        echo "$ret bytes written to file";
        echo "attempting to play the stream $data";
    }

    exec("bash /home/ndi/ndi-receiver-config/all_start_and_play_from_file.sh");
}
else {
   die('no NDI stream name given');
}
?>



</body>
</html> 