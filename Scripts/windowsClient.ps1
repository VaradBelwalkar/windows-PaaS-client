
$path=Split-Path -parent $MyInvocation.MyCommand.Definition
if ($args -eq 0){
Write-Host "No arguments provided"
}
elseif ($args[0] -eq "start"){
clear

$temp="true"
while($temp)
{
	Write-Host "odc $ " -NoNewline
	$info = Read-Host
	if ($info -eq "exit"){
		$temp="false"}
	elseif ($info -eq "clear"){
		clear}
	else{
		$hold = $info.split()			
		.\windowsClient.ps1 $hold[0] $hold[1] $hold[2]}	
}}
elseif ($args[0] -eq "help"){
python $path\services\help.py
}
elseif ($args[0] -eq "observe"){
var=$(realpath $args[1])
python $path\services\observe.py $var
}
elseif ($args[0] -eq "config"){
if ($args -eq 0){
python $path\services\config.py}
else{
python $path\services\config_edit.py}
}

elseif ($args[0] -eq "view"){
python $path\services\access.py}
elseif ($args[0] -eq "uploadfile"){
$filename=$args[1]
$filename= $filename | Foreach-Object {$_ -replace " ", "\\ "}
print($filename)
#$filename=$(Write-Host $filename | sed -r 's/ /\\ /g')
python $path\services\uploads.py $filename }
elseif ($args[0] -eq "uploaddir"){
#li=$(find $1 -type f)
}



# IFS='\' read -ra ADDR <<< $args[1]
# count=${#ADDR[@]}

# IFS=$'\n'
# for var in $(find $args[1] -type f)
# do
#   fpath1=$(Write-Host "$var" |  cut -d'\' -f"$count"- )  #this also contains the file name
#   fpath1=$(dirname $( Write-Host "$fpath1"))  #only the path name with 

#     filepath=$(dirname $( Write-Host "$var"))
#     filename=$(Write-Host "$var" | sed "s\.*\\\\")
#     #filename=$(Write-Host "$filename" | sed -r 's\ \\\ \g')
#     slash="\"
#     Write-Host "$filename" "$fpath1$slash"
#     python $path\services\uploads.py "$filepath$slash$filename" "$fpath1$slash"
# done

# IFS=$'\n'
# for var in $(find $args[1] -type f)
# do
#     #var=$(Write-Host "$var" | cut -d'\' -f1- ) # gives the whole path without .\

#  #	filepath=$(dirname $( Write-Host "$var" | cut -d'\' -f1- ))  # gives only the whole directory path without .\
#   # 	filename=$(basename $(Write-Host "$var" | cut -d'\' -f1- ))   # gives the file name
#     filepath=$(dirname $( Write-Host "$var"))
#     filename=$(Write-Host "$var" | sed "s\.*\\\\")
#    	#filename=$(Write-Host "$filename" | sed -r 's\ \\\ \g')
#     slash="\"
#   	python $path\services\uploads.py "$filepath$slash$filename" "$filepath$slash"
#     done

elseif ($args[0] -eq "delete"){
python $path\services\delete.py $args[1]}
elseif ($args[0] -eq "download"){
python $path\services\download.py $args[1]}
elseif ($args[0] -eq "set_url"){
python $path\services\set_url.py $args[1]}
elseif ($args[0] -eq "signup"){
python $path\services\signup.py}
elseif ($args[0] -eq "version"){
	Write-Host "odc version: 1.0.0"}
elseif ($args[0] -eq "server"){
	python $path\services\server.py}
elseif ($args[0] -eq "container"){
if ($args[1] -eq "run"){
	python $path\services\getruntime.py run $args[2]}
elseif ($args[1] -eq "stop"){
	python $path\services\stoporremoveruntimes.py stop $args[2]}
elseif ($args[1] -eq "remove"){
	python $path\services\stoporremoveruntimes.py remove $args[2]}
elseif ($args[1] -eq "resume"){
	python $path\services\getruntime.py resume $args[2]}
elseif ($args[1] -eq "list"){
	python $path\services\docker_list.py $args[2]
}
else{
	Write-Host "Invalid arguments, use 'help'  for more details"}
}

else{
	Write-Host "Invalid arguments, use 'help'  for more details"}


