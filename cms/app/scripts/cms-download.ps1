# CMS download to CSV backup script
# Copyright 2015 Pika Software, LLC

# powershell.exe -ExecutionPolicy Bypass -File C:\path\cms-download.ps1

$local_save_path = "C:\cms-backup"
$url = "https://pikasoftware.com/site"
$username = "username"
$password = "password"

New-Item -ItemType Directory -Force -Path $local_save_path
$pair = "${username}:${password}"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$base64 = [System.Convert]::ToBase64String($bytes)
$h = "Basic $base64"
$headers = @{ Authorization = $h }
$j = Invoke-WebRequest -Uri $url/services/table_listing.php -Headers $headers | ConvertFrom-Json

foreach ($table in $j)
{
	Invoke-WebRequest -Uri $url/services/csv.php?action=$table -Headers $headers -outFile "$local_save_path\$table.csv"
}