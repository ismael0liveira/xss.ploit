<?php

if(isset($_GET['ip'])){
	$ip=system('curl --silent https://ipapi.co/'.$_GET['ip'].'/json/ -v 1>> dados.txt');
	
	$ip = fopen('dados.txt', 'a');
	fwrite($ip, $_GET['ip']);
	fclose($ip);

}

?> 
