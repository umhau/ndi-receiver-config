<html>
<body>

<?php

$stream_name = $_GET["stream_name"]
$make_it_work_command = "bash /home/ndi/play.sh " . $stream_name

exec($make_it_work_command);

?>

Attempting to play the stream <?php echo $stream_name; ?>. This may take several minutes, depending on if the NDI recivers need to be turned on.  Note that tv screens will not be turned on by this command; you will have to do that manually.

</body>
</html> 