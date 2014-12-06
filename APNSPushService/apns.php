<?php

// 这里是我们上面得到的deviceToken，直接复制过来（记得去掉空格）
$deviceToken=$_POST['deviceToken'];

// Put your private key's passphrase here:
$passphrase = 'password';

// Put your alert message here:
$message = $_POST['message'];

$ctx = stream_context_create();

stream_context_set_option($ctx, 'ssl', 'local_cert', 'apple_push_notification_development.pem');
stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

// Open a connection to the APNS server
//这个为正是的发布地址
//$fp = stream_socket_client('ssl://gateway.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT, $ctx);
//这个是沙盒测试地址，发布到appstore后记得修改哦

$fp = stream_socket_client('ssl://gateway.sandbox.push.apple.com:2195', $err,$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);

if (!$fp){
exit("Failed to connect: $err $errstr" . PHP_EOL);
}

//echo 'Connected to APNS' . PHP_EOL;
// Create the payload body

$body['aps'] = array(
'alert' => $message,
'forum_id' => 88,
'topic_id' => 999,
);

// Encode the payload as JSON
$payload = json_encode($body);

// Build the binary notification
//$msg = chr(0).pack('n', 32).pack('H', $deviceToken). pack('n', strlen($payload)).$payload;
$msg = chr(0) . pack("n",32) . pack('H*', str_replace(' ', '', $deviceToken)) . pack("n",strlen($payload)) . $payload;

// Send it to the server
$result = fwrite($fp, $msg, strlen($msg));

if (!$result){
	echo 'Message not delivered' . PHP_EOL;
}else{
	echo 'Message successfully delivered' . PHP_EOL;
}

// Close the connection to the server
fclose($fp);

?>
