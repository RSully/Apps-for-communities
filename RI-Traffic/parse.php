<?php
error_reporting(E_ALL);

$file = dirname(__FILE__) . '/data.txt';

$data = file_get_contents($file);
$lines = explode("\n", $data);

foreach($lines as $key => &$line) {
	$line = explode(',', $line);
	if(count($line) < 2) {
		unset($lines[$key]);
	}
}

foreach($lines as $key => &$line) {
	$bounds = '41,-71|40,-72';
	$state = null;//'Rhode Island';
	$geo = getGeocode($line[1], $state, $bounds);
	$info = $geo['geometry'];
	$loc = $info['location'];
	if($loc) {
		$line = array($line[0], $line[1], $loc);
	} else {
		unset($lines[$key]);
	}
}

// So far [0] - cam, [1] - street, [2] - lat/lng

$beg = '[arr addObject:[Camera cameraWithState:self ';
$end = ']];'."\n";

$data = '';
foreach($lines as &$line) {
	$lat = $line[2]['lat'];
	$lon = $line[2]['lng'];
	$info = $line[1];
	$id = $line[0];
	
	$data .= $beg .'lat:'.$lat.'f lon:'.$lon.'f ident:@"'.$id.'" info:@"'.$info.'"'.$end;
	//$data .= $beg . "lat:$lat f lon:$lon.f ident:@\"$id\"" . $end;
}

echo PHP_EOL.$data.PHP_EOL;


// Functions
function getGeocode($street, $state, $bounds) {
	$street = str_replace(' ', '+', $street);
	$state = str_replace(' ', '+', $state);
	$url = 'http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address=';
	$url .= $street;
	echo $url . PHP_EOL;
	return;
	//southwest and northeast bounds
	if(strlen($state) > 0) {
		$url .= ",+$state";
	}
	if(strlen($bounds) > 0) {
		$url .= "&bounds=$bounds";
	}
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$data = curl_exec($ch);
	curl_close($ch);
	
	$json = json_decode($data, true);
	if($json['status'] != 'OK') {
		echo PHP_EOL."ERROR: " . $json['status'] . PHP_EOL;
		return null;
	}
	if(count($json['results']) < 1) {
		echo "ERROR";
		print_r($json);
		return null;
	}
	return $json['results'][0];
}
?>
