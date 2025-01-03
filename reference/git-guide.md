# Git Guide

A few handy commands in one handy place.

### Updating .gitignore and enforcing it

When you want to ignore additional files or folders, you have to update your ``.gitignore``.  After you make the additions or changes, you have to remove the cached files from the local repository, add them back, commit again to the local and push to the remote repositories:

```git
git rm -r --cached .
git add .
git commit -m "Ignore list update"
```

To push the locally committed changes back to your remote repo:

```git
git push
```

### PowerShell script to sync with git

This is a handy script I keep on my desktop (or an easy to find document folder) which I launch whenever I work with documents outside of a coding tool that need to be quickly pushed to Git.

```powershell
Write-Host 'Pushing changes to Git for my app!';

$dir = "C:\Users\username\source\repos\reponame\"
Set-Location $dir

Write-Output '';
Write-Output 'Adding locally...'
git add .

Write-Output '';
Write-Output "Committing locally..."
git commit -m 'Scripted commit'

Write-Output '';
Write-Output "Pulling latest from git..."
git pull origin main

Write-Output '';
Write-Output "Pushing latest to git..."
git push origin main

Write-Output '';
Write-Host 'Finished!';
Start-Sleep -Seconds 1
```

### Switching GitHub account on a developer computer

This command will allow you to switch the account when working with Git in the command prompt:

```git
git config credential.username new@account.com
```

However, this pops up the Git window to sign-in each time you run a git command.  To avoid the prompt pop-up, pick the access token method in the pop-up and paste it in for your account.  The pop-up shouldn't come up again.

Also, it's worthwhile to change your default branch to main from master, as that's the new GitHub default branch name.

```git
git config --list
git config --global init.defaultbranch main
```

### Ignoring files during deployments

A yml file dictates how your app deployment behaves.  An app update should not occur when the yml file is itself updated because the yml file doesn't change how the app works.  

Here's a sample yml file that has the ignore directive.  When repo push occurs, anything under the directory .github will not cause the app to deploy (the build and deploy job part of the yml is not shown):

```yml
on:
  push:
    paths-ignore:
      - '.github/**'
    branches:
      - main
```


<hr>