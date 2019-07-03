<#PS C:\> $PSVersionTable

Name                           Value
----                           -----
PSVersion                      5.1.16299.1146
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.16299.1146
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1#>

## Random Custom Password Generator ##

for($i=1
     $i -le 25 # number of passwords generated
     $i++){
# Pull random characters and length from pool.
function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
	}
# Generates random order from character string.
function RandomString([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $randomStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $randomStringArray
    return $outputString 
   }
	
	# Pool of ASCII Characters, set length for each set for total length when added i.e. 64.
    $password = Get-RandomCharacters -length 10 -characters 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $password += Get-RandomCharacters -length 15 -characters 'abcdefghijklmnopqrstuvwxyz'
    $password += Get-RandomCharacters -length 15 -characters '0123456789'
    $password += Get-RandomCharacters -length 15 -characters '!@#$%^&*'
	# Various operating systems and applications may apply limitations to this set:
	$password += Get-RandomCharacters -length 9 -characters '()_+=-[]{}\;:<>/?~'

$password = RandomString $password
 
Write-Host $i $password
}
	 
	 
	 