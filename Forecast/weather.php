<?php

// Geolocation http://api.wunderground.com/auto/wui/geo/GeoLookupXML/index.xml?query=02893
// Weather for air http://api.wunderground.com/auto/wui/geo/WXCurrentObXML/index.xml?query=KSFO
// Weather for PWS http://api.wunderground.com/weatherstation/WXCurrentObXML.asp?ID=KCASANFR70
// Weather forecast: http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=Chicago,IL

$info = urlencode('45.444913,-75.53519');
// $info = urlencode('IONOTTAW25');
$ch = curl_init("http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=$info");
curl_exec($ch);
curl_close($ch);




die;
// change "?p=" to "?w=" in your URL, that's it!
$app = '9SZ1Ag3V34F2yXAXhcFUOBSxaZQz300Q6sTnYhCCBg4PYRVKbvfR_yp0LtuB27RWZmkbne67fc4NnCUoJwEHd.cBX814yLE-';
$q = urlencode("K1C 6A1");
//$q = urlencode("02893");
$url = "http://where.yahooapis.com/v1/places.q('$q')?appid=$app";

$ch = curl_init($url);
curl_exec($ch);
curl_close($ch);
echo "\n\n----------\n\n";
die;
$ch = curl_init("http://weather.yahooapis.com/forecastrss?w=24004539&format=json");
curl_exec($ch);
curl_close($ch);
?>
