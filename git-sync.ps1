Write-Host 'Pushing changes to Git for my app!';

$dir = "C:\Users\username\source\repos\statscale.com\"
Set-Location $dir

Write-Output '';
Write-Output 'Adding locally...'
git add .

Write-Output '';
Write-Output "Committing locally..."
git commit -m 'Scripted commit'

Write-Output '';
Write-Output "Pulling latest from git..."
git pull origin master

Write-Output '';
Write-Output "Pushing latest to git..."
git push origin master

Write-Output '';
Write-Host 'Finished!';
Start-Sleep -Seconds 1