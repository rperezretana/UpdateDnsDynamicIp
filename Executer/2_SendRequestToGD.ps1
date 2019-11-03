
#ENTER THE NAME OF THE RECORD YOU WISH TO UPDATE#
try{
	$headers = @{}
	$headers["Authorization"] = 'sso-key ' + $apiKey + ':' + $apiSecret
	$result = Invoke-WebRequest https://api.godaddy.com/v1/domains/$domain/records/$type/$name -method get -headers $headers -UseBasicParsing
	$content = ConvertFrom-Json $result.content
	$dnsIp = $content.data
	# Get public ip address there are several websites that can do this.
	$currentIp =  Invoke-RestMethod http://ipinfo.io/json | Select-Object -ExpandProperty ip
	echo "CurrentIP: $currentIp"
	if ( $currentIp -ne $dnsIp ) {
		echo "Sending the update for "$domain
		$Request = @(@{data=$currentIp;port=$port;priority=0;protocol="string";service="string";ttl=$ttl;weight=$weight })
		$JSON = Convertto-Json $request
		$result = Invoke-WebRequest https://api.godaddy.com/v1/domains/$domain/records/$type/$name -method put -headers $headers -Body $json -ContentType "application/json" -UseBasicParsing
	}
	else {
		echo "for "$domain" IP's are fine in Godaddy, no update required"
	}
}
catch{}
#EOF