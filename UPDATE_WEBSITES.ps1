. {PATH WHERE YOU WILL SAVE THIS FILES}\Executer\1_CredentialsAndVariablesSetUp.ps1


echo "Solving subdomains first"
$dictionary = @{}
# My websites with the subdomains
$dictionary.Add("retanasistemas.com", @("diccionario.qa", "leadswebsite.qa", "panel.qa", "portal", "portal.qa", "qa", "sales.qa"))
$dictionary.Add("diccionariodeacordes.com", @("rolando"))


echo "Solving Domains"
$domains =  @("chordsdictionary.com","deseguridadprivada.com","diccionariodeacordes.com","hireprivatesecurity.com", "seguridad-privada-costa-rica.info")

$name="@"                                   # name of record to update. Store number.
foreach ($element in $domains) {
	$domain = $element
	if($dictionary.ContainsKey($domain))
	{
		echo $domain " contains subdomains to work with"
		foreach($subdo in $dictionary[$domain])
		{
		echo $subdo " being fixed"
		. {PATH WHERE YOU WILL SAVE THIS FILES}\Executer\2_SendRequestToGD.ps1
		echo $subdo " DONE!!!!!!!"
		}
	}
	$name="@"
	. {PATH WHERE YOU WILL SAVE THIS FILES}\Executer\2_SendRequestToGD.ps1
	echo $domain " DONE!!!!!!!"
}